class CardModel {
  String? message;
  List<Data>? data;

  CardModel({this.message, this.data});

  CardModel.fromJson(Map<String, dynamic> json) {
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
  String? brand;
  String? last4;
  int? expMonth;
  int? expYear;
  bool? isDefault;

  Data(
      {this.id,
      this.brand,
      this.last4,
      this.expMonth,
      this.expYear,
      this.isDefault});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    last4 = json['last4'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand'] = brand;
    data['last4'] = last4;
    data['exp_month'] = expMonth;
    data['exp_year'] = expYear;
    data['isDefault'] = isDefault;
    return data;
  }
}
