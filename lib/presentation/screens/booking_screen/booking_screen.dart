import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/screens/booking_screen/active_screen.dart';
import 'package:taxi_app_user/presentation/screens/booking_screen/complete_screen.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My bookings'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Active Now'),
                Tab(text: 'Complete'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ActiveTabbar(),
              CompleteTab(),
            ],
          ),
        ),
      ),
    );
  }
}
