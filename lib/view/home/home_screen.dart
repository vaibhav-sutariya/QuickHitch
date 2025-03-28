import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/components/custom_outline_btn.dart';
import 'package:quick_hitch/configs/responsive.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';
import 'package:quick_hitch/view/home/widgets/custom_floating_action_button.dart';
import 'package:quick_hitch/view/ride/widgets/ride_toggle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(
          IconsAssets.appbar,
          width: getScreenWidth(context) * 0.1,
          height: 18,
        ),
        actions: [
          CustomOutlineBtn(
            text: 'Find',
            icon: Icons.search,
            onPressed: () =>
                Navigator.pushNamed(context, RoutesName.findRideScreen),
          ),
          const SizedBox(width: 10),
          CustomOutlineBtn(
            text: 'Post',
            icon: Icons.add,
            onPressed: () =>
                Navigator.pushNamed(context, RoutesName.postRideScreen),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 2),
          Divider(
            height: 1,
          ),
          const SizedBox(height: 10),
          RideToggleWidget(),

          // ElevatedButton(
          //   onPressed: () {
          //     SessionController().clearSession();
          //     if (SessionController().isLogin == false) {
          //       Navigator.pushNamedAndRemoveUntil(
          //           context, RoutesName.login, (route) => false);
          //     }
          //   },
          //   child: Text('logout')),
        ],
      ),
      floatingActionButton: CustomExpandableFAB(),
    );
  }
}
