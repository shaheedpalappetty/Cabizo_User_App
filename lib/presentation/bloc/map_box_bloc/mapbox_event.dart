part of 'mapbox_bloc.dart';

abstract class MapboxEvent {}

final class SearchPickEevent extends MapboxEvent {
  String value;
  SearchPickEevent({required this.value});
}

final class LocationSelectedEvent extends MapboxEvent {
  String location;
  double lant;
  double long;
  LocationSelectedEvent({
    required this.lant,
    required this.long,
    required this.location,
  });
}

final class SearchEndEevent extends MapboxEvent {
  String value;
  SearchEndEevent({required this.value});
}

final class EndLocationEvent extends MapboxEvent {
  String location;
  double lant;
  double long;
  EndLocationEvent({
    required this.lant,
    required this.long,
    required this.location,
  });
}
