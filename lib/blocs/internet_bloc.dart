import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:day_1/blocs/internet_event.dart';
import 'package:day_1/blocs/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  InternetBloc() : super(InternetInitialState()) {
    on<InternetConnectedEvent>(
      (event, emit) => emit(InternetConnectedState()),
    );
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));

    _connectivity.onConnectivityChanged.listen((event) {
      if (ConnectivityResult.wifi == event ||
          ConnectivityResult.mobile == event) {
        add(InternetConnectedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
}
