import 'package:fixed_assets_app/features/presentation/views/assets/widget/asset_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_styles.dart';
import '../../../data/models/model/asset.dart';
import '../../../data/models/response/assets_reponse.dart';
import '../footer.dart';

class AppAssetsView extends StatefulWidget {
  final List<Asset> assets;

  const AppAssetsView({super.key, required this.assets});

  @override
  State<AppAssetsView> createState() => _AssetsViewState();
}

class _AssetsViewState extends State<AppAssetsView> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffc8c8c8),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Assets Inventory',
          style: AppStyles.semiBoldTextSize15White.copyWith(
            color: const Color(0xff5c5c5c),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xff5c5c5c),
              size: 20,
            ),
          ),
        ),
      ),
      body:
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: widget.assets.isNotEmpty
                  ? ListView.builder(
                shrinkWrap: true,
                itemCount: widget.assets.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    child: AssetCard(
                      itemID: widget.assets[index].id,
                      code: widget.assets[index].code,
                      model: widget.assets[index].model,
                      serialNo: widget.assets[index].serialNo,
                      description: widget.assets[index].description,
                    ),
                  );
                },
              )
                  : Center(
                child: Text(
                  'No any Items history records !!',
                  style: AppStyles.regularItalicTextSize15White
                      .copyWith(color: Colors.black45, fontSize: 20),
                ),
              ),
            ),
          ),
    );
  }
}
