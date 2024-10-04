import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/router/routes.dart';
import 'package:test_shop_task/core/screen/base_form_page.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/assets_catalog.dart';
import 'package:test_shop_task/features/auth/presentation/mixins/auth_by_phone_mixin.dart';
import 'package:test_shop_task/features/auth/presentation/provider/auth_provider.dart';
import 'package:test_shop_task/features/auth/presentation/provider/state/auth_state.dart';

class AuthByPhonePage extends BasePage {
  const AuthByPhonePage({
    super.key,
    super.title = 'Авторизация',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AuthByPhonePageState();
}

class AuthByPhonePageState extends BaseFormPageState<AuthByPhonePage>
    with AuthByPhoneMixin {
  @override
  Widget buildFormBody(BuildContext context) {
    ref.watch(authNotifierProvider.notifier);
    listenForState();
    return Column(
      children: [
        const SizedBox(height: 50),
        Image.asset(AssetsCatalog.logo, height: 160),
        const SizedBox(height: 100),
        TextFormField(
          controller: phoneController,
          inputFormatters: [maskFormatter],
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            hintText: '+7 (988) 756-55-55',
          ),
          onFieldSubmitted: (value) => trySubmitForm(),
          validator: validatePhone,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => trySubmitForm(),
          child: const Text('Отправить СМС код'),
        ),
      ],
    );
  }

  void listenForState() {
    ref.listen(
      authNotifierProvider,
      (previous, next) {
        if (next is Success) {
          PhoneConfirmRoute(phoneNumber: phoneController.text).push(context);
        }
      },
    );
  }

  @override
  Future<void> submitForm() async {
    showLoadingIndicator();
    await sendSmsCode();
    hideLoadingIndicator();
  }
}
