import 'package:bloc_practice/visibility_bloc/visibility_event.dart';
import 'package:bloc_practice/visibility_bloc/visibility_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(VisibilityState(isVisible: true)) {
    on<HideEvent>((event, emit) {
      emit(VisibilityState(isVisible: false));
    });

    on<ShowEvent>((event, emit) {
      emit(VisibilityState(isVisible: true));
    });
  }
}
