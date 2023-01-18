// ignore_for_file: unnecessary_this, unnecessary_new

class TypeModel {
  String? description;

  TypeModel({this.description});

  TypeModel.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Description'] = this.description;
    return data;
  }
}