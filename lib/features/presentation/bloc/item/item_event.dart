part of 'item_bloc.dart';

sealed class ItemEvent {}

class GetItemEvent extends ItemEvent {
  final String itemId;

  GetItemEvent({required this.itemId});
}

class VerifyItemEvent extends ItemEvent {
  final int itemId;
  final String date;
  final String? remark;

  VerifyItemEvent({required this.itemId, required this.date, this.remark});
}

class ModifyItemEvent extends ItemEvent {
  final ModifyItemRequest request;

  ModifyItemEvent({required this.request});
}

class GetHistoryItemsEvent extends ItemEvent {}

class AddHistoryItemEvent extends ItemEvent {
  final Asset item;

  AddHistoryItemEvent(this.item);
}

class RemoveHistoryItemEvent extends ItemEvent {
  final Asset item;

  RemoveHistoryItemEvent(this.item);
}
