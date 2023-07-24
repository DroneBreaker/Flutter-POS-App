class Food {
  String? id;
  String? date;
  String? order;
  String? category;

  Food({id, date, order, category});

  Food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    order = json['order'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['order'] = order;
    data['category'] = category;
    return data;
  }
}
