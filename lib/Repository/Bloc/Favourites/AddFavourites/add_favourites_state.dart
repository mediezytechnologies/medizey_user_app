part of 'add_favourites_bloc.dart';

class AddFavouritesState {
  Map<String, bool> favouriteStatusMap;

  AddFavouritesState({
    Map<String, bool>? favouriteStatusMap,
  }) : favouriteStatusMap = favouriteStatusMap ?? {};

  AddFavouritesState copyWith({Map<String, bool>? favouriteStatusMap}) {
    return AddFavouritesState(
      favouriteStatusMap: favouriteStatusMap ?? this.favouriteStatusMap,
    );
  }
}



