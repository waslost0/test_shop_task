import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
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

class EditProfilePageState extends BasePageState<EditProfilePage>
    with EditProfileMixin<EditProfilePage> {
  @override
  Widget buildBody(BuildContext context) {
    ref.read(editProfileProvider.notifier);
    ref.watch(editProfileProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            _buildAvatar(),
            const SizedBox(height: 30),
            _buildName(),
            // _buildLastName(),
            // _buildLogin(),
            // _buildEmail(),
            // _buildPhone(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return EditProfileHeader(
      avatarUrl: pageModel.user.avatar,
      onChangeAvatarTap: () {},
    );
  }

  Widget _buildName() {
    return TextFormField(
      controller: nameController,
    );
  }

  @override
  Future<void> submitForm() {
    // TODO: implement submitForm
    throw UnimplementedError();
  }
}
