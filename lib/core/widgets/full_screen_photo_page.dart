import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_shop_task/core/model/custom_file.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/theme/assets_catalog.dart';
import 'package:test_shop_task/core/utils/platform_info.dart';
import 'package:universal_io/io.dart';

class FullscreenPhotoPage extends StatefulWidget {
  final int initialIndex;
  final List<CustomFile> items;
  final bool useHeroAnimation;
  final Function(int)? onImageChanged;

  const FullscreenPhotoPage({
    required this.items,
    super.key,
    this.initialIndex = 0,
    this.useHeroAnimation = false,
    this.onImageChanged,
  });

  static void openPage(
    BuildContext context,
    List<CustomFile> imageList, {
    int initialIndex = 0,
    bool useHeroAnimation = true,
  }) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        opaque: false,
        transitionsBuilder: (_, a1, __, child) => FadeTransition(
          opacity: a1,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (_, __, ___) {
          return FullscreenPhotoPage(
            items: imageList,
            useHeroAnimation: useHeroAnimation,
            initialIndex: initialIndex,
          );
        },
      ),
    );
  }

  @override
  FullscreenPhotoPageState createState() => FullscreenPhotoPageState();
}

class FullscreenPhotoPageState extends State<FullscreenPhotoPage>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _slidePageKey = GlobalKey<ExtendedImageSlidePageState>();

  late int _currentIndex = widget.initialIndex;
  late int _currentBuildIndex = widget.initialIndex;
  double _opacity = 1;
  late final ExtendedPageController _controller =
      ExtendedPageController(initialPage: _currentIndex);

  Animation? _doubleTapAnimation;
  late final AnimationController _doubleTapAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  VoidCallback? doubleTapAnimationListener;
  List<double> doubleTapScales = <double>[0.9, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSlidePage(context),
      appBar: buildAppBar(context),
      backgroundColor: Colors.transparent,
      key: _scaffoldKey,
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightBlack.withOpacity(_opacity),
      centerTitle: PlatformInfo.isIOS,
      title: Text(
        prepareTitle(),
        style: AppTextStyle.title.copyWith(
          color: AppColors.white.withOpacity(_opacity),
        ),
      ),
      leading: buildAppBarLeading(context),
    );
  }

  Widget buildAppBarLeading(BuildContext context) {
    return IconButton(
      color: AppColors.white.withOpacity(_opacity),
      icon: const Icon(Icons.close),
      onPressed: () => context.pop(),
    );
  }

  Widget _buildSlidePage(BuildContext context) {
    return ExtendedImageSlidePage(
      key: _slidePageKey,
      slideAxis: SlideAxis.vertical,
      resetPageDuration: const Duration(milliseconds: 150),
      slideEndHandler: (
        offset, {
        ExtendedImageSlidePageState? state,
        ScaleEndDetails? details,
      }) {
        final size = MediaQuery.sizeOf(context);
        return offset.dy.abs() > (size.height / 5.5);
      },
      slideScaleHandler: (Offset offset, {ExtendedImageSlidePageState? state}) {
        final scale = offset.dy.abs() / (context.size!.height / 2.0);
        const minScaleFactor = 0.6;
        return max(1.0 - scale, minScaleFactor);
      },
      onSlidingPage: (state) {
        setState(() {
          _opacity = _calculateOpacity(
            pageOffset: state.offset,
            pageSize: state.pageSize,
            forBackground: false,
          );
        });
      },
      slidePageBackgroundHandler: (Offset offset, Size size) {
        final opacity = _calculateOpacity(
          pageOffset: offset,
          pageSize: size,
          forBackground: true,
        );
        return Colors.black.withOpacity(opacity);
      },
      child: _buildPageView(context),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return ExtendedImageGesturePageView.builder(
      itemBuilder: _buildImageWidget,
      itemCount: widget.items.length,
      onPageChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      controller: _controller,
      physics: const BouncingScrollPhysics(),
      canScrollPage: (details) {
        return true;
      },
    );
  }

  Widget _buildImageWidget(BuildContext context, int index) {
    _currentBuildIndex = index;
    final photoItem = widget.items[index];

    if (photoItem.url != null) {
      return ExtendedImage.network(
        photoItem.url ?? '',
        fit: BoxFit.contain,
        mode: ExtendedImageMode.gesture,
        enableSlideOutPage: true,
        heroBuilderForSlidingPage:
            widget.useHeroAnimation ? _buildHeroForSlidingPage : null,
        initGestureConfigHandler: _prepareGestureConfig,
        onDoubleTap: onDoubleTap,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return _buildIndicator();
            case LoadState.completed:
              return state.completedWidget;
            case LoadState.failed:
              return _buildIndicator();
          }
        },
      );
    }

    return ExtendedImage.file(
      File(photoItem.file?.path ?? AssetsCatalog.placeholder),
      fit: BoxFit.contain,
      mode: ExtendedImageMode.gesture,
      enableSlideOutPage: true,
      heroBuilderForSlidingPage:
          widget.useHeroAnimation ? _buildHeroForSlidingPage : null,
      initGestureConfigHandler: _prepareGestureConfig,
    );
  }

  Widget _buildIndicator() {
    return PlatformInfo.isIOS
        ? const CupertinoActivityIndicator(
            radius: 20,
            color: AppColors.updatingIndicatorColor,
          )
        : const Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                color: AppColors.updatingIndicatorColor,
              ),
            ),
          );
  }

  Hero _buildHeroForSlidingPage(Widget childOfHero) {
    return Hero(
      tag: widget.items[_currentBuildIndex].fileId.toString(),
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        final hero = flightDirection == HeroFlightDirection.pop
            ? fromHeroContext.widget as Hero
            : toHeroContext.widget as Hero;
        return hero.child;
      },
      child: childOfHero,
    );
  }

  void onDoubleTap(ExtendedImageGestureState state) {
    final pointerDownPosition = state.pointerDownPosition;
    final begin = state.gestureDetails?.totalScale ?? 1.0;
    double end;

    //remove old
    if (doubleTapAnimationListener != null) {
      _doubleTapAnimation?.removeListener(doubleTapAnimationListener!);
    }

    //stop pre
    _doubleTapAnimationController
      ..stop()
      ..reset();

    if (begin == doubleTapScales[0]) {
      end = doubleTapScales[1];
    } else {
      end = doubleTapScales[0];
    }

    doubleTapAnimationListener = () {
      //print(_animation.value);
      state.handleDoubleTap(
        scale: _doubleTapAnimation?.value,
        doubleTapPosition: pointerDownPosition,
      );
    };
    _doubleTapAnimation = _doubleTapAnimationController
        .drive(Tween<double>(begin: begin, end: end));

    _doubleTapAnimation?.addListener(doubleTapAnimationListener!);

    _doubleTapAnimationController.forward();
  }

  GestureConfig _prepareGestureConfig(ExtendedImageState state) {
    return GestureConfig(
      minScale: 0.9,
      animationMinScale: 0.7,
      maxScale: 3,
      animationMaxScale: 3.5,
      initialScale: 0.9,
      inPageView: true,
    );
  }

  String prepareTitle() {
    if (widget.items.length == 1) {
      return 'Просмотр фото';
    }
    return 'Фото ${_currentIndex + 1}/${widget.items.length}';
  }

  double _calculateOpacity({
    required Offset pageOffset,
    required Size pageSize,
    required bool forBackground,
  }) {
    // AppBar может быть полностью черным, а фон всегда прозрачен
    final opacityMaxValue = forBackground ? 0.7 : 1.0;
    final opacity = 1.5 * pageOffset.dy.abs() / (pageSize.height / 2.0);
    return min(1, max(opacityMaxValue - opacity, 0));
  }
}
