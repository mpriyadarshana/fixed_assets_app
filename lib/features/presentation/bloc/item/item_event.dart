part of 'item_bloc.dart';

sealed class ItemEvent {}

class GetItemEvent extends ItemEvent {
  final String itemId;

  GetItemEvent({required this.itemId});
}

class VerifyItemEvent extends ItemEvent {
  final int itemId;
  final String date;

  VerifyItemEvent({required this.itemId, required this.date});
}

class ModifyItemEvent extends ItemEvent {
  final ModifyItemRequest request;

  ModifyItemEvent({required this.request});
}

class GetHistoryItemsEvent extends ItemEvent {}

class AddHistoryItemEvent extends ItemEvent {
  final Datum item;

  AddHistoryItemEvent(this.item);
}

class RemoveHistoryItemEvent extends ItemEvent {
  final Datum item;

  RemoveHistoryItemEvent(this.item);
}
