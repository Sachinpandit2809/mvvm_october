class UserModel {
  String? message;
  String? id;
  String? email;

  UserModel({this.message, this.id, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id'] = this.id;
    data['email'] = this.email;
    return data;
  }
}
