// ignore_for_file: unnecessary_this

class StatusModel {
  String? state;

  StatusModel({this.state});

  StatusModel.fromJson(Map<String, dynamic> json) {
    state = json['State'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['State'] = this.state;
    return data;
  }
}