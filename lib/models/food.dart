class Food {
  String? id;
  String? name;
  String? description;
  String? picture;
  String? category;

  Food({id, name, description, picture, category});

  Food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    picture = json['picture'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['picture'] = picture;
    data['category'] = category;
    return data;
  }
}
