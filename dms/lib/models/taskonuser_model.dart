// ignore_for_file: unnecessary_new

class TaskOnUserModel {
  List<Predecessors>? predecessors;
  String? projectTaskFinal;
  String? projectTaskBegin;
  String? importance;
  String? longDesc;
  List<Performers>? performers;
  String? description;
  String? code;
  String? reviewer;
  String? taskStatus;
  String? percent;

  TaskOnUserModel({
    this.predecessors,
    this.projectTaskFinal,
    this.projectTaskBegin,
    this.importance,
    this.longDesc,
    this.performers,
    this.description,
    this.code,
    this.reviewer,
    this.taskStatus,
    this.percent,
  });

  TaskOnUserModel.fromJson(Map<String, dynamic> json) {
    if (json['Predecessors'] != null) {
      predecessors = <Predecessors>[];
      json['Predecessors'].forEach((v) {
        predecessors!.add(new Predecessors.fromJson(v));
      });
    }
    projectTaskFinal = json['ProjectTaskFinal'];
    projectTaskBegin = json['ProjectTaskBegin'];
    importance = json['Importance'];
    longDesc = json['LongDesc'];
    if (json['Performers'] != null) {
      performers = <Performers>[];
      json['Performers'].forEach((v) {
        performers!.add(new Performers.fromJson(v));
      });
    }
    description = json['Description'];
    code = json['Code'];
    reviewer = json['Reviewer'];
    taskStatus = json['TaskStatus'];
    percent = json['Percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (predecessors != null) {
      data['Predecessors'] = predecessors!.map((v) => v.toJson()).toList();
    }
    data['ProjectTaskFinal'] = projectTaskFinal;
    data['ProjectTaskBegin'] = projectTaskBegin;
    data['Importance'] = importance;
    data['LongDesc'] = longDesc;
    if (performers != null) {
      data['Performers'] = performers!.map((v) => v.toJson()).toList();
    }
    data['Description'] = description;
    data['Code'] = code;
    data['Reviewer'] = code;
    data['TaskStatus'] = taskStatus;
    data['Percent'] = percent;
    return data;
  }
}

class Performers {
  String? avatarlink;
  String? description;

  Performers({this.avatarlink, this.description});

  Performers.fromJson(Map<String, dynamic> json) {
    avatarlink = json['Avatarlink'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Avatarlink'] = avatarlink;
    data['Description'] = description;
    return data;
  }
}

class Predecessors {
  String? code;
  String? description;

  Predecessors({this.code, this.description});

  Predecessors.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['Description'] = description;
    data['Code'] = code;
    return data;
  }
}
