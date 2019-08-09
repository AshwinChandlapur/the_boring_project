import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:the_boring_project/bloc/weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {

    if(event is GetWeather){
      yield WeatherLoading();
      final weather = await _fetchWeather(event.cityName);
      yield WeatherLoaded(weather);
    }

  }

  _fetchWeather(String cityName) {

    return Future.delayed(Duration(seconds: 1),(){
      return(Weather(
        cityName:cityName,
        temperature: 232.toString()
      ));
    });
  }
}
