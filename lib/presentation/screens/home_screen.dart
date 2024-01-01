import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:taxi_app_user/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:taxi_app_user/presentation/bloc/payment/payment_bloc.dart';
import 'package:taxi_app_user/presentation/widget/home_widget.dart/home_appbar.dart';
import 'package:taxi_app_user/service/sharedpref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;
  List<LatLng> polylineCoordinates = [];
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  LatLng currentLocation = const LatLng(11.2336, 75.8052);
  LatLng destinationLocation = const LatLng(11.2500, 75.7667);
  @override
  void initState() {
    super.initState();

    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _handleNotification(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotification(message);
    });
  }

  void _handleNotification(RemoteMessage message) {
    Map<String, dynamic>? data = message.data;

    context.read<HomeBloc>().add(DriverAcceptEvent(data: data));
  }

  void fetchRoute(LatLng currentlocation1, LatLng destination2) async {
    const apiKey = 'AIzaSyAWktkmf1xJM-2dQriSVBNm15Ai8XHweCo';
    final polylinePoints = PolylinePoints();
    final origin =
        PointLatLng(currentLocation.latitude, currentLocation.longitude);
    final destination = PointLatLng(
        destinationLocation.latitude, destinationLocation.longitude);

    final result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      origin,
      destination,
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is VehicleTypeSetState) {
                  currentLocation = LatLng(state.piclat, state.piclong);
                  destinationLocation = LatLng(state.endlat, state.endlong);
                  fetchRoute(currentLocation, destinationLocation);
                  return GoogleMap(
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(state.piclat, state.piclong),
                        zoom: 12.5),
                    onMapCreated: (controller) {
                      mapController = controller;
                      mapController.animateCamera(CameraUpdate.newLatLng(
                          LatLng(state.piclat, state.piclong)));
                      mapController.animateCamera(CameraUpdate.newLatLng(
                          LatLng(state.endlat, state.endlong)));
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId('_currentLocation'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: LatLng(state.piclat, state.piclong),
                      ),
                      Marker(
                        markerId: const MarkerId('_destinationLocation'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue),
                        position: LatLng(state.endlat, state.endlong),
                      ),
                    },
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId('route'),
                        points: polylineCoordinates,
                        color: Colors.blue,
                        width: 5,
                      ),
                    },
                  );
                } else if (state is NormalMapState) {
                  return Center(
                    child: userMap(),
                  );
                }

                return Center(
                  child: userMap(),
                );
              },
            ),
            BlocListener<PaymentBloc, PaymentState>(
              listener: (context, state) async {
                if (state is PaymentSuccessState) {
                  context.read<HomeBloc>().add(NormalMapEvent());
                } else if (state is PaymentFailedState) {
                  context.read<HomeBloc>().add(NormalMapEvent());
                }
              },
              child: Container(),
            ),
            const HomeAppbar(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is DriverStartState) {
                  return driveStartMap(state.fare, state.driverId);
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget userMap() {
    return GoogleMap(
      zoomControlsEnabled: true,
      initialCameraPosition:
          CameraPosition(target: currentLocation, zoom: 12.5),
      zoomGesturesEnabled: true,
      onMapCreated: (controller) {
        mapController = controller;
        mapController.animateCamera(CameraUpdate.newLatLng(currentLocation));
      },
      markers: {
        Marker(
          markerId: const MarkerId('_currentLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: currentLocation,
        ),
      },
    );
  }

  Widget driveStartMap(int fare, int driverId) {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          color: const Color.fromARGB(185, 0, 0, 0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              title: const Text(
                "Totel Amount",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                fare.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  context.read<PaymentBloc>().add(OpenPaymentEvent(
                      mobileNumber: "7558964320",
                      propertyName: "Taxi ",
                      total: fare,
                      driverId: driverId,
                      userId: Sharedpref.instence.getId()));
                },
                child: const Text("Pay"))
          ],
        ),
      ),
    );
  }
}
