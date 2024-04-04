// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Repository/Api/Favourites/favourites_api.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:meta/meta.dart';
part 'add_favourites_event.dart';
part 'add_favourites_state.dart';

class AddFavouritesBloc extends Bloc<AddFavouritesEvent, AddFavouritesState> {
  late String updatedSuccessfullyMessage;
  FavouritesApi favouritesApi = FavouritesApi();

  AddFavouritesBloc() : super(AddFavouritesState()) {
    on<AddFavourites>((event, emit) async {
      try {
        updatedSuccessfullyMessage =
            await favouritesApi.addFavourites(doctorId: event.doctorId);
        final currentFavouriteStatus =
            state.favouriteStatusMap[event.doctorId] ?? false;
        final updatedFavouriteStatus = !currentFavouriteStatus;
        emit(state.copyWith(
          favouriteStatusMap: {
            ...state.favouriteStatusMap,
            event.doctorId: updatedFavouriteStatus,
          },
        ));
        Map<String, dynamic> data = jsonDecode(updatedSuccessfullyMessage);
        GeneralServices.instance.showToastMessage(data['message']);
      } catch (error) {
        print("<<<<<< ADD FAVOURITE ERROR >>>> : $error");
        GeneralServices.instance.showToastMessage(error.toString());
      }
    });

    //  initialization logic here
    on<InitializeFavouriteStatus>((event, emit) {
      final initialFavouriteStatus = event.initialFavouriteStatus;
      emit(state.copyWith(
        favouriteStatusMap: initialFavouriteStatus,
      ));
    });
  }
}
