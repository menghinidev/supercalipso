import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercalipso/bloc/auth/events.dart';
import 'package:supercalipso/bloc/auth/states.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/plugin/bloc.dart';

class AuthenticationBloc extends Bloc<BlocEvent, BlocState> {
  var user = SuperCalipsoUser(
    id: '0',
    name: 'Pippo Franco',
    email: 'pippofranco@gimeil.com',
  );
  AuthenticationBloc() : super(Unauthenticated()) {
    on<SilentLogin>((event, emit) => _handleSilentLogin(emit));
  }

  Future _handleSilentLogin(Emitter<BlocState> emitter) {
    emitter.call(Authenticated(user: user));
    return Future.value();
  }
}
