import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_shop_task/core/screen/base_page.dart';

abstract class BaseFormPageState<T extends BasePage> extends BasePageState<T> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final EdgeInsets formPadding = const EdgeInsets.all(16);

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;


  bool isFormSubmitting = false;

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

  Widget buildFormBody(BuildContext context);

  @protected
  Future<void> trySubmitForm(BuildContext context) async {
    if (isFormSubmitting || !context.mounted) {
      return;
    }
    autovalidateMode = AutovalidateMode.always;
    FocusScope.of(context).unfocus();
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

  Future<bool> validate() async {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> submitForm();
}
