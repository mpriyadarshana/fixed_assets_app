part of 'verification_list_bloc.dart';

sealed class VerificationListState {}

final class VerificationListInitial extends VerificationListState {}

class VerificationListLoadingState extends VerificationListState {}

class VerificationListGetSuccessfulState extends VerificationListState {
  final List<Datum> verificationListResponse;

  VerificationListGetSuccessfulState({required this.verificationListResponse});
}

class VerificationListResponseGetFailedState extends VerificationListState {
  final String error;

  VerificationListResponseGetFailedState({required this.error});
}

