import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_thime_state.dart';

class ChangeThimeCubit extends Cubit<ChangeThimeState> {
  Icon icon = const Icon(Icons.dark_mode);
  ChangeThimeCubit() : super(LightThimeState());
  void changeThime() {
    if (state is LightThimeState) {
      icon = const Icon(Icons.light_mode);
      emit(DarkThimeState());
    } else {
      icon = const Icon(Icons.dark_mode);
      emit(LightThimeState());
    }
  }
}
