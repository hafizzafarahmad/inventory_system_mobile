class BaseModel {
  BaseModel({
    this.code,
    this.messages,
  });
  late final String? code;
  late final String? messages;

  BaseModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    messages = json['message'].toString();
  }
}