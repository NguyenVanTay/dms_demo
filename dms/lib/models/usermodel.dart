// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class UserModel {
  String? description;

  UserModel({this.description});

  UserModel.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['Description'] = this.description;
    return data;
  }
}
