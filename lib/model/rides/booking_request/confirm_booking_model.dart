class ConfirmBookingModel {
  String? message;
  ConfirmBookingData? data;

  ConfirmBookingModel({this.message, this.data});

  ConfirmBookingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data =
        json['data'] != null ? ConfirmBookingData.fromJson(json['data']) : null;
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

class ConfirmBookingData {
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
  String? stripePaymentId;
  Null refundId;
  int? refundAmount;
  int? cancellationFee;
  double? platformFee;
  int? discount;
  int? amountPayableToDriver;
  String? createdAt;
  String? updatedAt;

  ConfirmBookingData(
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
      this.updatedAt});

  ConfirmBookingData.fromJson(Map<String, dynamic> json) {
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
    // Handle totalAmount as either int or double
    if (json['totalAmount'] != null) {
      totalAmount = json['totalAmount'] is int
          ? (json['totalAmount'] as int).toDouble()
          : json['totalAmount'];
    }
    status = json['status'];
    paymentStatus = json['paymentStatus'];
    cardId = json['cardId'];
    stripePaymentId = json['stripePaymentId'];
    refundId = json['refundId'];
    refundAmount = json['refundAmount'];
    cancellationFee = json['cancellationFee'];
    // Handle platformFee as either int or double
    if (json['platformFee'] != null) {
      platformFee = json['platformFee'] is int
          ? (json['platformFee'] as int).toDouble()
          : json['platformFee'];
    }
    discount = json['discount'];
    amountPayableToDriver = json['amountPayableToDriver'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    return data;
  }
}
