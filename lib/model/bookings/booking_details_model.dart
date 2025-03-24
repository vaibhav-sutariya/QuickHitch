class BookingDetailsModel {
  String? message;
  BookingData? data;

  BookingDetailsModel({this.message, this.data});

  BookingDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? BookingData.fromJson(json['data']) : null;
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

class BookingData {
  String? id;
  String? rideId;
  String? rideStopId;
  String? riderId;
  String? origin;
  String? destination;
  String? originLat;
  String? originLong;
  String? destinationLat;
  String? destinationLong;
  int? distance;
  int? noOfSeats;
  int? originalAmount;
  double? totalAmount;
  String? status;
  String? paymentStatus;
  Null cardId;
  Null stripePaymentId;
  Null refundId;
  int? refundAmount;
  int? cancellationFee;
  double? platformFee;
  int? discount;
  int? amountPayableToDriver;
  String? createdAt;
  String? updatedAt;
  Rider? rider;
  RideStop? rideStop;
  Ride? ride;
  int? platformFeePercentage;
  int? discountPercentage;

  BookingData(
      {this.id,
      this.rideId,
      this.rideStopId,
      this.riderId,
      this.origin,
      this.destination,
      this.originLat,
      this.originLong,
      this.destinationLat,
      this.destinationLong,
      this.distance,
      this.noOfSeats,
      this.originalAmount,
      this.totalAmount,
      this.status,
      this.paymentStatus,
      this.cardId,
      this.stripePaymentId,
      this.refundId,
      this.refundAmount,
      this.cancellationFee,
      this.platformFee,
      this.discount,
      this.amountPayableToDriver,
      this.createdAt,
      this.updatedAt,
      this.rider,
      this.rideStop,
      this.ride,
      this.platformFeePercentage,
      this.discountPercentage});

  BookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rideId = json['rideId'];
    rideStopId = json['rideStopId'];
    riderId = json['riderId'];
    origin = json['origin'];
    destination = json['destination'];
    originLat = json['originLat'];
    originLong = json['originLong'];
    destinationLat = json['destinationLat'];
    destinationLong = json['destinationLong'];
    distance = json['distance'];
    noOfSeats = json['noOfSeats'];
    originalAmount = json['originalAmount'];
    totalAmount = json['totalAmount'];
    status = json['status'];
    paymentStatus = json['paymentStatus'];
    cardId = json['cardId'];
    stripePaymentId = json['stripePaymentId'];
    refundId = json['refundId'];
    refundAmount = json['refundAmount'];
    cancellationFee = json['cancellationFee'];
    platformFee = json['platformFee'];
    discount = json['discount'];
    amountPayableToDriver = json['amountPayableToDriver'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    rider = json['rider'] != null ? Rider.fromJson(json['rider']) : null;
    rideStop =
        json['rideStop'] != null ? RideStop.fromJson(json['rideStop']) : null;
    ride = json['ride'] != null ? Ride.fromJson(json['ride']) : null;
    platformFeePercentage = json['platformFeePercentage'];
    discountPercentage = json['discountPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rideId'] = rideId;
    data['rideStopId'] = rideStopId;
    data['riderId'] = riderId;
    data['origin'] = origin;
    data['destination'] = destination;
    data['originLat'] = originLat;
    data['originLong'] = originLong;
    data['destinationLat'] = destinationLat;
    data['destinationLong'] = destinationLong;
    data['distance'] = distance;
    data['noOfSeats'] = noOfSeats;
    data['originalAmount'] = originalAmount;
    data['totalAmount'] = totalAmount;
    data['status'] = status;
    data['paymentStatus'] = paymentStatus;
    data['cardId'] = cardId;
    data['stripePaymentId'] = stripePaymentId;
    data['refundId'] = refundId;
    data['refundAmount'] = refundAmount;
    data['cancellationFee'] = cancellationFee;
    data['platformFee'] = platformFee;
    data['discount'] = discount;
    data['amountPayableToDriver'] = amountPayableToDriver;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (rider != null) {
      data['rider'] = rider!.toJson();
    }
    if (rideStop != null) {
      data['rideStop'] = rideStop!.toJson();
    }
    if (ride != null) {
      data['ride'] = ride!.toJson();
    }
    data['platformFeePercentage'] = platformFeePercentage;
    data['discountPercentage'] = discountPercentage;
    return data;
  }
}

class Rider {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? picture;
  int? rating;

  Rider(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.picture,
      this.rating});

  Rider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    picture = json['picture'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['picture'] = picture;
    data['rating'] = rating;
    return data;
  }
}

class RideStop {
  String? id;
  String? origin;
  String? destination;
  int? pricePerSeat;
  int? emptySeats;

  RideStop(
      {this.id,
      this.origin,
      this.destination,
      this.pricePerSeat,
      this.emptySeats});

  RideStop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origin = json['origin'];
    destination = json['destination'];
    pricePerSeat = json['pricePerSeat'];
    emptySeats = json['emptySeats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['origin'] = origin;
    data['destination'] = destination;
    data['pricePerSeat'] = pricePerSeat;
    data['emptySeats'] = emptySeats;
    return data;
  }
}

class Ride {
  String? id;
  String? origin;
  String? destination;
  String? departureDate;
  String? originTimeZone;
  int? pricePerSeat;
  String? status;
  Driver? driver;

  Ride(
      {this.id,
      this.origin,
      this.destination,
      this.departureDate,
      this.originTimeZone,
      this.pricePerSeat,
      this.status,
      this.driver});

  Ride.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origin = json['origin'];
    destination = json['destination'];
    departureDate = json['departureDate'];
    originTimeZone = json['originTimeZone'];
    pricePerSeat = json['pricePerSeat'];
    status = json['status'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['origin'] = origin;
    data['destination'] = destination;
    data['departureDate'] = departureDate;
    data['originTimeZone'] = originTimeZone;
    data['pricePerSeat'] = pricePerSeat;
    data['status'] = status;
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    return data;
  }
}

class Driver {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? picture;
  int? rating;
  Count? cCount;

  Driver(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.picture,
      this.rating,
      this.cCount});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    picture = json['picture'];
    rating = json['rating'];
    cCount = json['_count'] != null ? Count.fromJson(json['_count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
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
