import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/widgets/keyboard_dismisser.dart';

abstract class BasePage extends ConsumerStatefulWidget {
  final String? title;

  const BasePage({
    super.key,
    this.title,
  });
}

abstract class BasePageState<T extends BasePage> extends ConsumerState<T> {
  bool _isLoading = false;

  @protected
  bool withSafeArea = true;
  @protected
  bool resizeToAvoidBottomInset = true;
  @protected
  bool hasConnection = true;

  bool get isLoading => _isLoading;

  @override
  Widget build(BuildContext context) {
    var scaffold = buildScaffold(context);
    return decorateKeyboardUnfocusing(
      context,
      buildDecorateScaffold(
        context,
        scaffold,
      ),
    );
  }

  @protected
  Widget buildDecorateScaffold(BuildContext context, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle().copyWith(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
      ),
      child: child,
    );
  }

  @protected
  Widget buildScaffold(BuildContext context) {
    var body = buildBody(context);
    var scaffold = Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context),
      body: body,
    );
    return withSafeArea ? SafeArea(child: scaffold) : scaffold;
  }

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: buildTitle(context),
      actions: buildAppBarActions(),
    );
  }

  @protected
  Widget decorateKeyboardUnfocusing(BuildContext context, Widget child) {
    return KeyboardDismisser(child: child);
  }

  @protected
  List<Widget> buildAppBarActions() => [];

  @protected
  Widget? buildTitle(BuildContext context) {
    return widget.title?.isEmpty ?? true ? null : Text(widget.title!);
  }

  @protected
  Widget buildBody(BuildContext context);

  void hideLoadingIndicator() {
    _isLoading = false;
    if (mounted) setState(() {});
  }

  void showLoadingIndicator() {
    _isLoading = true;
    if (mounted) setState(() {});
  }

  void showMessage(String message) {
    BotToast.showText(text: message);
  }
}
