import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_token_event.dart';
part 'fcm_token_state.dart';
part 'fcm_token_bloc.freezed.dart';

class FcmTokenBloc extends Bloc<FcmTokenEvent, FcmTokenState> {
  FcmTokenBloc() : super(_Initial()) {
    on<FcmTokenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
