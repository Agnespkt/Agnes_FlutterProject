class VehicleModel {
  String uid;
  String vehicleNo;
  String vehicleModel;
  String regDate;

  VehicleModel({this.uid, this.vehicleNo, this.vehicleModel, this.regDate});

  // receiving data from server
  factory VehicleModel.fromMap(map) {
    return VehicleModel(
      uid: map['uid'],
      vehicleNo: map['vehicleNo'],
      vehicleModel: map['vehicleModel'],
      regDate: map['regDate'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'vehicleNo': vehicleNo,
      'vehicleModel': vehicleModel,
      'regDate': regDate,
    };
  }
}
