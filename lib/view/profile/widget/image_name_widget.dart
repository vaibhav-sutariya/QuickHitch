import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/profile/get_profile/get_user_profile_view_model.dart';

class ImageNameWidget extends StatefulWidget {
  const ImageNameWidget({super.key});

  @override
  State<ImageNameWidget> createState() => _ImageNameWidgetState();
}

class _ImageNameWidgetState extends State<ImageNameWidget> {
  @override
  void initState() {
    super.initState();
    // Fetch user profile once the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetUserProfileViewModel>(context, listen: false)
          .getUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetUserProfileViewModel>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1.5,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  backgroundImage: Image.network(
                          provider.userProfile?.data.user.picture ?? '')
                      .image,
                ),
              ),
              SizedBox(width: 20),
              Text(
                '${provider.userProfile?.data.user.firstName} ${provider.userProfile?.data.user.lastName}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
