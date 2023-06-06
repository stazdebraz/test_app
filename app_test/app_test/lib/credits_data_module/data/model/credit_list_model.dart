class CreditsListModel {
  List<Credits>? credits;

  CreditsListModel({this.credits});

  CreditsListModel.fromJson(Map<String, dynamic> json) {
    if (json['credits'] != null) {
      credits = <Credits>[];
      json['credits'].forEach((v) {
        credits!.add(Credits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (credits != null) {
      data['credits'] = credits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Credits {
  int? creditId;
  String? description;
  String? type;

  Credits({this.creditId, this.description, this.type});

  Credits.fromJson(Map<String, dynamic> json) {
    creditId = json['credit_id'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['credit_id'] = creditId;
    data['description'] = description;
    data['type'] = type;
    return data;
  }
}