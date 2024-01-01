import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app_user/models/available_drivers.dart';
import 'package:taxi_app_user/service/drivers_model.dart';
import 'package:taxi_app_user/service/firebase.dart';
import 'package:taxi_app_user/service/payment_model.dart';
import 'package:taxi_app_user/service/repository.dart';
import 'package:taxi_app_user/service/sharedpref.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<AvailableDrivers> drivers = [];
  bool driverStatus = false;
  late AvailableDrivers driver;

  HomeBloc() : super(HomeInitial()) {
    on<VehicleTypeSetEvnet>(vehicleTypeSetEvnet);
    on<SelectCarEvent>(selectCarEvent);
    on<ConfirmDriveEvent>(confirmDriveEvent);
    on<SelectVehicleTypeEvent>(selectVehicleTypeEvent);
    on<DriverAcceptEvent>(driverAcceptEvent);
    on<SearchDriverEvent>(searchDriverEvent);
    on<CompleteRideEvent>(completeRideEvent);
    on<NormalMapEvent>(normalMapEvent);
  }
  LatLng? pickupLocation;
  LatLng? dropOfflocation;

  FutureOr<void> vehicleTypeSetEvnet(
      VehicleTypeSetEvnet event, Emitter<HomeState> emit) async {
    drivers = await Repo.booking(
        event.piclat, event.piclong, event.endlat, event.endlong);
    pickupLocation = LatLng(event.piclat, event.piclong);
    dropOfflocation = LatLng(event.endlat, event.endlong);
    emit(VehicleTypeSetState(
        drivers: drivers,
        piclat: event.piclat,
        piclong: event.piclong,
        endlat: event.endlat,
        endlong: event.endlong));
  }

  FutureOr<void> selectCarEvent(SelectCarEvent event, Emitter<HomeState> emit) {
    driver = event.driver;
    emit(SelectCarState(driver: event.driver));
  }

  FutureOr<void> confirmDriveEvent(
      ConfirmDriveEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> selectVehicleTypeEvent(
      SelectVehicleTypeEvent event, Emitter<HomeState> emit) {
    emit(SelectVehicleTypeState(vehicleType: event.vehicleType));
  }

  FutureOr<void> driverAcceptEvent(
      DriverAcceptEvent event, Emitter<HomeState> emit) {
    String status = event.data['status'];

    driverStatus = status == "Approve";
    if (status == "Approve") {
      emit(DriverAcceptState());
    } else if (status == "Rejected") {
      emit(DriverRejectState());
    } else if (status == "reached") {
      emit(DriverReachedState(driver: driver));
    } else if (status == "Go") {
      emit(VehicleTypeSetState(
          drivers: drivers,
          piclat: pickupLocation!.latitude,
          piclong: pickupLocation!.longitude,
          endlat: dropOfflocation!.latitude,
          endlong: dropOfflocation!.longitude));
    } else if (status == "End") {
      int fare = int.parse(event.data["fare"]);

      emit(DriverStartState(fare: fare, driverId: driver.id));
    }
  }

  FutureOr<void> searchDriverEvent(
      SearchDriverEvent event, Emitter<HomeState> emit) async {
    String? token = await Repo.confirmRide(event.driverId);

    FirebaseHelper.sendPushNotification(event.picupPlaceName,
        event.dropoffPlaceName, token!, pickupLocation!, dropOfflocation!);
    emit(DriverRequstinState());

    await Future.delayed(const Duration(seconds: 10));
    if (!driverStatus) {
      emit(VehicleTypeSetState(
          drivers: drivers,
          endlat: dropOfflocation!.latitude,
          endlong: dropOfflocation!.longitude,
          piclat: pickupLocation!.latitude,
          piclong: pickupLocation!.longitude));
    }
  }

  FutureOr<void> completeRideEvent(
      CompleteRideEvent event, Emitter<HomeState> emit) async {
    List<Payment>? payments =
        await Repo.paymentDetails(Sharedpref.instence.getId());
    if (payments != null) {
      emit(CompleteRideState(completes: payments));
    } else {
      emit(EmptyCompleteRideState());
    }
  }

  FutureOr<void> normalMapEvent(
      NormalMapEvent event, Emitter<HomeState> emit) async {
    String? token = await Repo.confirmRide(driver.id);
    await FirebaseHelper.paymentGet("sucess", token!);
    emit(NormalMapState());
  }
}
