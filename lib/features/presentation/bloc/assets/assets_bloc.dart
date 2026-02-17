import 'package:dio/dio.dart';
import 'package:fixed_assets_app/features/data/models/response/assets_reponse.dart';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'assets_event.dart';

part 'assets_state.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final Dio dio = Dio();

  AssetsBloc() : super(AssetsInitial()) {
    on<GetAssetsEvent>(_getAsstes);
  }

  Future<void> _getAsstes(GetAssetsEvent event, Emitter<AssetsState> emit) async {
    emit(AssetsLoadingState());
    print('loading...');
    print('${AppConstants.baseUrl}api/asset?username=${event.username}');
    try {
      final response = await dio.get(
        '${AppConstants.baseUrl}api/asset?username=${event.username}',
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.jwtToken}",
            "Accept": "application/json"
          },
        ),
      );

      print('receive assets response');
      print(response);

      if (response.statusCode == 200) {

        print('Data : ${response.data['data'][0]}');

        List<Datum> res = AssetsDetailsResponse.fromJson(response.data).data;
        print("----------------------${response.statusCode}++++++++++++++++++++++++++++++++");

        //await Repository.saveItem(res);
        emit(AssetsGetSuccessfulState(assetsDetailsResponse: res));
      }
      else
      {
        print("error : " + response.statusCode.toString());
      }


    } catch (e) {
      emit(AssetsGetFailedState(error: e.toString()));
    }
  }
}
