import 'package:fixed_assets_app/features/presentation/views/history/widget/history_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_styles.dart';
import '../../../data/models/response/item_details_reponse.dart';

class HistoryView extends StatefulWidget {
  final List<Datum> items;

  const HistoryView({super.key, required this.items});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffc8c8c8),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Scan History',
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
              child: widget.items.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5, top: 5),
                          child: HistoryCard(
                            itemID: widget.items[index].id,
                            code: widget.items[index].code,
                            model: widget.items[index].model,
                            serialNo: widget.items[index].serialNo,
                            description: widget.items[index].description,
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
