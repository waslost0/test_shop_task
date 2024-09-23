import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/auth/presentation/provider/auth_provider.dart';
import 'package:test_shop_task/features/auth/presentation/screen/auth_by_phone.dart';

mixin AuthByPhoneMixin on BasePageState<AuthByPhonePage> {
  late final pageModel = ref.read(authNotifierProvider.notifier);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  bool isFormSubmitting = false;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  Future<void> sendSmsCode() async {
    await pageModel.sendSmsCode(phoneController.text.trim());
  }

  Future<void> login() async {
    await pageModel.loginUser(
      phoneController.text.trim(),
      codeController.text.trim(),
    );
  }

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
