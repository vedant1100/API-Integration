import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<Datum>? data;
  final Support? support;

  ProductsModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    support: json["support"] == null ? null : Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "support": support?.toJson(),
  };
}

class Datum {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;

  Datum({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    year: json["year"],
    color: json["color"],
    pantoneValue: json["pantone_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "year": year,
    "color": color,
    "pantone_value": pantoneValue,
  };
}

class Support {
  final String? url;
  final String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}


// /// userId : 1
// /// id : 1
// /// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
// /// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//
// class PostsModel {
//   PostsModel({
//       num? userId,
//       num? id,
//       String? title,
//       String? body,}){
//     _userId = userId;
//     _id = id;
//     _title = title;
//     _body = body;
// }
//
//   PostsModel.fromJson(dynamic json) {
//     _userId = json['userId'];
//     _id = json['id'];
//     _title = json['title'];
//     _body = json['body'];
//   }
//   num? _userId;
//   num? _id;
//   String? _title;
//   String? _body;
// PostsModel copyWith({  num? userId,
//   num? id,
//   String? title,
//   String? body,
// }) => PostsModel(  userId: userId ?? _userId,
//   id: id ?? _id,
//   title: title ?? _title,
//   body: body ?? _body,
// );
//   num? get userId => _userId;
//   num? get id => _id;
//   String? get title => _title;
//   String? get body => _body;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['userId'] = _userId;
//     map['id'] = _id;
//     map['title'] = _title;
//     map['body'] = _body;
//     return map;
//   }
//
// }