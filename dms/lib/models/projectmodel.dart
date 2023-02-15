class ProjectModel {
  List<ProjectTeam>? projectTeam;
  String? manager;
  String? longDesc;
  String? type;
  String? state;
  String? finalPlan;
  String? beginPlan;
  String? code;
  String? description;

  ProjectModel(
      {this.projectTeam,
      this.manager,
      this.longDesc,
      this.type,
      this.state,
      this.finalPlan,
      this.beginPlan,
      this.code,
      this.description});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    if (json['ProjectTeam'] != null) {
      projectTeam = <ProjectTeam>[];
      json['ProjectTeam'].forEach((v) {
        projectTeam!.add(new ProjectTeam.fromJson(v));
      });
    }
    manager = json['Manager'];
    longDesc = json['LongDesc'];
    type = json['Type'];
    state = json['State'];
    finalPlan = json['FinalPlan'];
    beginPlan = json['BeginPlan'];
    code = json['Code'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (projectTeam != null) {
      data['ProjectTeam'] = projectTeam!.map((v) => v.toJson()).toList();
    }
    data['Manager'] = manager;
    data['LongDesc'] = longDesc;
    data['Type'] = type;
    data['State'] = state;
    data['FinalPlan'] = finalPlan;
    data['BeginPlan'] = beginPlan;
    data['Code'] = code;
    data['Description'] = description;
    return data;
  }
}

class ProjectTeam {
  String? role;
  String? description;

  ProjectTeam({this.role, this.description});

  ProjectTeam.fromJson(Map<String, dynamic> json) {
    role = json['Role'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Role'] = role;
    data['Description'] = description;
    return data;
  }
}
