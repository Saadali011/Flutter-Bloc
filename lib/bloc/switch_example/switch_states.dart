import 'package:equatable/equatable.dart';
class SwitchStates extends Equatable{
  bool isSwtich;
  double slider;

  SwitchStates({this.isSwtich = false,this.slider = 1.0});

  SwitchStates copyWith({bool? isSwitch,double? slider}){
    return SwitchStates(
    isSwtich : isSwitch ?? this.isSwtich,
      slider: slider?? this.slider,
    );
}

  @override
  List<Object> get props => [isSwtich,slider];

}