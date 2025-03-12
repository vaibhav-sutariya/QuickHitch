import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_outline_btn.dart';
import 'package:quick_hitch/configs/responsive.dart';
import 'package:quick_hitch/configs/routes/routes_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search rides',
                        hintStyle: TextStyle(
                          color: AppColors.lightColor,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: AppColors.borderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: AppColors.focusBorderColor,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Icon(
                            AntDesign.search1,
                            color: AppColors.lightColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.tune_outlined,
                  ),
                ),
              ],
            ),
          ),
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
      // body: Center(
      //   child: ElevatedButton(
      //       onPressed: () {
      //         SessionController().clearSession();
      //         if (SessionController().isLogin == false) {
      //           Navigator.pushNamedAndRemoveUntil(
      //               context, RoutesName.login, (route) => false);
      //         }
      //       },
      //       child: Text('logout')),
      // ),
    );
  }
}
