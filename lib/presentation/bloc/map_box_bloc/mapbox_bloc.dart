import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../service/mapbox.dart';
part 'mapbox_event.dart';
part 'mapbox_state.dart';

class MapboxBloc extends Bloc<MapboxEvent, MapboxState> {
  MapboxBloc() : super(MapboxInitial()) {
    on<SearchPickEevent>(searchPickEevent);
    on<LocationSelectedEvent>(locationSelectedEvent);
    on<SearchEndEevent>(searchEndEevent);
    on<EndLocationEvent>(endLocationEvent);
  }

  FutureOr<void> searchPickEevent(
      SearchPickEevent event, Emitter<MapboxState> emit) async {
    List placeses = await MapBoxHelper.getSearchResults(event.value);
    emit(PickupLocationState(placeses: placeses));
  }

  FutureOr<void> locationSelectedEvent(
      LocationSelectedEvent event, Emitter<MapboxState> emit) {
    emit(SelectPicLocationState(
        location: event.location, latitude: event.lant, longitude: event.long));
  }

  FutureOr<void> searchEndEevent(
      SearchEndEevent event, Emitter<MapboxState> emit) async {
    List placeses = await MapBoxHelper.getSearchResults(event.value);
    emit(EndLocationState(placeses: placeses));
  }

  FutureOr<void> endLocationEvent(
      EndLocationEvent event, Emitter<MapboxState> emit) {
    emit(SelectEndLocationState(
        location: event.location, latitude: event.lant, longitude: event.long));
  }
}
