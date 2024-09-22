import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/features/auth/presentation/provider/auth_provider.dart';
import 'package:test_shop_task/features/auth/presentation/provider/state/auth_state.dart';
import 'package:test_shop_task/features/navigation/bottom_navigation.dart';

class AuthByPhonePage extends ConsumerWidget {
  const AuthByPhonePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(authNotifierProvider.notifier);
    ref.listen(
      authNotifierProvider,
      (previous, next) {
        if (next is Success) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BottomNavigation()),
            (route) => false,
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
