import 'package:flutter/material.dart';
import 'package:quick_hitch/configs/components/custom_outline_btn.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const CustomAppBar({
    super.key,
    required this.title,
    required this.isLeading,
    required this.isAction,
  });

  final String title;
  final bool isLeading;
  final bool isAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: isAction
          ? [
              CustomOutlineBtn(
                text: 'Find',
                icon: Icons.search,
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              CustomOutlineBtn(
                text: 'Post',
                icon: Icons.add,
                onPressed: () =>
                    Navigator.pushNamed(context, RoutesName.postRideScreen),
              ),
              const SizedBox(width: 16),
            ]
          : null,
    );
  }
}
