part of 'add_favourites_bloc.dart';

@immutable
sealed class AddFavouritesEvent {}

class AddFavourites extends AddFavouritesEvent {
  final String doctorId;
  final int favouriteStatus;
  AddFavourites({required this.doctorId, required this.favouriteStatus});
}

class InitializeFavouriteStatus extends AddFavouritesEvent {
  final Map<String, bool> initialFavouriteStatus;

  InitializeFavouriteStatus(this.initialFavouriteStatus);
}
