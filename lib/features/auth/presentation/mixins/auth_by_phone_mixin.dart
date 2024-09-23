import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/auth/presentation/provider/auth_provider.dart';

mixin AuthByPhoneMixin<T extends BasePage> on BasePageState<T> {
  late final pageModel = ref.read(authNotifierProvider.notifier);
  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  bool isFormSubmitting = false;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  Future<void> sendSmsCode() async {
    await pageModel.sendSmsCode(phoneController.text.trim());
  }

  Future<void> login(String phone) async {
    await pageModel.loginUser(
      phone,
      codeController.text.trim(),
    );
  }

  String? validatePhone(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Необходимо заполнить номер телефона';
    }
    return null;
  }

  String? validateCode(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Введите код';
    }
    return null;
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

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    super.dispose();
  }
}
