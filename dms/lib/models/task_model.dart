// ignore_for_file: unnecessary_this

class TaskModel {
  String? projectTaskFinal;
  String? projectTaskBegin;
  String? importance;
  String? longDesc;
  List<Performers>? performers;
  String? description;
  String? code;

  TaskModel(
      {this.projectTaskFinal,
      this.projectTaskBegin,
      this.importance,
      this.longDesc,
      this.performers,
      this.description,
      this.code});

  TaskModel.fromJson(Map<String, dynamic> json) {
    projectTaskFinal = json['ProjectTaskFinal'];
    projectTaskBegin = json['ProjectTaskBegin'];
    importance = json['Importance'];
    longDesc = json['LongDesc'];
    if (json['Performers'] != null) {
      performers = <Performers>[];
      json['Performers'].forEach((v) {
        performers!.add(Performers.fromJson(v));
      });
    }
    description = json['Description'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProjectTaskFinal'] = this.projectTaskFinal;
    data['ProjectTaskBegin'] = this.projectTaskBegin;
    data['Importance'] = this.importance;
    data['LongDesc'] = this.longDesc;
    if (this.performers != null) {
      data['Performers'] = this.performers!.map((v) => v.toJson()).toList();
    }
    data['Description'] = this.description;
    data['Code'] = this.code;
    return data;
  }
}

class Performers {
  String? description;

  Performers({this.description});

  Performers.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Description'] = this.description;
    return data;
  }
}