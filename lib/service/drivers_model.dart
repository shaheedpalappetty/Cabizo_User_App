class Driver {
  String licenseNo;
  String licenceExp;
  String licenceFront;
  String licenceBack;
  String adharNo;
  String adharAddress;
  String adharFront;
  String adharBack;
  int? id;
  String name;
  String lastName;
  String phoneNumber;
  String email;
  String birthDate;
  String driverImg;
  String gender;
  String experience;
  String status;
  String vehicleBrand;
  String vehicleModel;
  String vehicleYear;
  String vehicleColor;
  String vehicleType;
  String vehicleSeat;
  String vehicleNumber;

  Driver({
    required this.licenseNo,
    required this.licenceExp,
    required this.licenceFront,
    required this.licenceBack,
    required this.adharNo,
    required this.adharAddress,
    required this.adharFront,
    required this.adharBack,
    this.id,
    required this.name,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.birthDate,
    required this.driverImg,
    required this.gender,
    required this.experience,
    required this.status,
    required this.vehicleBrand,
    required this.vehicleModel,
    required this.vehicleYear,
    required this.vehicleColor,
    required this.vehicleType,
    required this.vehicleSeat,
    required this.vehicleNumber,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      licenseNo: json['LicenseNo'] ?? '',
      licenceExp: json['LicenceExp'] ?? '',
      licenceFront: json['LicenceFront'] ?? '',
      licenceBack: json['LicenceBack'] ?? '',
      adharNo: json['AdharNo'] ?? '',
      adharAddress: json['AdharAddress'] ?? '',
      adharFront: json['AdharFront'] ?? '',
      adharBack: json['AdharBack'] ?? '',
      id: json['ID'],
      name: json['Name'],
      lastName: json['LastName'],
      phoneNumber: json['PhoneNumber'],
      email: json['Email'],
      birthDate: json['BirthDate'],
      driverImg: json['DriverImg'],
      gender: json['Gender'],
      experience: json['Experience'],
      status: json['Status'] ?? '',
      vehicleBrand: json['VehicleBrand'],
      vehicleModel: json['VehicleModel'],
      vehicleYear: json['VehicleYear'],
      vehicleColor: json['VehicleColor'],
      vehicleType: json['VehicleType'],
      vehicleSeat: json['VehicleSeat'],
      vehicleNumber: json['VehicleNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'LicenseNo': licenseNo,
      'LicenceExp': licenceExp,
      'LicenceFront': licenceFront,
      'LicenceBack': licenceBack,
      'AdharNo': adharNo,
      'AdharAddress': adharAddress,
      'AdharFront': adharFront,
      'AdharBack': adharBack,
      'ID': id,
      'Name': name,
      'LastName': lastName,
      'PhoneNumber': phoneNumber,
      'Email': email,
      'BirthDate': birthDate,
      'DriverImg': driverImg,
      'Gender': gender,
      'Experience': experience,
      'Status': status,
      'VehicleBrand': vehicleBrand,
      'VehicleModel': vehicleModel,
      'VehicleYear': vehicleYear,
      'VehicleColor': vehicleColor,
      'VehicleType': vehicleType,
      'VehicleSeat': vehicleSeat,
      'VehicleNumber': vehicleNumber,
    };
  }
}
