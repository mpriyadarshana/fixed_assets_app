part of 'verification_list_bloc.dart';

sealed class VerificationListEvent {}

class GetVerificationListEvent extends VerificationListEvent {
  final String username;

  GetVerificationListEvent({required this.username});
}

class VerifyListAssetEvent extends VerificationListEvent {
  final int itemId;
  final String date;

  VerifyListAssetEvent({required this.itemId, required this.date});
}

