

class UserModel {
  String? description;

  UserModel(UserModel user, String string, {this.description, required String iso});

  UserModel.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Description'] =description;
    return data;
  }
}
