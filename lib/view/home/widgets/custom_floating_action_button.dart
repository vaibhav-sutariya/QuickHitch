import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/view_model/services/floating_action_button/floating_action_view_model.dart';

class CustomExpandableFAB extends StatelessWidget {
  const CustomExpandableFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FloatingActionViewModel(),
      child: const _ExpandableFAB(),
    );
  }
}

class _ExpandableFAB extends StatelessWidget {
  const _ExpandableFAB();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FloatingActionViewModel>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedOpacity(
          opacity: viewModel.isExpanded ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 100),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            transform:
                Matrix4.translationValues(viewModel.isExpanded ? 0 : 50, 0, 0),
            child: _FabOption(
              label: "Create Request",
              icon: Icons.edit_outlined,
              onTap: () => Navigator.pushNamed(
                  context, RoutesName.createRideRequestScreen),
            ),
          ),
        ),
        const SizedBox(height: 10),
        AnimatedOpacity(
          opacity: viewModel.isExpanded ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 120),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            transform:
                Matrix4.translationValues(viewModel.isExpanded ? 0 : 50, 0, 0),
            child: _FabOption(
              label: "Create Ride",
              icon: Icons.directions_car_outlined,
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.postRideScreen),
            ),
          ),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: viewModel.toggle,
          backgroundColor: AppColors.primaryColor,
          shape: const CircleBorder(),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Icon(
              viewModel.isExpanded ? Icons.close : Icons.add,
              key: ValueKey<bool>(
                  viewModel.isExpanded), // Ensures animation runs
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}

// FAB Option Widget
class _FabOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _FabOption({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 6),
            Icon(icon, size: 20),
          ],
        ),
      ),
    );
  }
}
