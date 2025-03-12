class SearchRideModel {
  String? message;
  int? totalPages;
  int? currentPage;
  List<Rides>? rides;

  SearchRideModel(
      {this.message, this.totalPages, this.currentPage, this.rides});

  SearchRideModel.fromJson(Map<String, dynamic> json) {
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
  int? emptySeats;
  int? pricePerSeat;
  String? rideId;
  bool? isMainRoute;
  String? createdAt;
  String? updatedAt;
  Ride? ride;

  Rides(
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
      this.updatedAt,
      this.ride});

  Rides.fromJson(Map<String, dynamic> json) {
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
    ride = json['ride'] != null ? Ride.fromJson(json['ride']) : null;
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
    if (ride != null) {
      data['ride'] = ride!.toJson();
    }
    return data;
  }
}

class Ride {
  String? id;
  String? departureDate;
  String? originTimeZone;
  String? status;
  Vehicle? vehicle;
  Driver? driver;
  List<RideWaypoints>? rideWaypoints;
  Null rider;

  Ride(
      {this.id,
      this.departureDate,
      this.originTimeZone,
      this.status,
      this.vehicle,
      this.driver,
      this.rideWaypoints,
      this.rider});

  Ride.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departureDate = json['departureDate'];
    originTimeZone = json['originTimeZone'];
    status = json['status'];
    vehicle =
        json['vehicle'] != null ? Vehicle.fromJson(json['vehicle']) : null;
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    if (json['rideWaypoints'] != null) {
      rideWaypoints = <RideWaypoints>[];
      json['rideWaypoints'].forEach((v) {
        rideWaypoints!.add(RideWaypoints.fromJson(v));
      });
    }
    rider = json['rider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['departureDate'] = departureDate;
    data['originTimeZone'] = originTimeZone;
    data['status'] = status;
    if (vehicle != null) {
      data['vehicle'] = vehicle!.toJson();
    }
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    if (rideWaypoints != null) {
      data['rideWaypoints'] = rideWaypoints!.map((v) => v.toJson()).toList();
    }
    data['rider'] = rider;
    return data;
  }
}

class Vehicle {
  String? id;
  Make? make;
  String? model;
  int? year;

  Vehicle({this.id, this.make, this.model, this.year});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    make = json['make'] != null ? Make.fromJson(json['make']) : null;
    model = json['model'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (make != null) {
      data['make'] = make!.toJson();
    }
    data['model'] = model;
    data['year'] = year;
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
  int? rating;
  Count? cCount;

  Driver(
      {this.id,
      this.firstName,
      this.lastName,
      this.picture,
      this.rating,
      this.cCount});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
    rating = json['rating'];
    cCount = json['_count'] != null ? Count.fromJson(json['_count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    data['rating'] = rating;
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
  String? name;
  int? order;

  RideWaypoints({this.name, this.order});

  RideWaypoints.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['order'] = order;
    return data;
  }
}
