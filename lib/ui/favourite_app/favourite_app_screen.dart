import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:practice_bloc/bloc/favourite_app/favourite_app_event.dart';
import 'package:practice_bloc/bloc/favourite_app/favourite_app_state.dart';
import 'package:practice_bloc/model/favourite_item_model.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {

  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        centerTitle: true,
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteItemStates>(
            builder: (context, state) {
              return Visibility(
                visible: state.temFavouriteItemList.isNotEmpty ? true : false,
                child: IconButton(onPressed: (){
                  context.read<FavouriteBloc>().add(DeleteItem());
                }, icon: Icon(Icons.delete,color: Colors.red,)),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavouriteBloc,FavouriteItemStates>(
          builder: (context,state){
            switch(state.listStatus){
              case ListStatus.loading:
                return Center(child: CircularProgressIndicator());
              case ListStatus.failure:
                return Text("something went wrong");
              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouriteItemList.length,
                    itemBuilder: (context ,index){
                      final item = state.favouriteItemList[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                              value: state.temFavouriteItemList.contains(item)? true : false,
                              onChanged: (value) {
                                if (value!) {
                                  context.read<FavouriteBloc>().add(
                                      SelectItem(item: item));
                                } else{
                                  context.read<FavouriteBloc>().add(UnSelectItem(item: item));
                                }
                              }
                          ),
                          title: Text(item.value.toString()),
                          trailing: IconButton(
                            onPressed: (){
                              FavouriteItemModel ItemModel = FavouriteItemModel(
                                  id: item.id, value: item.value,
                                  isFavourite: item.isFavourite ? false : true
                              );
                              context.read<FavouriteBloc>().add(FavouriteItem(item: ItemModel));
                            },
                            icon: Icon(
                                item.isFavourite ? Icons.favorite : Icons.favorite_outline
                            ),
                          ),
                        ),
                      );
                    });
            }

          },
        ),
      ),
    );
  }
}
