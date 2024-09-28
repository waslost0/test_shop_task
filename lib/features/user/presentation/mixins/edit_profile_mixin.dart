import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/utils/string_validator.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';
import 'package:test_shop_task/features/user/presentation/provider/edit_profile_provider.dart';

mixin EditProfileMixin<T extends BasePage> on BasePageState<T> {
  late final pageModel = ref.read(editProfileProvider.notifier);

  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  late final TextEditingController nameController = TextEditingController(
    text: pageModel.user.name,
  );
  late final TextEditingController lastNameController = TextEditingController(
    text: pageModel.user.lastname,
  );
  late final TextEditingController loginController = TextEditingController(
    text: pageModel.user.login,
  );
  late final TextEditingController emailController = TextEditingController(
    text: pageModel.user.email,
  );
  late final TextEditingController phoneController = TextEditingController(
    text: maskFormatter.maskText(pageModel.user.phone ?? ""),
  );
  File? photoFile;

  String? validateName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Необходимо заполнить Имя';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Необходимо заполнить Фимилию';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Необходимо заполнить Email';
    }
    if (!StringValidator.validateEmail(email: value!)) {
      return "Введите корректный e-mail";
    }
    return null;
  }


  Future<void> changeProfile() async {
    final success = await pageModel.changeProfile(
      UserEntity(
        id: pageModel.user.id,
        email: emailController.text.trim(),
        lastname: lastNameController.text.trim(),
        login: loginController.text.trim(),
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        file: photoFile,
      ),
    );
    if (success && mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    lastNameController.dispose();
    loginController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
