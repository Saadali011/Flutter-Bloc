import 'package:bloc/bloc.dart';
import 'package:practice_bloc/bloc/switch_example/switch_event.dart';
import 'package:practice_bloc/bloc/switch_example/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents,SwitchStates>{
  SwitchBloc():super(SwitchStates()){
    on<EnableOrDisableNotification>(_EnableOrDisableNotification);
    on<SliderEvent>(_sliderEvent);

  }

  void _EnableOrDisableNotification(EnableOrDisableNotification events, Emitter<SwitchStates> emit ){
    emit(state.copyWith(isSwitch: !state.isSwtich));
  }

  void _sliderEvent(SliderEvent events, Emitter<SwitchStates> emit ){
    emit(state.copyWith(slider: events.slider));
  }
}