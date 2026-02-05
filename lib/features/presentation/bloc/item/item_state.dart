part of 'item_bloc.dart';

sealed class ItemState {}

final class ItemInitial extends ItemState {}

class ItemLoadingState extends ItemState {}

class ItemGetSuccessfulState extends ItemState {
  final Datum itemDetailsResponse;

  ItemGetSuccessfulState({required this.itemDetailsResponse});
}

class ItemGetFailedState extends ItemState {
  final String error;

  ItemGetFailedState({required this.error});
}

class VerifyItemSuccessState extends ItemState {}

class VerifyItemFailedState extends ItemState {}

class ModifyItemSuccessState extends ItemState {}

class ModifyItemFailedState extends ItemState {}

class GetLocalHistorySuccessState extends ItemState {
  final List<Datum> historyItems;

  GetLocalHistorySuccessState({required this.historyItems});
}
