// ignore_for_file: unnecessary_this, unnecessary_new

class StatusModel {
  String? state;

  StatusModel({this.state});

  StatusModel.fromJson(Map<String, dynamic> json) {
    state = json['State'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['State'] = this.state;
    return data;
  }
}