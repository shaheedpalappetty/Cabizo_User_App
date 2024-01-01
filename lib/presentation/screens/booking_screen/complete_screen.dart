import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app_user/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:taxi_app_user/presentation/widget/common/driver_tile.dart';
import 'package:taxi_app_user/service/payment_model.dart';

class CompleteTab extends StatefulWidget {
  const CompleteTab({super.key});

  @override
  State<CompleteTab> createState() => _CompleteTabState();
}

class _CompleteTabState extends State<CompleteTab> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(CompleteRideEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is CompleteRideState) {
            return ListView.builder(
                itemCount: state.completes.length,
                itemBuilder: (context, indext) {
                  Payment? detail = state.completes[indext];
                  return DriverTile(
                      detail: detail!,
                      buttonColor: Colors.green,
                      buttonText: "Complete");
                });
          } else if (state is EmptyCompleteRideState) {
            return const Center(
              child: Text("No Rides,Take a new Ride"),
            );
          }
          return const Center(
              child: Text("No datas, book ride right know and enjoy"));
        },
      ),
    );
  }
}
