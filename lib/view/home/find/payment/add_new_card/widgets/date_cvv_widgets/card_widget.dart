import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/card_view_model/get_cards_view_model.dart';
import 'package:shimmer/shimmer.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetCardsViewModel()..getAllCards(),
      child: Consumer<GetCardsViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              viewModel.getCardModelLoadingLoading
                  ? Center(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ListView.builder(
                                itemCount: viewModel.cardModel!.data!.length,
                                itemBuilder: (context, index) {
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Container(
                                        color: AppColors.borderColor,
                                        height: 120,
                                      ),
                                    ),
                                  );
                                })),
                      ),
                    )
                  : viewModel.cardModel?.data?.isNotEmpty ?? false
                      ? SizedBox(
                          child: RefreshIndicator(
                            color: AppColors.primaryColor,
                            backgroundColor: AppColors.whiteColor,
                            onRefresh: () async {
                              await viewModel.getAllCards();
                            },
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: viewModel.cardModel!.data!.length,
                              itemBuilder: (context, index) {
                                final data = viewModel.cardModel!.data![index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: AppColors.borderColor),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: AppColors
                                                          .borderColor),
                                                ),
                                                child: SvgPicture.asset(
                                                    IconsAssets.visa)),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${data.brand} ending in ${data.last4}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .darkColor,
                                                            fontSize: 16),
                                                      ),
                                                      Icon(Icons.more_vert,
                                                          color: AppColors
                                                              .darkColor),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Exp. date ${data.expMonth.toString().padLeft(2, '0')}/${data.expYear}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .lightColor,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      if (data.isDefault ??
                                                          false)
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 4,
                                                                  vertical: 2),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .blackColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          child: Text(
                                                            'Default',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        )
                                                      else
                                                        GestureDetector(
                                                          onTap: () {
                                                            viewModel
                                                                .setDefaultCard(
                                                                    data.id!);
                                                          },
                                                          child: Text(
                                                            'Set as default',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .primaryColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}
