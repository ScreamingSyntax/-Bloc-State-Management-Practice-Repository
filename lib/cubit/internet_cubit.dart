import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:day_1/cubit/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetStateC> {
  Connectivity _connectivity = Connectivity();
  InternetCubit() : super(InternetStateC.Initial) {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetStateC.Connected);
      } else {
        emit(InternetStateC.Disconnected);
      }
    });
  }
}
