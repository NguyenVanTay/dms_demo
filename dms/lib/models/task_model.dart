class TaskModel {
  String? finalPlan;
  String? beginPlan;
  List<Performers>? performers;
  String? description;
  String? code;
  String? longdesc;

  TaskModel(
      {this.finalPlan,
      this.beginPlan,
      this.performers,
      this.description,
      this.code,
      this.longdesc});

  TaskModel.fromJson(Map<String, dynamic> json) {
    finalPlan = json['FinalPlan'];
    beginPlan = json['BeginPlan'];
    if (json['Performers'] != null) {
      performers = <Performers>[];
      json['Performers'].forEach((v) {
        performers!.add(Performers.fromJson(v));
      });
    }
    description = json['Description'];
    code = json['Code'];
    longdesc = json['longdesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FinalPlan'] = finalPlan;
    data['BeginPlan'] = beginPlan;
    if (performers != null) {
      data['Performers'] = performers!.map((v) => v.toJson()).toList();
    }
    data['Description'] = description;
    data['Code'] = code;
    data['LongDesc'] = longdesc;
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
    data['Description'] = description;
    return data;
  }
}
