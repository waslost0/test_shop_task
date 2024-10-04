import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/mixin/image_picker.dart';
import 'package:test_shop_task/core/screen/base_form_page.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';
import 'package:test_shop_task/features/user/presentation/mixins/edit_profile_mixin.dart';
import 'package:test_shop_task/features/user/presentation/provider/edit_profile_provider.dart';
import 'package:test_shop_task/features/user/presentation/widgets/edit_profile_header.dart';

class EditProfilePage extends BasePage {
  const EditProfilePage({
    super.key,
    super.title = 'Редактирование профиля',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => EditProfilePageState();
}

class EditProfilePageState extends BaseFormPageState<EditProfilePage>
    with EditProfileMixin<EditProfilePage>, ImagePickerProviderStateMixin {
  @override
  Widget buildFormBody(BuildContext context) {
    ref.watch(editProfileProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 40),
        _buildAvatar(),
        const SizedBox(height: 30),
        _buildName(),
        const SizedBox(height: 16),
        _buildLastName(),
        const SizedBox(height: 16),
        _buildLogin(),
        const SizedBox(height: 16),
        _buildEmail(),
        const SizedBox(height: 16),
        _buildPhone(),
        const SizedBox(height: 16),
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildAvatar() {
    return EditProfileHeader(
      avatarUrl: pageModel.user.avatar,
      photoFile: photoFile,
      onChangeAvatarTap: () => showImagePickerDialog(
        context,
        (image) {
          setState(() => photoFile = image);
        },
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(
        hintText: 'Имя',
      ),
      textInputAction: TextInputAction.next,
      validator: validateName,
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      controller: lastNameController,
      decoration: const InputDecoration(
        hintText: 'Фамилия',
      ),
      textInputAction: TextInputAction.next,
      validator: validateLastName,
    );
  }

  Widget _buildLogin() {
    return TextFormField(
      controller: loginController,
      decoration: const InputDecoration(
        hintText: 'Логин',
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: validateEmail,
    );
  }

  Widget _buildPhone() {
    return TextFormField(
      controller: phoneController,
      enabled: false,
      inputFormatters: [maskFormatter],
      decoration: const InputDecoration(
        hintText: '+7 (988) 756-55-55',
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () => trySubmitForm(),
      child: const Text('Сохранить'),
    );
  }

  @override
  Future<void> submitForm() async {
    showLoadingIndicator();
    await changeProfile();
    hideLoadingIndicator();
  }
}
