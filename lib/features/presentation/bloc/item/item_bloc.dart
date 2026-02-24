import 'package:dio/dio.dart';
import 'package:fixed_assets_app/features/data/models/request/verify_item_request.dart';
import 'package:fixed_assets_app/features/data/models/response/item_details_reponse.dart';
import 'package:fixed_assets_app/features/data/repositories/repository.dart';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/model/asset.dart';
import '../../../data/models/request/modify_item_request.dart';

part 'item_event.dart';

part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final Dio dio = Dio();

  ItemBloc() : super(ItemInitial()) {
    on<GetItemEvent>(_getItem);
    on<VerifyItemEvent>(_verifyItem);
    on<GetHistoryItemsEvent>(_getHistoryItems);
    on<ModifyItemEvent>(_modifyItem);
  }

  Future<void> _getItem(GetItemEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoadingState());
    print('loading...');
    print('${AppConstants.baseUrl}api/item/${event.itemId}');
    try {
      final response = await dio.get(
        '${AppConstants.baseUrl}api/item/${event.itemId}',
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.jwtToken}",
            "Accept": "application/json"
          },
        ),
      );

      print('receive item response');
      print(response);

      if (response.statusCode == 200) {

        print('Data : ${response.data['data'][0]}');

        Asset res = ItemDetailsResponse.fromJson(response.data).data[0];
        print("----------------------${response.statusCode}++++++++++++++++++++++++++++++++");

        await Repository.saveItem(res);
        emit(ItemGetSuccessfulState(itemDetailsResponse: res));
      }
      else
      {
        print("error : " + response.statusCode.toString());
      }


    } catch (e) {
      emit(ItemGetFailedState(error: e.toString()));
    }
  }

  Future<void> _verifyItem(
      VerifyItemEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoadingState());
    print('loading...');
    try {
      final response = await dio.post(
        '${AppConstants.baseUrl}api/verification',
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.jwtToken}",
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
        data: VerifyItemRequest(
          data: Data(
              itemId: event.itemId,
              verification: 'success',
              date: event.date,
              remarks: event.remark ?? ''),
        ),
      );

      print('done ${response.statusCode}');
      if (response.statusCode == 205) {
        print(
            "----------------------${response.data}++++++++++++++++++++++++++++++++");
        emit(VerifyItemSuccessState());
      }
      else{
        emit(VerifyItemFailedState());
      }
    } catch (e) {
      emit(VerifyItemFailedState());
    }
  }

  Future<void> _getHistoryItems(
      GetHistoryItemsEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoadingState());
    try {
      final response = await Repository.getItems();


      print('done ${response.length} --- ${AppConstants.historyItems.length}');

      emit(GetLocalHistorySuccessState(historyItems: response));

    } catch (e) {
      emit(VerifyItemFailedState());
    }
  }

  Future<void> _modifyItem(
      ModifyItemEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoadingState());
    print('loading...');
    try {
      final response = await dio.put(
        '${AppConstants.baseUrl}api/item/${event.request.data.id}',
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.jwtToken}",
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
        data: modifyItemRequestToJson(event.request),
      );

      print('done ${response.statusCode}');
      if (response.statusCode == 205) {
        print(
            "----------------------${response.data}++++++++++++++++++++++++++++++++");
        emit(ModifyItemSuccessState());
      }
    } catch (e) {
      emit(ModifyItemFailedState());
    }
  }
}
