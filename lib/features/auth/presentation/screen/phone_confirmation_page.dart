import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/router/routes.dart';
import 'package:test_shop_task/core/screen/base_form_page.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/assets_catalog.dart';
import 'package:test_shop_task/features/auth/presentation/mixins/auth_by_phone_mixin.dart';
import 'package:test_shop_task/features/auth/presentation/provider/auth_provider.dart';
import 'package:test_shop_task/features/auth/presentation/provider/state/auth_state.dart';

class PhoneConfirmationFormPage extends BasePage {
  final String phoneNumber;

  const PhoneConfirmationFormPage({
    required this.phoneNumber,
    super.title = 'Введите код из СМС',
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      PhoneConfirmationFormPageState();
}

class PhoneConfirmationFormPageState
    extends BaseFormPageState<PhoneConfirmationFormPage> with AuthByPhoneMixin {
  @override
  Widget buildFormBody(BuildContext context) {
    ref.watch(authNotifierProvider.notifier);
    listenForState();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Image.asset(AssetsCatalog.logo, height: 160),
        const SizedBox(height: 100),
        buildPhoneCodeRow(context),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => trySubmitForm(),
          child: const Text('Войти'),
        ),
      ],
    );
  }

  Widget buildPhoneCodeRow(BuildContext context) {
    return TextFormField(
      controller: codeController,
      focusNode: codeFocus,
      scrollPadding: const EdgeInsets.only(
        bottom: 112,
      ),
      keyboardType: TextInputType.number,
      maxLength: 4,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        hintText: 'Введите код',
      ),
      validator: validateCode,
      onFieldSubmitted: (value) => trySubmitForm(),
      autofillHints: const [AutofillHints.oneTimeCode],
    );
  }

  void listenForState() {
    ref.listen(
      authNotifierProvider,
      (previous, next) {
        if (next is Success) {
          const CatalogRouteData().push(context);
        }
      },
    );
  }

  @override
  Future<void> submitForm() async {
    codeFocus.unfocus();
    unfocusKeyboard();
    showLoadingIndicator();
    await login(widget.phoneNumber);
    hideLoadingIndicator();
  }
}
