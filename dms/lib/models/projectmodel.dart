// class ProjectModel {
//   String? manager;
//   String? longDesc;
//   String? type;
//   String? state;
//   String? projectFinal;
//   String? projectBegin;
//   String? code;
//   String? description;

//   ProjectModel(
//       {this.manager,
//       this.longDesc,
//       this.type,
//       this.state,
//       this.projectFinal,
//       this.projectBegin,
//       this.code,
//       this.description});

//   ProjectModel.fromJson(Map<String, dynamic> json) {
//     manager = json['Manager'];
//     longDesc = json['LongDesc'];
//     type = json['Type'];
//     state = json['State'];
//     projectFinal = json['ProjectFinal'];
//     projectBegin = json['ProjectBegin'];
//     code = json['Code'];
//     description = json['Description'];
//   }

// ignore_for_file: unnecessary_this

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['Manager'] = manager;
//     data['LongDesc'] = longDesc;
//     data['Type'] = type;
//     data['State'] = state;
//     data['ProjectFinal'] = projectFinal;
//     data['ProjectBegin'] = projectBegin;
//     data['Code'] = code;
//     data['Description'] = description;
//     return data;
//   }
// }
class ProjectModel {
  List<ProjectTeam>? projectTeam;
  String? manager;
  String? longDesc;
  String? type;
  String? state;
  String? projectFinal;
  String? projectBegin;
  String? description;
  String? code;

  ProjectModel(
      {this.projectTeam,
      this.manager,
      this.longDesc,
      this.type,
      this.state,
      this.projectFinal,
      this.projectBegin,
      this.description,
      this.code});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    if (json['ProjectTeam'] != null) {
      projectTeam = <ProjectTeam>[];
      json['ProjectTeam'].forEach((v) {
        projectTeam!.add(ProjectTeam.fromJson(v));
      });
    }
    manager = json['Manager'];
    longDesc = json['LongDesc'];
    type = json['Type'];
    state = json['State'];
    projectFinal = json['ProjectFinal'];
    projectBegin = json['ProjectBegin'];
    description = json['Description'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.projectTeam != null) {
      data['ProjectTeam'] = this.projectTeam!.map((v) => v.toJson()).toList();
    }
    data['Manager'] = this.manager;
    data['LongDesc'] = this.longDesc;
    data['Type'] = this.type;
    data['State'] = this.state;
    data['ProjectFinal'] = this.projectFinal;
    data['ProjectBegin'] = this.projectBegin;
    data['Description'] = this.description;
    data['Code'] = this.code;
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
    data['Role'] = this.role;
    data['Description'] = this.description;
    return data;
  }
}
