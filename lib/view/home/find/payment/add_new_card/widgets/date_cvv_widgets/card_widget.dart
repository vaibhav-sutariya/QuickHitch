import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_hitch/configs/assets/icons_assets.dart';
import 'package:quick_hitch/configs/colors/app_colors.dart';
import 'package:quick_hitch/view_model/controller/home/card_view_model/get_cards_view_model.dart';
import 'package:shimmer/shimmer.dart';

class CardWidget extends StatelessWidget {
  final GetCardsViewModel viewModel;
  const CardWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        viewModel.getCardModelLoadingLoading
            ? _shimmerWidget()
            : viewModel.cardModel?.data?.isNotEmpty ?? false
                ? SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.cardModel!.data!.length,
                      itemBuilder: (context, index) {
                        final data = viewModel.cardModel!.data![index];
                        final isSelected = viewModel.selectedCardId == data.id;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              GestureDetector(
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
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: AppColors.borderColor),
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
                                                      color:
                                                          AppColors.darkColor,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Exp. date ${data.expMonth.toString().padLeft(2, '0')}/${data.expYear}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.lightColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                if (data.isDefault ?? false)
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4,
                                                            vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.blackColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Text(
                                                      'Default',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  )
                                                else
                                                  GestureDetector(
                                                    onTap: () async {
                                                      viewModel.setDefaultCard(
                                                          data.id!);
                                                      await viewModel
                                                          .getAllCards();
                                                    },
                                                    child: Text(
                                                      'Set as default',
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .primaryColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      PopupMenuButton(
                                        padding: EdgeInsets.zero,
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
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink()
      ],
    );
  }

  Widget _shimmerWidget() {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                                width: 50,
                                height: 50,
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
                                    height: 16,
                                    width: 150,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 12,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
