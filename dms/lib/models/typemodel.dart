

class TypeModel {
  String? description;

  TypeModel({this.description});

  TypeModel.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Description'] = description;
    return data;
  }
}