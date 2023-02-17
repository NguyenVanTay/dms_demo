class DetailProjectModel {
  String? manager;
  String? longDesc;
  String? type;
  String? state;
  String? finalPlan;
  String? beginPlan;
  String? description;
  String? code;

  DetailProjectModel(
      {this.manager,
      this.longDesc,
      this.type,
      this.state,
      this.finalPlan,
      this.beginPlan,
      this.description,
      this.code});

  DetailProjectModel.fromJson(Map<String, dynamic> json) {
    manager = json['Manager'];
    longDesc = json['LongDesc'];
    type = json['Type'];
    state = json['State'];
    finalPlan = json['FinalPlan'];
    beginPlan = json['BeginPlan'];
    description = json['Description'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Manager'] = manager;
    data['LongDesc'] = longDesc;
    data['Type'] = type;
    data['State'] = state;
    data['FinalPlan'] = finalPlan;
    data['BeginPlan'] = beginPlan;
    data['Description'] = description;
    data['Code'] = code;
    return data;
  }
}
