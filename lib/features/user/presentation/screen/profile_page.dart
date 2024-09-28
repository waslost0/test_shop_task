import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/router/routes.dart';
import 'package:test_shop_task/core/screen/base_page.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/widgets/base_alert_dialog.dart';
import 'package:test_shop_task/features/user/presentation/provider/profile_provider.dart';
import 'package:test_shop_task/features/user/presentation/provider/state/profile_state.dart';
import 'package:test_shop_task/features/user/presentation/widgets/avatar_image.dart';

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
  late AppModel appModel = ref.read(appModelProvider);

  @override
  List<Widget> buildAppBarActions() {
    return [
      PopupMenuButton<DetailsContextMenuItems>(
        icon: const Icon(Icons.more_vert_rounded),
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
      ),
    ];
  }

  @override
  Widget buildBody(BuildContext context) {
    final model = ref.read(profileProvider.notifier);
    final state = ref.watch(profileProvider);
    return RefreshIndicator(
      onRefresh: () => model.loginProfile(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            if (state is Loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state is Success) buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    final state = ref.watch(profileProvider) as Success;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.lightBlue.withOpacity(0.2),
        border: Border.all(color: AppColors.black),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          AvatarImage(
            state.user.avatar,
            size: 104,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildName(state),
          ),
        ],
      ),
    );
  }

  Widget _buildName(Success state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${state.user.name} ${state.user.lastname}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "ID ${state.user.id}",
        ),
        Text(
          "${state.user.phone}",
        ),
        if (state.user.email?.isNotEmpty ?? false)
          Text(
            "${state.user.email}",
          ),
      ],
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
        appModel.logout();
      },
    );
  }
}
