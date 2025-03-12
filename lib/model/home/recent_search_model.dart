class RecentSearchModel {
  String? message;
  List<Data>? data;

  RecentSearchModel({this.message, this.data});

  RecentSearchModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? origin;
  String? destination;
  String? originLat;
  String? originLong;
  String? destinationLat;
  String? destinationLong;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.origin,
      this.destination,
      this.originLat,
      this.originLong,
      this.destinationLat,
      this.destinationLong,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    origin = json['origin'];
    destination = json['destination'];
    originLat = json['originLat'];
    originLong = json['originLong'];
    destinationLat = json['destinationLat'];
    destinationLong = json['destinationLong'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['origin'] = origin;
    data['destination'] = destination;
    data['originLat'] = originLat;
    data['originLong'] = originLong;
    data['destinationLat'] = destinationLat;
    data['destinationLong'] = destinationLong;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
