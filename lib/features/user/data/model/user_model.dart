class UserModel {
  String? code;
  String? status;
  String? message;
  Results? results;

  UserModel({this.code, this.status, this.message, this.results});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  Users? users;

  Results({this.users});

  Results.fromJson(Map<String, dynamic> json) {
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.toJson();
    }
    return data;
  }
}

class Users {
  int? currentPage;
  List<UserData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Users(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Users.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(UserData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
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
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? pin;
  String? phone;
  String? photo;
  String? token;
  String? tokenExpiry;
  int? verified;
  String? createdAt;
  String? updatedAt;
  String? verificationToken;
  String? deviceId;
  String? fcmClientToken;
  int? disabled;
  int? deleted;
  String? deletedAt;
  int? ownerId;
  List<Roles>? roles;

  UserData(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerifiedAt,
        this.pin,
        this.phone,
        this.photo,
        this.token,
        this.tokenExpiry,
        this.verified,
        this.createdAt,
        this.updatedAt,
        this.verificationToken,
        this.deviceId,
        this.fcmClientToken,
        this.disabled,
        this.deleted,
        this.deletedAt,
        this.ownerId,
        this.roles});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    pin = json['pin'];
    phone = json['phone'];
    photo = json['photo'];
    token = json['token'];
    tokenExpiry = json['token_expiry'];
    verified = json['verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    verificationToken = json['verification_token'];
    deviceId = json['device_id'];
    fcmClientToken = json['fcm_client_token'];
    disabled = json['disabled'];
    deleted = json['deleted'];
    deletedAt = json['deleted_at'];
    ownerId = json['owner_id'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['pin'] = pin;
    data['phone'] = phone;
    data['photo'] = photo;
    data['token'] = token;
    data['token_expiry'] = tokenExpiry;
    data['verified'] = verified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['verification_token'] = verificationToken;
    data['device_id'] = deviceId;
    data['fcm_client_token'] = fcmClientToken;
    data['disabled'] = disabled;
    data['deleted'] = deleted;
    data['deleted_at'] = deletedAt;
    data['owner_id'] = ownerId;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? displayName;
  String? description;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
        this.name,
        this.displayName,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['display_name'] = displayName;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? roleId;

  Pivot({this.userId, this.roleId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['role_id'] = roleId;
    return data;
  }
}