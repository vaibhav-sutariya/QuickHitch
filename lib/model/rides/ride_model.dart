import 'dart:convert';

RideModel rideModelFromJson(String str) => RideModel.fromJson(json.decode(str));

class RideModel {
  String? message;
  int? totalPages;
  int? currentPage;
  List<Rides>? rides;

  RideModel({this.message, this.totalPages, this.currentPage, this.rides});

  RideModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    if (json['rides'] != null) {
      rides = <Rides>[];
      json['rides'].forEach((v) {
        rides!.add(Rides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    if (rides != null) {
      data['rides'] = rides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rides {
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
  String? vehicleId;
  String? status;
  String? rideBookings;
  String? paymentType;
  String? luggage;
  int? backRowSeating;
  Null returnTripId;
  String? createdAt;
  String? updatedAt;
  Null userId;
  List<RideStops>? rideStops;
  Null returnTrip;
  Vehicle? vehicle;
  Driver? driver;
  List<RideWaypoints>? rideWaypoints;
  List<Null>? bookings;
  bool? isCreated;
  bool? isBooked;
  bool? isRequested;
  bool? isPendingRequest;
  int? acceptedBookingsCount;
  int? pendingBookingsCount;
  int? matchingRidesCount;

  Rides(
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
      this.userId,
      this.rideStops,
      this.returnTrip,
      this.vehicle,
      this.driver,
      this.rideWaypoints,
      this.bookings,
      this.isCreated,
      this.isBooked,
      this.isRequested,
      this.isPendingRequest,
      this.acceptedBookingsCount,
      this.pendingBookingsCount,
      this.matchingRidesCount});

  Rides.fromJson(Map<String, dynamic> json) {
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
    if (json['rideStops'] != null) {
      rideStops = <RideStops>[];
      json['rideStops'].forEach((v) {
        rideStops!.add(RideStops.fromJson(v));
      });
    }
    returnTrip = json['returnTrip'];
    vehicle =
        json['vehicle'] != null ? Vehicle.fromJson(json['vehicle']) : null;
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    if (json['rideWaypoints'] != null) {
      rideWaypoints = <RideWaypoints>[];
      json['rideWaypoints'].forEach((v) {
        rideWaypoints!.add(RideWaypoints.fromJson(v));
      });
    }
    // if (json['bookings'] != null) {
    //   bookings = <Null>[];
    //   json['bookings'].forEach((v) {
    //     bookings!.add(Null.fromJson(v));
    //   });
    // }
    isCreated = json['isCreated'];
    isBooked = json['isBooked'];
    isRequested = json['isRequested'];
    isPendingRequest = json['isPendingRequest'];
    acceptedBookingsCount = json['acceptedBookingsCount'];
    pendingBookingsCount = json['pendingBookingsCount'];
    matchingRidesCount = json['matchingRidesCount'];
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
    if (rideStops != null) {
      data['rideStops'] = rideStops!.map((v) => v.toJson()).toList();
    }
    data['returnTrip'] = returnTrip;
    if (vehicle != null) {
      data['vehicle'] = vehicle!.toJson();
    }
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    if (rideWaypoints != null) {
      data['rideWaypoints'] = rideWaypoints!.map((v) => v.toJson()).toList();
    }
    // if (bookings != null) {
    //   data['bookings'] = bookings!.map((v) => v.toJson()).toList();
    // }
    data['isCreated'] = isCreated;
    data['isBooked'] = isBooked;
    data['isRequested'] = isRequested;
    data['isPendingRequest'] = isPendingRequest;
    data['acceptedBookingsCount'] = acceptedBookingsCount;
    data['pendingBookingsCount'] = pendingBookingsCount;
    data['matchingRidesCount'] = matchingRidesCount;
    return data;
  }
}

class RideStops {
  String? id;
  String? origin;
  String? destination;
  String? originLat;
  String? originLong;
  String? destinationLat;
  String? destinationLong;
  int? distance;
  int? emptySeats;
  int? pricePerSeat;
  String? rideId;
  bool? isMainRoute;
  String? createdAt;
  String? updatedAt;

  RideStops(
      {this.id,
      this.origin,
      this.destination,
      this.originLat,
      this.originLong,
      this.destinationLat,
      this.destinationLong,
      this.distance,
      this.emptySeats,
      this.pricePerSeat,
      this.rideId,
      this.isMainRoute,
      this.createdAt,
      this.updatedAt});

  RideStops.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origin = json['origin'];
    destination = json['destination'];
    originLat = json['originLat'];
    originLong = json['originLong'];
    destinationLat = json['destinationLat'];
    destinationLong = json['destinationLong'];
    distance = json['distance'];
    emptySeats = json['emptySeats'];
    pricePerSeat = json['pricePerSeat'];
    rideId = json['rideId'];
    isMainRoute = json['isMainRoute'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    data['emptySeats'] = emptySeats;
    data['pricePerSeat'] = pricePerSeat;
    data['rideId'] = rideId;
    data['isMainRoute'] = isMainRoute;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Vehicle {
  String? id;
  String? model;
  Make? make;

  Vehicle({this.id, this.model, this.make});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    model = json['model'];
    make = json['make'] != null ? Make.fromJson(json['make']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['model'] = model;
    if (make != null) {
      data['make'] = make!.toJson();
    }
    return data;
  }
}

class Make {
  String? name;

  Make({this.name});

  Make.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Driver {
  String? id;
  String? firstName;
  String? lastName;
  String? picture;
  Count? cCount;

  Driver({this.id, this.firstName, this.lastName, this.picture, this.cCount});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
    cCount = json['_count'] != null ? Count.fromJson(json['_count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    if (cCount != null) {
      data['_count'] = cCount!.toJson();
    }
    return data;
  }
}

class Count {
  int? driverRide;

  Count({this.driverRide});

  Count.fromJson(Map<String, dynamic> json) {
    driverRide = json['DriverRide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DriverRide'] = driverRide;
    return data;
  }
}

class RideWaypoints {
  String? id;
  String? name;
  int? order;
  String? rideId;
  String? createdAt;
  String? updatedAt;

  RideWaypoints(
      {this.id,
      this.name,
      this.order,
      this.rideId,
      this.createdAt,
      this.updatedAt});

  RideWaypoints.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    rideId = json['rideId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['rideId'] = rideId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
