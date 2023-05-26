import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterLoaded>(_mapViewToState);
  }

  void _mapViewToState(RegisterLoaded event, emit) async {
    emit(RegisterLoading());
    try {
      emit(RegisterLoadSuccess());
    } catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }
}
