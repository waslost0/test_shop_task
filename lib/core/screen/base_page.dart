import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/theme/theme.dart';
import 'package:test_shop_task/core/widgets/keyboard_dismisser.dart';

/// Abstract class representing a base page widget for the application.
///
/// This class extends [ConsumerStatefulWidget] and provides a basic structure for building pages
/// with common functionalities like app bars, safe areas, loading indicators, and keyboard dismissal.
///
/// [T] represents the specific type of page.
abstract class BasePage extends ConsumerStatefulWidget {
  /// Optional title for the page.
  final String? title;

  /// Constructor initializes the [BasePage] with an optional title.
  const BasePage({
    super.key,
    this.title,
  });
}

/// Abstract class representing the state of a [BasePage].
///
/// This class extends [ConsumerState] and provides methods for building various parts of the page,
/// including the app bar, body, loading indicator, and handling keyboard dismissal.
///
/// [T] represents the specific type of page.
abstract class BasePageState<T extends BasePage> extends ConsumerState<T> {
  final SystemUiOverlayStyle systemUiOverlayStyle =
      ThemeBuilder.systemUiOverlayStyle;

  bool _isLoading = false;

  /// Flag indicating whether to use a [SafeArea] for the page content.
  @protected
  bool withSafeArea = true;

  /// Flag indicating whether to resize the page to avoid the bottom inset (e.g., keyboard).
  @protected
  bool resizeToAvoidBottomInset = true;

  /// Returns true if the page is currently loading, false otherwise.
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
      value: systemUiOverlayStyle,
      child: child,
    );
  }

  /// Builds the scaffold widget for the page.
  ///
  /// Includes the app bar, body, and optional safe area.
  @protected
  Widget buildScaffold(BuildContext context) {
    var body = buildBody(context);
    body = buildDecorateBody(context, body);
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
      systemOverlayStyle: ThemeBuilder.systemUiOverlayStyle,
    );
  }

  /// Decorates the body widget with a loading indicator if [isLoading] is true.
  @protected
  Widget buildDecorateBody(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        if (isLoading)
          ColoredBox(
            color: Colors.white.withOpacity(0.5),
            child: buildLoadingIndicator(),
          ),
      ],
    );
  }

  /// Decorates the page with a [KeyboardDismisser] to unfocus the keyboard on tap.
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

  Widget buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  /// Abstract method to be implemented by subclasses for building the body of the page.
  @protected
  Widget buildBody(BuildContext context);

  /// Hides the loading indicator.
  void hideLoadingIndicator() {
    _isLoading = false;
    if (mounted) setState(() {});
  }

  /// Shows the loading indicator.
  void showLoadingIndicator() {
    _isLoading = true;
    if (mounted) setState(() {});
  }

  /// Shows a message using [BotToast].
  void showMessage(String message) {
    BotToast.showText(text: message);
  }

  /// Unfocuses the keyboard.
  void unfocusKeyboard() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }
}