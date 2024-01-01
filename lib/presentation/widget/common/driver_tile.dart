import 'package:flutter/material.dart';
import 'package:taxi_app_user/service/payment_model.dart';

class DriverTile extends StatefulWidget {
  const DriverTile(
      {super.key,
      required this.buttonColor,
      required this.buttonText,
      required this.detail});
  final Color buttonColor;
  final String buttonText;
  final Payment detail;
  @override
  State<DriverTile> createState() => _DriverTileState();
}

class _DriverTileState extends State<DriverTile> {
  bool isExpanded = false;
  double containerHeight = 100.0;

  void toggleContainer() {
    setState(() {
      isExpanded = !isExpanded;
      containerHeight = isExpanded ? 250.0 : 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              duration: const Duration(milliseconds: 300),
              height: containerHeight,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(widget.detail.driverImage)),
                            subtitle: Text(
                              widget.detail.date,
                              style: const TextStyle(
                                fontFamily: "urbanist",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            title: Text(
                              widget.detail.driverName,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: "urbanist",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isExpanded
                      ? Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.location_on),
                              title: const Text("Pick-up"),
                              subtitle: const Text("Kakkancheri,Calicut,Inida"),
                              trailing: Text(
                                "₹ ${widget.detail.fare.toString()}",
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.flag),
                              title: Text("Drop-off"),
                              subtitle: Text("Kakkancheri,Calicut,Inida"),
                            ),
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 167, 167, 167),
            ),
            IconButton(
              icon: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
              onPressed: toggleContainer,
            ),
          ],
        ),
      ),
    );
  }
}
