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
    json['results'] != null ? new Results.fromJson(json['results']) : null;
    totalData = json['total_data'];
    offset = json['offset'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    data['total_data'] = this.totalData;
    data['offset'] = this.offset;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['next_page'] = this.nextPage;
    data['prev_page'] = this.prevPage;
    return data;
  }
}

class Results {
  Item? item;

  Results({this.item});

  Results.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
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
        data!.add(new BarangData.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
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
  String? barcode;
  String? imageUrl;
  IStock? iStock;

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
        this.barcode,
        this.imageUrl,
        this.iStock});

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
    barcode = json['barcode'];
    imageUrl = json['image_url'];
    iStock =
    json['i_stock'] != null ? new IStock.fromJson(json['i_stock']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_name'] = this.itemName;
    data['uom'] = this.uom;
    data['price'] = this.price;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['picture_name'] = this.pictureName;
    data['disabled'] = this.disabled;
    data['deleted'] = this.deleted;
    data['deleted_at'] = this.deletedAt;
    data['quantity'] = this.quantity;
    data['color_id'] = this.colorId;
    data['size_id'] = this.sizeId;
    data['vendor_id'] = this.vendorId;
    data['purchase_price'] = this.purchasePrice;
    data['barcode'] = this.barcode;
    data['image_url'] = this.imageUrl;
    if (this.iStock != null) {
      data['i_stock'] = this.iStock!.toJson();
    }
    return data;
  }
}

class IStock {
  int? itemId;
  int? ownerId;
  String? quantity;
  int? categoryId;
  int? sizeId;
  int? colorId;
  String? uom;
  String? barcode;
  String? createdAt;

  IStock(
      {this.itemId,
        this.ownerId,
        this.quantity,
        this.categoryId,
        this.sizeId,
        this.colorId,
        this.uom,
        this.barcode,
        this.createdAt});

  IStock.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    ownerId = json['owner_id'];
    quantity = json['quantity'];
    categoryId = json['category_id'];
    sizeId = json['size_id'];
    colorId = json['color_id'];
    uom = json['uom'];
    barcode = json['barcode'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['owner_id'] = this.ownerId;
    data['quantity'] = this.quantity;
    data['category_id'] = this.categoryId;
    data['size_id'] = this.sizeId;
    data['color_id'] = this.colorId;
    data['uom'] = this.uom;
    data['barcode'] = this.barcode;
    data['created_at'] = this.createdAt;
    return data;
  }
}