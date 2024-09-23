import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/features/auth/presentation/mixins/auth_by_phone_mixin.dart';
import 'package:test_shop_task/features/auth/presentation/provider/auth_provider.dart';
import 'package:test_shop_task/features/auth/presentation/provider/state/auth_state.dart';
import 'package:test_shop_task/features/navigation/bottom_navigation.dart';

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
    final model = ref.watch(authNotifierProvider.notifier);
    ref.listen(
      authNotifierProvider,
      (previous, next) {
        if (next is Success) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BottomNavigation()),
            (route) => route.isFirst,
          );
        }
      },
    );
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const FlutterLogo(size: 150),
            const Spacer(),
            const SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              validator: (value) {
                return "test";
              },
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

  @override
  Future<void> submitForm() async {
    await sendSmsCode();
  }
}
