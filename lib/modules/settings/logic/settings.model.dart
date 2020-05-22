import 'package:equatable/equatable.dart';
class SettingState extends Equatable{
  final double sliderFontSize;
  final bool bold;
  final bool italic;

  double get viewFontSize => sliderFontSize * 30;

  SettingState({
    this.sliderFontSize,
    this.bold,
    this.italic,
  });

  factory SettingState.initial(){
    return SettingState(
      sliderFontSize: 0.5,
      bold: false,
      italic: false,
    );
  }
  SettingState copyWith({
    double sliderFontSize,
    bool bold,
    bool italic,
  }){
    return SettingState(
      sliderFontSize: sliderFontSize ?? this.sliderFontSize,
      bold: bold ?? this.bold,
      italic: italic ?? this.italic,
    );
  }


  @override 
  List<Object> get props => [
    sliderFontSize,
    bold,
    italic,
  ];
}