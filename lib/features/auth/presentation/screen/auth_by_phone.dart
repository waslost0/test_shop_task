import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
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

class AuthByPhonePageState extends BasePageState {
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
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(),
          ElevatedButton(
            onPressed: () {
              model.loginUser('79999999999', "1234");
            },
            child: const Text('Test login'),
          ),
        ],
      ),
    );
  }
}
