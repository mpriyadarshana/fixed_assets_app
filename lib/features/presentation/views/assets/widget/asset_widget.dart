import 'package:flutter/material.dart';
import 'package:fixed_assets_app/features/presentation/widgets/label_value_row.dart';
import 'package:fixed_assets_app/features/presentation/widgets/label_value_column.dart';

import '../../../../../utils/app_styles.dart';

class AssetCard extends StatelessWidget {
  final int? itemID;
  final String? code;
  final String? model;
  final String? serialNo;
  final String? description;

  const AssetCard({
    super.key,
    this.itemID,
    this.code,
    this.model,
    this.serialNo,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffc8c8c8).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        LabelValueRow(title: 'Item ID :  ', value: (itemID ?? 0).toString()),
                        LabelValueRow(title: 'Code :  ', value: (code ?? '').toString()),
                        LabelValueRow(title: 'Model No.:  ', value: model ?? ''),
                        LabelValueRow(title: 'Serial No.:  ', value: serialNo ?? ''),                  
                    ],
                  ),
                ),
              ],
            ),
            LabelValueColumn(title: 'Description:  ', value: (description ?? '').toString()),
          ],
        ),
      ),
    );
  }
}
