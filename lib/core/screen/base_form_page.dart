import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_shop_task/core/screen/base_page.dart';

/// Abstract class providing a base implementation for state management of pages with forms.
///
/// This class extends [BasePageState] and adds functionalities for managing form validation,
/// submission, and loading states. It provides a basic form structure with padding and uses
/// a [GlobalKey] to access the form state.
///
/// [T] represents the specific type of page.
abstract class BaseFormPageState<T extends BasePage> extends BasePageState<T> {
  /// GlobalKey to access the form state.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Padding for the form content.
  final EdgeInsets formPadding = const EdgeInsets.all(16);

  /// Autovalidation mode for the form.
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  /// Flag indicating if the form is currently being submitted.
  bool isFormSubmitting = false;

  /// Builds the body of the page with a [SingleChildScrollView] and a [Form].
  ///
  /// Calls [buildFormBody] to build the actual form content.
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: formPadding,
      child: Form(
        key: formKey,
        child: buildFormBody(context),
      ),
    );
  }

  /// Abstract method to be implemented by subclasses for building the form content.
  Widget buildFormBody(BuildContext context);

  /// Attempts to submit the form.

  /// Validates the form, saves the form data, and calls [submitForm] if validation succeeds.
  /// Shows a loading indicator during form submission.
  @protected
  Future<void> trySubmitForm() async {
    if (isFormSubmitting || !context.mounted) {
      return;
    }
    autovalidateMode = AutovalidateMode.always;
    unfocusKeyboard();
    isFormSubmitting = true;
    if (await validate()) {
      formKey.currentState?.save();
      showLoadingIndicator();
      await submitForm();
      hideLoadingIndicator();
    } else {
      log("Form validation errors. Form don't submitted.");
    }
    isFormSubmitting = false;
  }

  /// Validates the form.
  ///
  /// Returns true if the form is valid, false otherwise.
  Future<bool> validate() async {
    return formKey.currentState?.validate() ?? false;
  }

  /// Abstract method to be implemented by subclasses for handling form submission.
  Future<void> submitForm();
}