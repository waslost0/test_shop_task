import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/features/auth/presentation/provider/auth_provider.dart';

class AuthByPhonePage extends ConsumerWidget {
  const AuthByPhonePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(authNotifierProvider);

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
