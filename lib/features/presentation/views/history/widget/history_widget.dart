import 'package:flutter/material.dart';

import '../../../../../utils/app_styles.dart';

class HistoryCard extends StatelessWidget {
  final int? itemID;
  final String? model;
  final String? serialNo;
  final String? description;

  const HistoryCard({
    super.key,
    this.itemID,
    this.model,
    this.serialNo,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffCADADA).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.shopify.com/s/files/1/0073/0169/3551/files/playstation-legend-pedestal-2021029_1_abf77133-6820-4c4a-b19b-84fc0b491173.jpg?v=1697461959'),
                  radius: 30,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Item ID :  ',
                          style: AppStyles.boldTextSize14White.copyWith(
                            color: const Color(0xff5c5c5c),
                          ),
                        ),
                        Text(
                          (itemID ?? 0).toString(),
                          style: AppStyles.mediumTextSize14Black.copyWith(
                            color: const Color(0xff5c5c5c),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'Model Number :  ',
                          style: AppStyles.boldTextSize14White.copyWith(
                            color: const Color(0xff5c5c5c),
                          ),
                        ),
                        Text(
                          model ?? '',
                          style: AppStyles.mediumTextSize14Black.copyWith(
                              color: const Color(0xff5c5c5c), fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'Serial Number :  ',
                          style: AppStyles.boldTextSize14White.copyWith(
                            color: const Color(0xff5c5c5c),
                          ),
                        ),
                        Text(
                          serialNo ?? '',
                          style: AppStyles.mediumTextSize14Black.copyWith(
                              color: const Color(0xff5c5c5c), fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Description :',
              style: AppStyles.boldTextSize14White.copyWith(
                color: const Color(0xff5c5c5c),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description ?? '',
              style: AppStyles.mediumTextSize14Black.copyWith(
                color: const Color(0xff5c5c5c),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
