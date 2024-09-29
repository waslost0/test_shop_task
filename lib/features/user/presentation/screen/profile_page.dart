import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/router/routes.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/utils/date_time_extension.dart';
import 'package:test_shop_task/core/widgets/base_alert_dialog.dart';
import 'package:test_shop_task/features/user/presentation/provider/profile_provider.dart';
import 'package:test_shop_task/features/user/presentation/provider/state/profile_state.dart';
import 'package:test_shop_task/features/user/presentation/widgets/user_header.dart';

enum DetailsContextMenuItems {
  edit,
  delete,
  logout,
}

class ProfilePage extends BasePage {
  const ProfilePage({
    super.key,
    super.title = ' Профиль',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends BasePageState<ProfilePage> {
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(
    horizontal: 16,
  );

  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  SystemUiOverlayStyle get systemUiOverlayStyle =>
      super.systemUiOverlayStyle.copyWith(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            systemStatusBarContrastEnforced: true,
            statusBarIconBrightness: Brightness.light,
          );

  @override
  bool get withSafeArea => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  Widget buildProfileActions() {
    return PopupMenuButton<DetailsContextMenuItems>(
      icon: const Icon(
        Icons.more_vert_rounded,
        color: AppColors.white,
      ),
      onSelected: (value) {
        switch (value) {
          case DetailsContextMenuItems.edit:
            editProfile();
            break;
          case DetailsContextMenuItems.delete:
            break;
          case DetailsContextMenuItems.logout:
            logout();
            break;
        }
      },
      itemBuilder: (popUpContext) {
        return [
          const PopupMenuItem(
            value: DetailsContextMenuItems.edit,
            child: Text('Редактировать'),
          ),
          const PopupMenuItem(
            value: DetailsContextMenuItems.delete,
            child: Text('Удалить'),
          ),
          const PopupMenuItem(
            value: DetailsContextMenuItems.logout,
            child: Text(
              'Выйти',
            ),
          ),
        ];
      },
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    final model = ref.read(profileProvider.notifier);
    final state = ref.watch(profileProvider);
    if (state is Loading) {
      return buildLoadingIndicator();
    }
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () => model.loginProfile(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 16),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                if (state is Success) buildContent(context),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 0,
          child: SafeArea(child: buildProfileActions()),
        ),
      ],
    );
  }

  Widget buildContent(BuildContext context) {
    final state = ref.watch(profileProvider) as Success;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UserHeader(user: state.user),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: horizontalPadding,
                child: Text(
                  'Информация',
                  style:
                      AppTextStyle.body3.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              if (state.user.phone?.isNotEmpty ?? false) ...[
                buildItemRow(
                  maskFormatter.maskText(state.user.phone!),
                  'Телефон',
                ),
                Divider(endIndent: 16, indent: 16),
              ],
              if (state.user.email?.isNotEmpty ?? false) ...[
                buildItemRow(
                  state.user.email!,
                  'Email',
                ),
                Divider(endIndent: 16, indent: 16),
              ],
              if (state.user.login?.isNotEmpty ?? false) ...[
                buildItemRow(
                  state.user.login!,
                  'Username',
                ),
                Divider(endIndent: 16, indent: 16),
              ],
              if (state.user.dateOfBirth != null) ...[
                buildItemRow(
                  state.user.dateOfBirth!.formatDate(),
                  'Дата рождения',
                ),
                Divider(endIndent: 16, indent: 16),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget buildItemRow(
    String title,
    String description,
  ) {
    return InkWell(
      highlightColor: Colors.white10,
      onTap: () => Clipboard.setData(ClipboardData(text: title)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: horizontalPadding.copyWith(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.body.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: AppTextStyle.body.copyWith(
                fontSize: 14,
                color: AppColors.primaryColor.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void editProfile() {
    const EditProfileRouteData().push(context);
  }

  void logout() async {
    await BaseAlertDialog.showDialog(
      context: context,
      text: 'Вы уверены, что хотите выйти?',
      onNegativeButtonPressed: (context) => context.pop(false),
      onPositiveButtonPressed: (context) {
        context.pop(true);
        ref.read(appModelProvider).logout();
      },
    );
  }
}
