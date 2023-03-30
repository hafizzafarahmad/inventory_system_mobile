class UserLoginModel {
  String? code;
  String? status;
  String? message;
  Results? results;

  UserLoginModel({this.code, this.status, this.message, this.results});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
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
  User? user;

  Results({this.user});

  Results.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? token;
  List<RoleUser>? roleUser;

  User(
      {this.userId,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.token,
        this.roleUser});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
    if (json['roleUser'] != null) {
      roleUser = <RoleUser>[];
      json['roleUser'].forEach((v) {
        roleUser!.add(RoleUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['token'] = token;
    if (roleUser != null) {
      data['roleUser'] = roleUser!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoleUser {
  int? roleId;
  int? userId;
  String? userType;

  RoleUser({this.roleId, this.userId, this.userType});

  RoleUser.fromJson(Map<String, dynamic> json) {
    roleId = json['role_id'];
    userId = json['user_id'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role_id'] = roleId;
    data['user_id'] = userId;
    data['user_type'] = userType;
    return data;
  }
}