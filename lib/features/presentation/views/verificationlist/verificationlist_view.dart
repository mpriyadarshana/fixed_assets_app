import 'package:fixed_assets_app/features/presentation/views/verificationlist/widget/list_asset_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_styles.dart';
import '../../../data/models/model/asset.dart';
import '../../../data/models/response/verification_list_reponse.dart';


class VerificationlistView extends StatefulWidget {
  final List<dynamic> locationgroups;

  const VerificationlistView({super.key, required this.locationgroups});

  @override
  State<VerificationlistView> createState() => _VerificationlistViewState();
}

class _VerificationlistViewState extends State<VerificationlistView> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffc8c8c8),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Verification List',
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.78,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: widget.locationgroups.isNotEmpty
                  ?
              //itembuilders
              ListView.builder(
                itemCount: widget.locationgroups.length,
                itemBuilder: (context, locationIndex) {
                  final location = widget.locationgroups[locationIndex];

                  return ExpansionTile(
                    title: Text(
                      widget.locationgroups[locationIndex].location,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: List.generate(
                      widget.locationgroups[locationIndex].subLocations.length,
                          (subIndex) {
                        final subLocation = widget.locationgroups[locationIndex].subLocations[subIndex];

                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: ExpansionTile(
                            title: Text(
                              widget.locationgroups[locationIndex].subLocations[subIndex].name,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                              children: List.generate(
                                widget.locationgroups[locationIndex].subLocations[subIndex].assets.length,
                                    (assetIndex) {
                                  final asset = widget.locationgroups[locationIndex].subLocations[subIndex].assets[assetIndex];

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10, top: 0),
                                    child: AssetCard(
                                      itemID: widget.locationgroups[locationIndex].subLocations[subIndex].assets[assetIndex].id,
                                      code: widget.locationgroups[locationIndex].subLocations[subIndex].assets[assetIndex].code,
                                      model: widget.locationgroups[locationIndex].subLocations[subIndex].assets[assetIndex].model,
                                      serialNo: widget.locationgroups[locationIndex].subLocations[subIndex].assets[assetIndex].serialNo,
                                      description: widget.locationgroups[locationIndex].subLocations[subIndex].assets[assetIndex].description,
                                    ),
                                  );
                                },
                              ),

                          ),
                        );
                      },
                    ),


                  );
                },
              )




                  : Center(
                child: Text(
                  'No any Item Records !!',
                  style: AppStyles.regularItalicTextSize15White
                      .copyWith(color: Colors.black45, fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 15),
            child: Center(
              child: Text(
                'ARTHUR C CLARKE INSTITUTE FOR MODERN\nTECHNOLOGIES (ACCIMT)',
                style: AppStyles.mediumTextSize10.copyWith(
                  color: Colors.black.withOpacity(0.2),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
