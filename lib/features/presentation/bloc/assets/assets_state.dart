part of 'assets_bloc.dart';

sealed class AssetsState {}

final class AssetsInitial extends AssetsState {}

class AssetsLoadingState extends AssetsState {}

class AssetsGetSuccessfulState extends AssetsState {
  final List<Datum> assetsDetailsResponse;

  AssetsGetSuccessfulState({required this.assetsDetailsResponse});
}

class AssetsGetFailedState extends AssetsState {
  final String error;

  AssetsGetFailedState({required this.error});
}

class VerifyAssetSuccessState extends AssetsState {}

class VerifyAssetFailedState extends AssetsState {}
