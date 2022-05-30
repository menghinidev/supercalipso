import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/events.dart';
import '../../bloc/states.dart';
import '../../utils/error/error_details.dart';

class APIErrorRaised extends BlocEvent {
  final List<ErrorDetails> errors;

  ErrorDetails? get relevantError => errors.isEmpty ? null : errors.first;

  APIErrorRaised({required this.errors});
}

class ErrorDismissed extends BlocEvent {}

class GeneralErrorRaised extends BlocEvent {
  final String description;

  GeneralErrorRaised({required this.description});
}

class ErrorProcessing extends BlocState {
  final ErrorDetails error;
  final Function? callback;

  ErrorProcessing({required this.error, this.callback});
}

class NoErrors extends BlocState {}

class ErrorManagerBloc extends Bloc<BlocEvent, BlocState> {
  ErrorManagerBloc() : super(NoErrors()) {
    on<APIErrorRaised>((event, emit) => _handleErrorRaised(event, emit));
    on<GeneralErrorRaised>((event, emit) => _handleErrorRaised(event, emit));
    on<ErrorDismissed>((event, emit) => emit.call(NoErrors()));
  }

  Future _handleErrorRaised(BlocEvent errorEvent, Emitter<BlocState> emitter) {
    if (state is ErrorProcessing) return Future.value();
    if (errorEvent is APIErrorRaised) {
      var newState = ErrorProcessing(error: errorEvent.relevantError ?? ErrorDetails(id: 0, message: ''));
      emitter.call(newState);
    } else if (errorEvent is GeneralErrorRaised) {
      var error = ErrorDetails(id: 0, message: errorEvent.description);
      var newState = ErrorProcessing(error: error);
      emitter.call(newState);
    }
    return Future.value();
  }
}
