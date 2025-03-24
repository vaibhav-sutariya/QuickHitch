import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/card_view_model/get_cards_view_model.dart';
import 'package:shimmer/shimmer.dart';

class CardWidget extends StatelessWidget {
  final GetCardsViewModel viewModel;
  const CardWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double paddingValue = constraints.maxWidth * 0.04; // Dynamic padding

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            viewModel.getCardModelLoadingLoading
                ? _shimmerWidget()
                : viewModel.cardModel?.data?.isNotEmpty ?? false
                    ? SizedBox(
                        width: constraints.maxWidth,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: viewModel.cardModel!.data!.length,
                          itemBuilder: (context, index) {
                            final data = viewModel.cardModel!.data![index];
                            final isSelected =
                                viewModel.selectedCardId == data.id;
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: paddingValue, vertical: 8),
                              child: GestureDetector(
                                onTap: () {
                                  viewModel.selectCard(data.id!);
                                  log('Selected Card : ${data.id}');
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: isSelected
                                        ? AppColors.primaryColor
                                            .withOpacity(0.04)
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.primaryColor
                                          : AppColors.borderColor,
                                      width: isSelected ? 2.0 : 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color:
                                                        AppColors.borderColor),
                                              ),
                                              child: SvgPicture.asset(
                                                  IconsAssets.visa,
                                                  width: constraints.maxWidth *
                                                      0.1),
                                            ),
                                            SizedBox(
                                                width: constraints.maxWidth *
                                                    0.04),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${data.brand} ending in ${data.last4}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColors.darkColor,
                                                      fontSize: constraints
                                                              .maxWidth *
                                                          0.04, // Scalable font size
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Exp. date ${data.expMonth.toString().padLeft(2, '0')}/${data.expYear}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .lightColor,
                                                          fontSize: constraints
                                                                  .maxWidth *
                                                              0.035,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.05),
                                                      if (data.isDefault ??
                                                          false)
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 6,
                                                                  vertical: 3),
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
                                                              fontSize: constraints
                                                                      .maxWidth *
                                                                  0.03,
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
                                                          onTap: () async {
                                                            viewModel
                                                                .setDefaultCard(
                                                                    data.id!);
                                                            await viewModel
                                                                .getAllCards();
                                                          },
                                                          child: Text(
                                                            'Set as default',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .primaryColor,
                                                              fontSize: constraints
                                                                      .maxWidth *
                                                                  0.03,
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
                                      PopupMenuButton(
                                        padding: EdgeInsets.zero,
                                        borderRadius: BorderRadius.circular(12),
                                        iconSize: 14,
                                        color: AppColors.whiteColor,
                                        icon: Icon(Icons.more_vert,
                                            color: AppColors.darkColor),
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            height: 40,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            value: 'delete',
                                            enabled: true,
                                            child: Row(
                                              children: [
                                                Icon(Icons.delete,
                                                    color: AppColors.redColor,
                                                    size: 18),
                                                SizedBox(width: 8),
                                                Text('Delete',
                                                    style: TextStyle(
                                                        fontSize: 14)),
                                              ],
                                            ),
                                          ),
                                        ],
                                        onSelected: (value) async {
                                          if (value == 'delete') {
                                            viewModel.deleteCard(data.id!);
                                            await viewModel.getAllCards();
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
          ],
        );
      },
    );
  }

  Widget _shimmerWidget() {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double paddingValue =
                constraints.maxWidth * 0.04; // Dynamic padding

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingValue),
              child: Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: constraints.maxWidth * 0.15,
                              height: constraints.maxWidth * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: constraints.maxWidth * 0.04,
                                  width: constraints.maxWidth * 0.4,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: constraints.maxWidth * 0.03,
                                  width: constraints.maxWidth * 0.3,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
