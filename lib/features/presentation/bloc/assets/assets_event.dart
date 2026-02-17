part of 'assets_bloc.dart';

sealed class AssetsEvent {}

class GetAssetsEvent extends AssetsEvent {
  final String username;

  GetAssetsEvent({required this.username});
}

class VerifyAssetEvent extends AssetsEvent {
  final int itemId;
  final String date;

  VerifyAssetEvent({required this.itemId, required this.date});
}

