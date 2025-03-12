import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/configs/components/custom_divider.dart';
import 'package:quick_hitch/view_model/controller/home/recent_search_view_model.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecentSearchViewModel()..recentSearches(),
      child: Consumer<RecentSearchViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Recent Searches (${viewModel.recentSearch?.data?.length ?? 0})",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              viewModel.recentSearch?.data?.isNotEmpty ?? false
                  ? SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: viewModel.recentSearch!.data!.length,
                        itemBuilder: (context, index) {
                          final data = viewModel.recentSearch!.data![index];
                          return Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  '${data.origin.toString().split(',')[0]} to ${data.destination.toString().split(',')[0]}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkColor,
                                  ),
                                ),
                              ),
                              CustomDivider(),
                            ],
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text("No recent searches available"),
                    ),
            ],
          );
        },
      ),
    );
  }
}
