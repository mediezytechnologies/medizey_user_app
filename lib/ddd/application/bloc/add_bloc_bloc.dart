import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_bloc_event.dart';
part 'add_bloc_state.dart';

class AddBlocBloc extends Bloc<AddBlocEvent, AddBlocState> {
  AddBlocBloc() : super(AddBlocInitial()) {
    on<AddBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
