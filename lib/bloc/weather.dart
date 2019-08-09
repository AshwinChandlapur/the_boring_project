import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable{
  String cityName;
  String temperature;

  Weather({this.cityName, this.temperature}):super([cityName,temperature]);

}