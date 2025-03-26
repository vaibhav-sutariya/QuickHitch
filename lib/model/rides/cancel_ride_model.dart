class CancelRideModel {
  String? message;
  CancelRide? ride;

  CancelRideModel({this.message, this.ride});

  CancelRideModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    ride = json['ride'] != null ? CancelRide.fromJson(json['ride']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (ride != null) {
      data['ride'] = ride!.toJson();
    }
    return data;
  }
}

class CancelRide {
  String? id;
  String? origin;
  String? destination;
  String? originLat;
  String? originLong;
  String? destinationLat;
  String? destinationLong;
  int? distance;
  String? departureDate;
  String? originTimeZone;
  String? description;
  int? emptySeats;
  int? pricePerSeat;
  String? driverId;
  Null riderId;
  Null vehicleId;
  String? status;
  String? rideBookings;
  String? paymentType;
  String? luggage;
  int? backRowSeating;
  Null returnTripId;
  String? createdAt;
  String? updatedAt;
  Null userId;

  CancelRide(
      {this.id,
      this.origin,
      this.destination,
      this.originLat,
      this.originLong,
      this.destinationLat,
      this.destinationLong,
      this.distance,
      this.departureDate,
      this.originTimeZone,
      this.description,
      this.emptySeats,
      this.pricePerSeat,
      this.driverId,
      this.riderId,
      this.vehicleId,
      this.status,
      this.rideBookings,
      this.paymentType,
      this.luggage,
      this.backRowSeating,
      this.returnTripId,
      this.createdAt,
      this.updatedAt,
      this.userId});

  CancelRide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origin = json['origin'];
    destination = json['destination'];
    originLat = json['originLat'];
    originLong = json['originLong'];
    destinationLat = json['destinationLat'];
    destinationLong = json['destinationLong'];
    distance = json['distance'];
    departureDate = json['departureDate'];
    originTimeZone = json['originTimeZone'];
    description = json['description'];
    emptySeats = json['emptySeats'];
    pricePerSeat = json['pricePerSeat'];
    driverId = json['driverId'];
    riderId = json['riderId'];
    vehicleId = json['vehicleId'];
    status = json['status'];
    rideBookings = json['rideBookings'];
    paymentType = json['paymentType'];
    luggage = json['luggage'];
    backRowSeating = json['backRowSeating'];
    returnTripId = json['returnTripId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['origin'] = origin;
    data['destination'] = destination;
    data['originLat'] = originLat;
    data['originLong'] = originLong;
    data['destinationLat'] = destinationLat;
    data['destinationLong'] = destinationLong;
    data['distance'] = distance;
    data['departureDate'] = departureDate;
    data['originTimeZone'] = originTimeZone;
    data['description'] = description;
    data['emptySeats'] = emptySeats;
    data['pricePerSeat'] = pricePerSeat;
    data['driverId'] = driverId;
    data['riderId'] = riderId;
    data['vehicleId'] = vehicleId;
    data['status'] = status;
    data['rideBookings'] = rideBookings;
    data['paymentType'] = paymentType;
    data['luggage'] = luggage;
    data['backRowSeating'] = backRowSeating;
    data['returnTripId'] = returnTripId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    return data;
  }
}
