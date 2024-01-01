class Payment {
  int id;
  int bookingId;
  int userId;
  String date;
  int driverId;
  double distance;
  int fare;
  String status;
  String driverImage;
  String driverName;

  Payment(
      {required this.id,
      required this.bookingId,
      required this.userId,
      required this.date,
      required this.driverId,
      required this.distance,
      required this.fare,
      required this.status,
      required this.driverImage,
      required this.driverName});

  // Factory method to create a Payment object from a JSON map
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
        id: json['ID'],
        bookingId: json['BookingID'],
        userId: json['User_id'],
        date: json['Date'],
        driverId: json['DriverId'],
        distance: json['Distance'].toDouble(),
        fare: json['Fare'],
        status: json['Status'],
        driverImage: json['DriverImg'],
        driverName: json["Name"]);
  }

  // Convert the Payment object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'BookingID': bookingId,
      'User_id': userId,
      'Date': date,
      'DriverId': driverId,
      'Distance': distance,
      'Fare': fare,
      'Status': status,
      'DriverImg': driverImage,
      'Name': driverName
    };
  }
}
