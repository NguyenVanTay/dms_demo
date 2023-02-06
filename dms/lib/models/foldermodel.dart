class FolderModel {
  String? code;
  String? description;

  FolderModel({this.code, this.description});

  FolderModel.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Description'] = this.description;
    return data;
  }
}
