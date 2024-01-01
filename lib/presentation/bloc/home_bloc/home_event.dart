part of 'home_bloc.dart';

abstract class HomeEvent {}

final class VehicleTypeSetEvnet extends HomeEvent {
  final double piclat;
  final double piclong;
  final double endlat;
  final double endlong;
  VehicleTypeSetEvnet({
    required this.piclat,
    required this.piclong,
    required this.endlat,
    required this.endlong,
  });
}

final class SelectCarEvent extends HomeEvent {
  AvailableDrivers driver;
  SelectCarEvent({required this.driver});
}

final class ConfirmDriveEvent extends HomeEvent {
  Driver driver;
  ConfirmDriveEvent({required this.driver});
}

final class SelectVehicleTypeEvent extends HomeEvent {
  String vehicleType;
  SelectVehicleTypeEvent({required this.vehicleType});
}

final class DriverAcceptEvent extends HomeEvent {
  Map<String, dynamic> data;
  DriverAcceptEvent({required this.data});
}

final class SearchDriverEvent extends HomeEvent {
  final int driverId;
  final String picupPlaceName;
  final String dropoffPlaceName;
  SearchDriverEvent(
    this.driverId,
    this.picupPlaceName,
    this.dropoffPlaceName,
  );
}

final class CompleteRideEvent extends HomeEvent {}

final class NormalMapEvent extends HomeEvent {}
