part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeActionState extends HomeState {}

final class ConfirmDriveState extends HomeActionState {}

final class VehicleTypeSetState extends HomeActionState {
  final double piclat;
  final double piclong;
  final double endlat;
  final double endlong;
  List<AvailableDrivers> drivers = [];
  VehicleTypeSetState({
    required this.drivers,
    required this.piclat,
    required this.piclong,
    required this.endlat,
    required this.endlong,
  });
}

final class SelectCarState extends HomeActionState {
  AvailableDrivers driver;
  SelectCarState({required this.driver});
}

final class SelectVehicleTypeState extends HomeState {
  String vehicleType;
  SelectVehicleTypeState({required this.vehicleType});
}

final class DriverAcceptState extends HomeState {}

final class DriverRejectState extends HomeState {}

final class DriverRequstinState extends HomeState {}

final class DriverReachedState extends HomeState {
  AvailableDrivers driver;
  DriverReachedState({required this.driver});
}

final class DriverStartState extends HomeState {
  int fare;
  int driverId;
  DriverStartState({required this.fare, required this.driverId});
}

final class DriverReachedMapState extends HomeState {}

final class CompleteRideState extends HomeState {
  List<Payment?> completes;
  CompleteRideState({required this.completes});
}


final class EmptyCompleteRideState extends HomeState {}


final class NormalMapState extends HomeState {}
