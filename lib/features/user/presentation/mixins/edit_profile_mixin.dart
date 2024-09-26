import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/user/presentation/provider/edit_profile_provider.dart';

mixin EditProfileMixin<T extends BasePage> on BasePageState<T> {
  /*
  *
image
string($binary)
Аватар пользователя

name
string
Имя пользователя

lastname
string
Фамилия пользователя

cityId
integer
Город пользователя

dateOfBirth
integer
Дата рождения

countryId
integer
Страна пользователя

login
string
Login пользователя

email
string
Электронная почта пользователя

phone
string
Телефон пользователя */
  late final pageModel = ref.read(editProfileProvider.notifier);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController nameController = TextEditingController(
    text: pageModel.user.name,
  );

  bool isFormSubmitting = false;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? validateName(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Необходимо заполнить имя';
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
    nameController.dispose();
    super.dispose();
  }
}
