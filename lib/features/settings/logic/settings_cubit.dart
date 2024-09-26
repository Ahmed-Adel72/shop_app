import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/settings/logic/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitialState());
}
