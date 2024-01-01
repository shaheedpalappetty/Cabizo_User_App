// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app_user/models/available_drivers.dart';
import 'package:taxi_app_user/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:taxi_app_user/presentation/widget/common/button.dart';
import 'package:taxi_app_user/utils/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetContent extends StatelessWidget {
  BottomSheetContent({super.key, this.pickUpPlaceName, this.dropOffPlaceName});
  final String? pickUpPlaceName;
  final String? dropOffPlaceName;

  final List<String> seats = ["4 Seats", "5 Seates", "7 Seats"];

  final List<String> type = [
    "Sedan",
    "SUV (Sport Utility Vehicle)",
    "Hatchback"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is VehicleTypeSetState) {
          return chooseCares(context, state.drivers);
        } else if (state is SelectCarState) {
          return driverInfo(state.driver, context);
        } else if (state is DriverAcceptState) {
          return driverAccepted(context);
        } else if (state is DriverRejectState) {
          return rejectDriverSheet(context);
        } else if (state is DriverRequstinState) {
          return driverRequesting(context);
        } else if (state is DriverReachedState) {
          return driverReached(context, state.driver);
        }
        return const SizedBox();
      },
    );
  }

  Widget driverRequesting(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Driver Requesting....',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Center(
                      child: Lottie.asset(
                        'asset/image/10sec.json',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ),
                  ),
                  const Text(
                    "Wait for few minitues....",
                    style: CustomTextStyle.buttonTextStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget driverReached(BuildContext context, AvailableDrivers driver) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Driver Reached',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Center(
                        child: CircleAvatar(
                      child: IconButton(
                          onPressed: () {
                            makePhoneCall('tel:+${driver.phoneNumber}');
                          },
                          icon: const Icon(Icons.call)),
                    )),
                  ),
                  const Text(
                    "Your Driver is Reached ,lets Contact...",
                    style: CustomTextStyle.buttonTextStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget driverAccepted(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Driver Approved',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Center(
                      child: Lottie.asset(
                        'asset/image/loding.json',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ),
                  ),
                  const Text(
                    "Driver is on the way",
                    style: CustomTextStyle.buttonTextStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rejectDriverSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Driver Rejected',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Center(
                      child: Lottie.asset(
                        'asset/image/loding.json',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ),
                  ),
                  const Text(
                    "Driver is busy ,Please book once more..",
                    style: CustomTextStyle.buttonTextStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chooseCares(BuildContext context, List<AvailableDrivers> drivers) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select your Vehicle',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Expanded(
            child: SizedBox(
                child: ListView.builder(
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(SelectCarEvent(driver: drivers[index]));
                  },
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage(
                        index % 2 == 0
                            ? 'asset/image/suv.png'
                            : 'asset/image/hatcback.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text(
                    drivers[index].name,
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  subtitle: Text(drivers[index].vehicleType),
                  trailing: Text(
                    "₹ ${drivers[index].fare.toString()}",
                    maxLines: 1,
                    overflow: null,
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget driverInfo(AvailableDrivers driver, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Your driver',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Expanded(
            child: SizedBox(
                child: ListView(children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('asset/image/sedan.png'),
                ),
                title: Text(
                  "${driver.vehicleModel} , ${driver.vehicleBrand}",
                  style: CustomTextStyle.buttonTextStyle,
                ),
                subtitle: Text(driver.vehicleNumber),
                trailing: Text(
                  "₹ ${driver.fare.toString()}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 41, 121, 44)),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    driver.driverImg,
                  ),
                  radius: 34,
                ),
                title: Text(
                  driver.name,
                  style: CustomTextStyle.buttonTextStyle,
                ),
                subtitle: Text(driver.gender),
                trailing: IconButton(
                    onPressed: () {
                      makePhoneCall('tel:+${driver.phoneNumber}');
                    },
                    icon: const Icon(Icons.call)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                  title: const Text(
                    'The pickup location',
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  subtitle: Text(pickUpPlaceName!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                  title: const Text(
                    'The Drop-off location',
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  subtitle: Text(dropOffPlaceName!),
                ),
              ),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return CustomButton(
                  text: "Continue",
                  onTap: () async {
                    context.read<HomeBloc>().add(SearchDriverEvent(
                        driver.id, pickUpPlaceName!, dropOffPlaceName!));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void makePhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
