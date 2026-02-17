import 'dart:ui';

import 'package:fixed_assets_app/features/data/models/request/modify_item_request.dart';
import 'package:fixed_assets_app/features/presentation/bloc/item/item_bloc.dart';
import 'package:fixed_assets_app/features/presentation/views/home_page.dart';
import 'package:fixed_assets_app/features/presentation/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/app_styles.dart';
import '../widgets/custom_form_field.dart';

class ItemEditView extends StatefulWidget {
  final String itemId;
  final String model;
  final String serialNo;
  final String? description;

  const ItemEditView({
    super.key,
    required this.itemId,
    required this.model,
    required this.serialNo,
    this.description,
  });

  @override
  State<ItemEditView> createState() => _ItemEditViewState();
}

class _ItemEditViewState extends State<ItemEditView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  String remarks = '';

  final ItemBloc bloc = ItemBloc();

  bool _isProgressShow = false;

  @override
  void initState() {
    super.initState();
    _modelController.text = widget.model;
    _serialNoController.text = widget.serialNo;
    _descriptionController.text = widget.description ?? '';
    _remarkController.text = remarks;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return BlocListener<ItemBloc, ItemState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is ItemLoadingState) {
          showProgress();
        } else if (state is ModifyItemSuccessState) {
          hideProgressBar();
          Navigator.pop(context);
        } else if (state is ModifyItemFailedState) {
          hideProgressBar();
          CustomDialogBox.show(context,
              image: false,
              title: 'Failed',
              message: 'Unable to modify the item !',
              isTwoButton: false,
              positiveButtonText: 'Okay', positiveButtonTap: () {
            Navigator.pop(context);
          });
        } else {
          hideProgressBar();
          CustomDialogBox.show(context,
              image: false,
              title: 'Failed',
              message: 'Something went wrong ! Please try again later..',
              isTwoButton: false,
              positiveButtonText: 'Okay', positiveButtonTap: () {
                Navigator.pop(context);
              });
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffc8c8c8),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Edit Item',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.78,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Item Id : ${widget.itemId}',
                                        style: AppStyles.mediumTextSize14Black
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Image',
                                    style: AppStyles.semiBoldTextSize14White
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: const Color(0xffCACAcd),
                                          width: 2),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(19),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1600443546015-f9b924a5b416?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcHV0ZXIlMjBkZXNrfGVufDB8fDB8fHww',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Model Number',
                                    style: AppStyles.semiBoldTextSize14White
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomFormField(
                                    controller: _modelController,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Serial Number',
                                    style: AppStyles.semiBoldTextSize14White
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomFormField(
                                    controller: _serialNoController,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Description',
                                    style: AppStyles.semiBoldTextSize14White
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomFormField(
                                    controller: _descriptionController,
                                    isParagraph: true,
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        'Remarks  ',
                                        style: AppStyles.semiBoldTextSize14White
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                      ),
                                      Text(
                                        '(Optional)',
                                        style: AppStyles.lightTextSize12White
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  CustomFormField(
                                    controller: _remarkController,
                                    isParagraph: true,
                                  ),
                                  const SizedBox(height: 25),
                                  Material(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              CustomDialogBox.show(
                                                context,
                                                image: false,
                                                title:
                                                    'Are you sure to discard your changes ?',
                                                negativeButtonText: 'No',
                                                positiveButtonText: 'Yes',
                                                positiveButtonTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                                negativeButtonTap: () {
                                                  Navigator.pop(context);
                                                },
                                              );
                                            },
                                            style: const ButtonStyle(
                                              padding: WidgetStatePropertyAll(
                                                EdgeInsets.symmetric(
                                                  vertical: 15,
                                                ),
                                              ),
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                Colors.redAccent,
                                              ),
                                              elevation:
                                                  WidgetStatePropertyAll(2),
                                            ),
                                            child: Text(
                                              'cancel',
                                              style: AppStyles
                                                  .mediumTextSize14Black
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              CustomDialogBox.show(
                                                context,
                                                image: true,
                                                title:
                                                    'Are you sure to save your changes ?',
                                                negativeButtonText: 'No',
                                                positiveButtonText: 'Yes',
                                                positiveButtonTap: () {
                                                  Navigator.pop(context);
                                                  bloc.add(
                                                    ModifyItemEvent(
                                                      request:
                                                          ModifyItemRequest(
                                                        data: Datas(
                                                          id: widget.itemId,
                                                          description:
                                                              _descriptionController
                                                                  .text,
                                                          model:
                                                              _modelController
                                                                  .text,
                                                          serialNo:
                                                              _serialNoController
                                                                  .text,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                negativeButtonTap: () {
                                                  Navigator.pop(context);
                                                },
                                              );
                                            },
                                            style: const ButtonStyle(
                                              padding: WidgetStatePropertyAll(
                                                EdgeInsets.symmetric(
                                                  vertical: 15,
                                                ),
                                              ),
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                Colors.green,
                                              ),
                                              elevation:
                                                  WidgetStatePropertyAll(2),
                                            ),
                                            child: Text(
                                              'Save',
                                              style: AppStyles
                                                  .mediumTextSize14Black
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
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
        ),
      ),
    );
  }

  void showProgress() {
    if (!_isProgressShow) {
      setState(() {
        _isProgressShow = true;
      });

      showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionBuilder: (context, a1, a2, widget) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    alignment: FractionalOffset.center,
                    child: Wrap(
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: 150,
                          width: 150,
                          // child: CircularProgressIndicator(),
                          child: Lottie.asset('assets/lottie/loading3.json'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Container();
        },
      );
    }
  }

  void hideProgressBar() {
    if (_isProgressShow) {
      Navigator.pop(context);
      _isProgressShow = false;
    }
  }
}
