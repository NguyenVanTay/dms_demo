class FolderModel {
  String? code;
  String? description;

  FolderModel({this.code, this.description});

  FolderModel.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code'] = code;
    data['Description'] = description;
    return data;
  }
}
