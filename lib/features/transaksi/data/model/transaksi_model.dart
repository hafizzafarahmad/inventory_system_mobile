class TransaksiModel {
  String? code;
  String? status;
  String? message;
  Results? results;

  TransaksiModel({this.code, this.status, this.message, this.results});

  TransaksiModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    results =
    json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  List<TransaksiData>? item;

  Results({this.item});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = <TransaksiData>[];
      json['item'].forEach((v) {
        item!.add(TransaksiData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (item != null) {
      data['item'] = item!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransaksiData {
  int? itemId;
  String? itemName;
  int? userId;
  String? inputDate;
  int? quantity;
  int? transId;
  String? transType;
  String? updatedAt;

  TransaksiData(
      {this.itemId,
        this.itemName,
        this.userId,
        this.inputDate,
        this.quantity,
        this.transId,
        this.transType,
        this.updatedAt});

  TransaksiData.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    userId = json['user_id'];
    inputDate = json['input_date'];
    quantity = json['quantity'];
    transId = json['trans_id'];
    transType = json['trans_type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['user_id'] = userId;
    data['input_date'] = inputDate;
    data['quantity'] = quantity;
    data['trans_id'] = transId;
    data['trans_type'] = transType;
    data['updated_at'] = updatedAt;
    return data;
  }
}