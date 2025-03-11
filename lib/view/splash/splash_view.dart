import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/view_model/services/splash/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          IconsAssets.splashScreen,
          height: 100,
        ),
      ),
    );
  }
}
