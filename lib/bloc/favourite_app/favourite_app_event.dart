import 'package:equatable/equatable.dart';
import 'package:practice_bloc/model/favourite_item_model.dart';

abstract class FavouriteEvents extends Equatable{
  const FavouriteEvents();

  @override
  List<Object> get props => [];

}

class FetchFavouriteList extends FavouriteEvents{}

class FavouriteItem extends FavouriteEvents{
  final FavouriteItemModel item;
  FavouriteItem({required this.item});

}

class SelectItem extends FavouriteEvents{
  final FavouriteItemModel item;
  SelectItem({required this.item});
}

class UnSelectItem extends FavouriteEvents{
  final FavouriteItemModel item;
  UnSelectItem({required this.item});
}

class DeleteItem extends FavouriteEvents{}





