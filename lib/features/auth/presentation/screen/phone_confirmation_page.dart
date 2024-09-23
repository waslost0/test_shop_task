import 'dart:async';
import 'dart:io';

import 'package:base_flutter/auth/base_auth_form_page.dart';
import 'package:base_flutter/auth/model/phone_confirmation_form_model.dart';
import 'package:base_flutter/components/count_down_timer/count_down_timer.dart';
import 'package:base_flutter/core/page/base_page.dart';
import 'package:base_flutter/core/theme/theme_builder.dart';
import 'package:base_flutter/core/view/extension/simple_padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:sms_user_consent/sms_user_consent.dart';

class PhoneConfirmationFormPage extends BasePage {
  final String phoneNumber;

  const PhoneConfirmationFormPage({
    required this.phoneNumber,
    super.title = 'Введите код из СМС',
    super.key,
  });

  @override
  _PhoneConfirmationFormPageState createState() =>
      _PhoneConfirmationFormPageState();
}

class _PhoneConfirmationFormPageState extends BaseAuthFormPageState<
    PhoneConfirmationFormPage, PhoneConfirmationFormModel> {
  late SmsUserConsent smsUserConsent;

  static const int maxTimerValue = 60;
  late final RegExp codeRegexp;

  late CountDownTimer _repeatSmsSendingTimer;

  @override
  PhoneConfirmationFormModel? createModel() => PhoneConfirmationFormModel(
        phoneNumber: widget.phoneNumber,
        appModel: appModel,
      );

  @override
  void initState() {
    codeRegexp = RegExp('\\d{${appModel.appSettings?.codeLength ?? 0}}');
    if (Platform.isAndroid) {
      smsUserConsent = SmsUserConsent(smsListener: smsListener);
      smsUserConsent.requestSms();
    }
    _createTimer();
    _repeatSmsSendingTimer.startTimer();
    super.initState();
  }

  void _createTimer() {
    _repeatSmsSendingTimer = CountDownTimer(
      maxTimerValue: maxTimerValue,
      tickCallback: (Timer? timer) {
        setState(() {});
      },
      completeCallback: () {
        setState(() {});
      },
    );
  }

  @override
  Widget buildFormFields(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildStartInfo(context).bottomPadding(12),
        buildPhoneCodeRow(context).bottomPadding(12),
        buildSubmitButton(context).bottomPadding(8),
        _buildTimerBlock(context),
      ],
    );
  }

  Widget _buildStartInfo(BuildContext context) {
    return Text(
      'На номер ${widget.phoneNumber} отправлена '
      'СМС с кодом подтверждения телефона',
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTimerBlock(BuildContext context) {
    return GestureDetector(
      onTap: (!_repeatSmsSendingTimer.isActive) ? _resendCode : null,
      child: _repeatSmsSendingTimer.isActive
          ? Text(
              'Отправить код повторно можно будет\nчерез '
              '${_repeatSmsSendingTimer.getRemainingTime()} сек.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : Text(
              'Отправить код повторно',
              textAlign: TextAlign.center,
              style: AppTextStyle.hyperLink,
            ),
    );
  }

  Future<void> _resendCode() async {
    showLoadingIndicator();
    final success = await formModel.resendCode();
    if (success) {
      showMessage('Код отправлен повторно');
      _repeatSmsSendingTimer.startTimer();
    }
    hideLoadingIndicator();
  }

  Widget buildPhoneCodeRow(BuildContext context) {
    return TextFormField(
      controller: formModel.codeController,
      scrollPadding: const EdgeInsets.only(
        bottom: 112,
      ),
      keyboardType: TextInputType.number,
      maxLength: appModel.appSettings?.codeLength ?? 0,
      autofocus: true,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        hintText: 'Введите код',
      ),
      validator: (value) => formModel.validateCode(value),
      onFieldSubmitted: (value) => trySubmitForm(context),
      autofillHints: const [AutofillHints.oneTimeCode],
    );
  }

  Widget buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => trySubmitForm(context),
        child: const Text('Войти'),
      ),
    );
  }

  @override
  Future<void> submitForm(BuildContext context) async {
    final success = await formModel.confirmPhoneByCode();
    if (!success) {
      return;
    }
    if (formModel.isAlreadyRegistered) {
      await Navigator.of(context).pushAndRemoveUntil(
        navigationModule.homePage,
        (route) => false,
      );
    } else {
      await Navigator.of(context).pushAndRemoveUntil(
        profileModule.routes.registrationProfilePageRoute(),
        (_) => false,
      );
    }
  }

  void smsListener() {
    final match = codeRegexp.firstMatch(smsUserConsent.receivedSms.toString());
    if (match?.group(0) != null) {
      formModel.codeController.text = match?.group(0) ?? '';
      setState(() {});
    }
  }

  @override
  void dispose() {
    _repeatSmsSendingTimer.stopTimer();
    super.dispose();
  }
}
