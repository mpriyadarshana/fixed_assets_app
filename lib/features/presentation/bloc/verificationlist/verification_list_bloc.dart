import 'package:dio/dio.dart';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/model/asset.dart';
import '../../../data/models/response/verification_list_reponse.dart';


part 'verification_list_event.dart';

part 'verification_list_state.dart';

class VerificationListBloc extends Bloc<VerificationListEvent, VerificationListState> {
  final Dio dio = Dio();

  VerificationListBloc() : super(VerificationListInitial()) {
    on<GetVerificationListEvent>(_getVerificationList);
  }

  Future<void> _getVerificationList(GetVerificationListEvent event, Emitter<VerificationListState> emit) async {
    emit(VerificationListLoadingState());
    print('loading...');
    print('${AppConstants.baseUrl}api/verificationlist?username=${event.username}');
    try {
      final response = await dio.get(
        '${AppConstants.baseUrl}api/verificationlist?username=${event.username}',
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.jwtToken}",
            "Accept": "application/json"
          },
        ),
      );

      print('receive verification list response');
      //print(response);

      if (response.statusCode == 200) {

        //print('Data : ${response.data['data'][1]}');

        List<dynamic> res = VerificationListResponse.fromJson(response.data).data;
        print("----------------------${response.statusCode}++++++++++++++++++++++++++++++++");
        print(res);

        //await Repository.saveItem(res);
        emit(VerificationListGetSuccessfulState(verificationListResponse: res));
      }
      else
      {
        print("error : " + response.statusCode.toString());
      }


    } catch (e) {
      emit(VerificationListResponseGetFailedState( error: e.toString()));
    }
  }
}
