// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.odataMetadata,
    this.value,
  });

  String odataMetadata;
  List<Value> value;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        odataMetadata: json["odata.metadata"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "odata.metadata": odataMetadata,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
      };
}

class Value {
  static List<Value> filterList(List<Value> vl, String filterString) {
    List<Value> _v = vl
        .where((u) => (u.endPoint
            .toString()
            .split('.')
            .last
            .toLowerCase()
            .contains(filterString.toLowerCase())))
        .toList();
    return _v;
  }

  Value({
    this.name,
    this.direction,
    this.farEndPoint,
    this.startPoint,
    this.endPoint,
    this.estTime,
  });

  Name name;
  int direction;
  FarEndPoint farEndPoint;
  String startPoint;
  String endPoint;
  int estTime;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        name: nameValues.map[json["Name"]],
        direction: json["Direction"],
        farEndPoint: farEndPointValues.map[json["FarEndPoint"]],
        startPoint: json["StartPoint"],
        endPoint: json["EndPoint"],
        estTime: json["EstTime"],
      );

  Map<String, dynamic> toJson() => {
        "Name": nameValues.reverse[name],
        "Direction": direction,
        "FarEndPoint": farEndPointValues.reverse[farEndPoint],
        "StartPoint": startPoint,
        "EndPoint": endPoint,
        "EstTime": estTime,
      };
}

enum FarEndPoint {
  TUAS_CHECKPOINT,
  CITY,
  WOODLANDS_CENTRE,
  PIE,
  SLE_CTE_INTERCHANGE,
  CHANGI_AIRPORT,
  BKE,
  UPPER_JURONG_RD,
  CTE,
  CTE_SLE
}

final farEndPointValues = EnumValues({
  "BKE": FarEndPoint.BKE,
  "CHANGI AIRPORT": FarEndPoint.CHANGI_AIRPORT,
  "CITY": FarEndPoint.CITY,
  "CTE": FarEndPoint.CTE,
  "CTE/SLE": FarEndPoint.CTE_SLE,
  "PIE": FarEndPoint.PIE,
  "SLE/CTE INTERCHANGE": FarEndPoint.SLE_CTE_INTERCHANGE,
  "TUAS CHECKPOINT": FarEndPoint.TUAS_CHECKPOINT,
  "UPPER JURONG RD": FarEndPoint.UPPER_JURONG_RD,
  "WOODLANDS CENTRE": FarEndPoint.WOODLANDS_CENTRE
});

enum Name { AYE, BKE, CTE, ECP, KJE, PIE, SLE, TPE }

final nameValues = EnumValues({
  "AYE": Name.AYE,
  "BKE": Name.BKE,
  "CTE": Name.CTE,
  "ECP": Name.ECP,
  "KJE": Name.KJE,
  "PIE": Name.PIE,
  "SLE": Name.SLE,
  "TPE": Name.TPE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
