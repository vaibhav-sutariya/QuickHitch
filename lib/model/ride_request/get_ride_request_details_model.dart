class GetRideRequestDetailsModel {
  String? message;
  Data? data;

  GetRideRequestDetailsModel({this.message, this.data});

  GetRideRequestDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  RideRequest? rideRequest;
  List<MatchingRides>? matchingRides;

  Data({this.rideRequest, this.matchingRides});

  Data.fromJson(Map<String, dynamic> json) {
    rideRequest = json['rideRequest'] != null
        ? RideRequest.fromJson(json['rideRequest'])
        : null;
    if (json['matchingRides'] != null) {
      matchingRides = <MatchingRides>[];
      json['matchingRides'].forEach((v) {
        matchingRides!.add(MatchingRides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rideRequest != null) {
      data['rideRequest'] = rideRequest!.toJson();
    }
    if (matchingRides != null) {
      data['matchingRides'] = matchingRides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RideRequest {
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
  Null driverId;
  String? riderId;
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
  List<dynamic>? rideWaypoints; // Replace Null with dynamic or a specific type

  RideRequest(
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
      this.rideWaypoints});

  RideRequest.fromJson(Map<String, dynamic> json) {
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
    if (json['rideWaypoints'] != null) {
      rideWaypoints = <Null>[]; // Replace Null with dynamic or a specific type
      json['rideWaypoints'].forEach((v) {
        rideWaypoints!
            .add(v); // Directly add the value if no specific type is required
      });
    }
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
    if (rideWaypoints != null) {
      data['rideWaypoints'] = rideWaypoints!
          .map((v) => v)
          .toList(); // Adjust based on the actual type
    }
    return data;
  }
}

class MatchingRides {
  String? id;
  String? origin;
  String? destination;
  int? emptySeats;
  int? pricePerSeat;
  Ride? ride;

  MatchingRides(
      {this.id,
      this.origin,
      this.destination,
      this.emptySeats,
      this.pricePerSeat,
      this.ride});

  MatchingRides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origin = json['origin'];
    destination = json['destination'];
    emptySeats = json['emptySeats'];
    pricePerSeat = json['pricePerSeat'];
    ride = json['ride'] != null ? Ride.fromJson(json['ride']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['origin'] = origin;
    data['destination'] = destination;
    data['emptySeats'] = emptySeats;
    data['pricePerSeat'] = pricePerSeat;
    if (ride != null) {
      data['ride'] = ride!.toJson();
    }
    return data;
  }
}

class Ride {
  String? id;
  String? origin;
  String? destination;
  String? departureDate;
  String? originTimeZone;
  int? emptySeats;
  Driver? driver;
  Vehicle? vehicle;

  Ride(
      {this.id,
      this.origin,
      this.destination,
      this.departureDate,
      this.originTimeZone,
      this.emptySeats,
      this.driver,
      this.vehicle});

  Ride.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origin = json['origin'];
    destination = json['destination'];
    departureDate = json['departureDate'];
    originTimeZone = json['originTimeZone'];
    emptySeats = json['emptySeats'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    vehicle =
        json['vehicle'] != null ? Vehicle.fromJson(json['vehicle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['origin'] = origin;
    data['destination'] = destination;
    data['departureDate'] = departureDate;
    data['originTimeZone'] = originTimeZone;
    data['emptySeats'] = emptySeats;
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    if (vehicle != null) {
      data['vehicle'] = vehicle!.toJson();
    }
    return data;
  }
}

class Driver {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? bio;
  String? gender;
  String? emailVerifiedAt;
  String? role;
  String? pets;
  String? smoking;
  String? dialog;
  String? music;
  bool? pushNotifications;
  bool? emailNotifications;
  bool? marketingNotifications;
  String? status;
  Null banReason;
  String? createdAt;
  String? updatedAt;
  String? picture;
  String? timeZone;
  int? rating;
  Null idProofFront;
  Null idProofBack;
  Count? cCount;

  Driver(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.bio,
      this.gender,
      this.emailVerifiedAt,
      this.role,
      this.pets,
      this.smoking,
      this.dialog,
      this.music,
      this.pushNotifications,
      this.emailNotifications,
      this.marketingNotifications,
      this.status,
      this.banReason,
      this.createdAt,
      this.updatedAt,
      this.picture,
      this.timeZone,
      this.rating,
      this.idProofFront,
      this.idProofBack,
      this.cCount});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    dob = json['dob'];
    bio = json['bio'];
    gender = json['gender'];
    emailVerifiedAt = json['emailVerifiedAt'];
    role = json['role'];
    pets = json['pets'];
    smoking = json['smoking'];
    dialog = json['dialog'];
    music = json['music'];
    pushNotifications = json['pushNotifications'];
    emailNotifications = json['emailNotifications'];
    marketingNotifications = json['marketingNotifications'];
    status = json['status'];
    banReason = json['banReason'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    picture = json['picture'];
    timeZone = json['timeZone'];
    rating = json['rating'];
    idProofFront = json['idProofFront'];
    idProofBack = json['idProofBack'];
    cCount = json['_count'] != null ? Count.fromJson(json['_count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['dob'] = dob;
    data['bio'] = bio;
    data['gender'] = gender;
    data['emailVerifiedAt'] = emailVerifiedAt;
    data['role'] = role;
    data['pets'] = pets;
    data['smoking'] = smoking;
    data['dialog'] = dialog;
    data['music'] = music;
    data['pushNotifications'] = pushNotifications;
    data['emailNotifications'] = emailNotifications;
    data['marketingNotifications'] = marketingNotifications;
    data['status'] = status;
    data['banReason'] = banReason;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['picture'] = picture;
    data['timeZone'] = timeZone;
    data['rating'] = rating;
    data['idProofFront'] = idProofFront;
    data['idProofBack'] = idProofBack;
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

class Vehicle {
  String? id;
  String? color;
  bool? isDefault;
  int? backRowSeating;
  String? licencePlate;
  String? model;
  String? photo;
  int? noOfSeats;
  int? year;
  Make? make;

  Vehicle(
      {this.id,
      this.color,
      this.isDefault,
      this.backRowSeating,
      this.licencePlate,
      this.model,
      this.photo,
      this.noOfSeats,
      this.year,
      this.make});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    isDefault = json['isDefault'];
    backRowSeating = json['backRowSeating'];
    licencePlate = json['licencePlate'];
    model = json['model'];
    photo = json['photo'];
    noOfSeats = json['noOfSeats'];
    year = json['year'];
    make = json['make'] != null ? Make.fromJson(json['make']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['color'] = color;
    data['isDefault'] = isDefault;
    data['backRowSeating'] = backRowSeating;
    data['licencePlate'] = licencePlate;
    data['model'] = model;
    data['photo'] = photo;
    data['noOfSeats'] = noOfSeats;
    data['year'] = year;
    if (make != null) {
      data['make'] = make!.toJson();
    }
    return data;
  }
}

class Make {
  String? id;
  String? name;

  Make({this.id, this.name});

  Make.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
