class GetBookingRequestModel {
  String? message;
  List<BookingRequestData>? data;

  GetBookingRequestModel({this.message, this.data});

  GetBookingRequestModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <BookingRequestData>[];
      json['data'].forEach((v) {
        data!.add(BookingRequestData.fromJson(v));
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

class BookingRequestData {
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
  int? totalAmount;
  String? status;
  String? paymentStatus;
  Null cardId;
  Null stripePaymentId;
  Null refundId;
  int? refundAmount;
  int? cancellationFee;
  int? platformFee;
  int? discount;
  int? amountPayableToDriver;
  String? createdAt;
  String? updatedAt;
  Rider? rider;
  Ride? ride;

  BookingRequestData(
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
      this.ride});

  BookingRequestData.fromJson(Map<String, dynamic> json) {
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
    ride = json['ride'] != null ? Ride.fromJson(json['ride']) : null;
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
    if (ride != null) {
      data['ride'] = ride!.toJson();
    }
    return data;
  }
}

class Rider {
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

  Rider(
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

  Rider.fromJson(Map<String, dynamic> json) {
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

class Ride {
  String? id;
  String? origin;
  String? destination;
  String? departureDate;
  String? originTimeZone;
  int? pricePerSeat;
  int? emptySeats;

  Ride(
      {this.id,
      this.origin,
      this.destination,
      this.departureDate,
      this.originTimeZone,
      this.pricePerSeat,
      this.emptySeats});

  Ride.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origin = json['origin'];
    destination = json['destination'];
    departureDate = json['departureDate'];
    originTimeZone = json['originTimeZone'];
    pricePerSeat = json['pricePerSeat'];
    emptySeats = json['emptySeats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['origin'] = origin;
    data['destination'] = destination;
    data['departureDate'] = departureDate;
    data['originTimeZone'] = originTimeZone;
    data['pricePerSeat'] = pricePerSeat;
    data['emptySeats'] = emptySeats;
    return data;
  }
}
