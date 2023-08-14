class Order {
  String? id;
  String? date;
  List<Orders>? orders;

  Order({this.id, this.date, this.orders});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String? type;
  String? id;

  Orders({this.type, this.id});

  Orders.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    return data;
  }
}
