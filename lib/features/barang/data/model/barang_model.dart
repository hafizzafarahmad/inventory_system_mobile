class BarangModel {
  String? code;
  String? status;
  String? message;
  Results? results;
  String? totalData;
  String? offset;
  String? currentPage;
  String? lastPage;
  String? nextPage;
  String? prevPage;

  BarangModel(
      {this.code,
        this.status,
        this.message,
        this.results,
        this.totalData,
        this.offset,
        this.currentPage,
        this.lastPage,
        this.nextPage,
        this.prevPage});

  BarangModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    results =
    json['results'] != null ? Results.fromJson(json['results']) : null;
    totalData = json['total_data'];
    offset = json['offset'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    data['total_data'] = totalData;
    data['offset'] = offset;
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;
    data['next_page'] = nextPage;
    data['prev_page'] = prevPage;
    return data;
  }
}

class Results {
  Item? item;

  Results({this.item});

  Results.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }
}

class Item {
  int? currentPage;
  List<BarangData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Item(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Item.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <BarangData>[];
      json['data'].forEach((v) {
        data!.add(BarangData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class BarangData {
  int? id;
  String? itemName;
  String? uom;
  String? price;
  int? userId;
  int? categoryId;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? pictureName;
  int? disabled;
  int? deleted;
  String? deletedAt;
  String? quantity;
  int? colorId;
  int? sizeId;
  int? vendorId;
  String? purchasePrice;
  String? imageUrl;

  BarangData(
      {this.id,
        this.itemName,
        this.uom,
        this.price,
        this.userId,
        this.categoryId,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.pictureName,
        this.disabled,
        this.deleted,
        this.deletedAt,
        this.quantity,
        this.colorId,
        this.sizeId,
        this.vendorId,
        this.purchasePrice,
        this.imageUrl});

  BarangData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemName = json['item_name'];
    uom = json['uom'];
    price = json['price'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pictureName = json['picture_name'];
    disabled = json['disabled'];
    deleted = json['deleted'];
    deletedAt = json['deleted_at'];
    quantity = json['quantity'];
    colorId = json['color_id'];
    sizeId = json['size_id'];
    vendorId = json['vendor_id'];
    purchasePrice = json['purchase_price'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['item_name'] = itemName;
    data['uom'] = uom;
    data['price'] = price;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['picture_name'] = pictureName;
    data['disabled'] = disabled;
    data['deleted'] = deleted;
    data['deleted_at'] = deletedAt;
    data['quantity'] = quantity;
    data['color_id'] = colorId;
    data['size_id'] = sizeId;
    data['vendor_id'] = vendorId;
    data['purchase_price'] = purchasePrice;
    data['image_url'] = imageUrl;
    return data;
  }
}