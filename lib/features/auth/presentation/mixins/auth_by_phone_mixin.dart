import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/auth/presentation/provider/auth_provider.dart';

mixin AuthByPhoneMixin<T extends BasePage> on BasePageState<T> {
  late final pageModel = ref.read(authNotifierProvider.notifier);
  final FocusNode codeFocus = FocusNode();
  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => codeFocus.requestFocus(),
    );
  }

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

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    super.dispose();
  }
}
