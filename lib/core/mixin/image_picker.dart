import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/widgets/base_alert_dialog.dart';

typedef ImageSelectCallback = void Function(File? image);
typedef ImagesSelectCallback = void Function(List<File>? images);

mixin ImagePickerProviderStateMixin<T extends BasePage> on BasePageState<T> {
  Future<void> showImageSelector(
    ImageSource imageSource,
    ImageSelectCallback onImageSelected,
  ) async {
    final permissionGranted = await _requestPermission(
      appSettingsDialogText:
          'Разрешите доступ к ${imageSource == ImageSource.camera ? "камере" : "фото"} в настройках приложения',
      imageSource: imageSource,
      context: context,
    );
    if (!permissionGranted) return;

    final file = await ImagePicker().pickImage(
      source: imageSource,
    );
    if (file != null) onImageSelected(File(file.path));
  }

  Future<void> _showImagesSelector(
    ImageSource imageSource,
    ImagesSelectCallback onImagesSelected,
    int maxCount,
  ) async {
    final permissionGranted = await _requestPermission(
      appSettingsDialogText:
          'Разрешите доступ к файлам в настройках приложения',
      imageSource: imageSource,
      context: context,
    );
    if (!permissionGranted) return;
    final images = await ImagePicker().pickMultiImage(
      limit: maxCount,
    );
    final result = images.map((e) => File(e.path)).toList();
    onImagesSelected.call(result);
  }

  Widget _buildPickerAlertDialog(
    BuildContext context, {
    ImageSelectCallback? onFileSelected,
    ImagesSelectCallback? onImagesSelected,
    bool isMultiple = false,
    int maxCount = 1,
  }) {
    return AlertDialog(
      title: const Text('Выберите фото'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextButton(
            onPressed: () {
              context.pop();
              if (isMultiple) {
                _showImagesSelector(
                  ImageSource.gallery,
                  onImagesSelected!,
                  maxCount,
                );
              } else {
                showImageSelector(
                  ImageSource.gallery,
                  onFileSelected!,
                );
              }
            },
            child: const Text('Загрузить из галере'),
          ),
          TextButton(
            onPressed: () async {
              context.pop();
              await showImageSelector(ImageSource.camera, onFileSelected!);
            },
            child: const Text('Сделать снимок'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  Future<bool> _requestPermission({
    required BuildContext context,
    required ImageSource imageSource,
    required String appSettingsDialogText,
  }) async {
    final deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo? androidInfo;
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
    }
    final permission = imageSource == ImageSource.camera
        ? Permission.camera
        : Platform.isAndroid
            ? (androidInfo!.version.sdkInt <= 32
                ? Permission.storage
                : Permission.photos)
            : Permission.photos;

    final status = await permission.request();

    if (status.isPermanentlyDenied || status.isDenied) {
      final needToOpenSettings = await showOpenSettingsDialog(
        appSettingsDialogText,
      );

      if (needToOpenSettings) {
        await openAppSettings();
      }
      return false;
    }
    final hasPermission = status.isGranted || status.isLimited;
    return hasPermission;
  }

  void showImagePickerDialog(
    BuildContext context,
    ImageSelectCallback onImageSelected, {
    bool isMultiple = false,
    ImagesSelectCallback? onImagesSelected,
    int maxCount = 1,
  }) {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    showDialog(
      useRootNavigator: true,
      context: context,
      builder: (BuildContext context) => _buildPickerAlertDialog(
        context,
        onFileSelected: onImageSelected,
        onImagesSelected: onImagesSelected,
        isMultiple: isMultiple,
        maxCount: maxCount,
      ),
    );
  }

  Future<bool> showOpenSettingsDialog(String text) async {
    return await BaseAlertDialog.showDialog(
      title: 'Внимание',
      text: text,
      positiveButtonTitle: 'Настройки',
      negativeButtonTitle: 'Отмена',
      onPositiveButtonPressed: (context) => Navigator.of(context).pop(true),
      onNegativeButtonPressed: (context) => Navigator.of(context).pop(false),
      isPositiveDefaultActionIOS: true,
      context: context,
    );
  }
}
