import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/utils/string_validator.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';
import 'package:test_shop_task/features/user/presentation/provider/edit_profile_provider.dart';

mixin EditProfileMixin<T extends BasePage> on BasePageState<T> {
  late final pageModel = ref.read(editProfileProvider.notifier);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  bool isFormSubmitting = false;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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

  Future<void> changeProfile() async {
    final success = await pageModel.changeProfile(
      UserEntity(
        id: pageModel.user.id,
        email: emailController.text.trim(),
        lastname: lastNameController.text.trim(),
        login: loginController.text.trim(),
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        // file:
      ),
    );
    if (success && mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
