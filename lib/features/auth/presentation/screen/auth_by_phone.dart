import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/auth/presentation/mixins/auth_by_phone_mixin.dart';
import 'package:test_shop_task/features/auth/presentation/provider/auth_provider.dart';
import 'package:test_shop_task/features/auth/presentation/provider/state/auth_state.dart';
import 'package:test_shop_task/features/auth/presentation/screen/phone_confirmation_page.dart';

class AuthByPhonePage extends BasePage {
  const AuthByPhonePage({
    super.key,
    super.title = 'Авторизация',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AuthByPhonePageState();
}

class AuthByPhonePageState extends BasePageState<AuthByPhonePage>
    with AuthByPhoneMixin {
  @override
  Widget buildBody(BuildContext context) {
    ref.watch(authNotifierProvider.notifier);
    listenForState();
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const FlutterLogo(size: 150),
            const Spacer(),
            const SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              inputFormatters: [maskFormatter],
              decoration: const InputDecoration(
                hintText: '+7 (988) 756-55-55',
              ),
              onFieldSubmitted: (value) => trySubmitForm(context),
              validator: validatePhone,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => trySubmitForm(context),
              child: const Text('Отправить СМС код'),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  void listenForState() {
    ref.listen(
      authNotifierProvider,
      (previous, next) {
        if (next is Success) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => PhoneConfirmationFormPage(
                phoneNumber: phoneController.text,
              ),
            ),
            (route) => route.isFirst,
          );
        }
      },
    );
  }

  @override
  Future<void> submitForm() async {
    await sendSmsCode();
  }
}
