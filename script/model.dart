part of 'update_illustrations.dart';

class Illustration {
  Illustration({
    this.illustrations,
    this.hasMore,
    this.nextPage,
  });

  List<IllustrationElement> illustrations;
  bool hasMore;
  int nextPage;

  Illustration copyWith({
    List<IllustrationElement> illustrations,
    bool hasMore,
    int nextPage,
  }) =>
      Illustration(
        illustrations: illustrations ?? this.illustrations,
        hasMore: hasMore ?? this.hasMore,
        nextPage: nextPage ?? this.nextPage,
      );

  factory Illustration.fromJson(String str) =>
      Illustration.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Illustration.fromMap(Map<String, dynamic> json) => Illustration(
        illustrations: json["illustrations"] == null
            ? null
            : List<IllustrationElement>.from(json["illustrations"]
                .map((x) => IllustrationElement.fromMap(x))),
        hasMore: json["hasMore"] == null ? null : json["hasMore"],
        nextPage: json["nextPage"] == null ? null : json["nextPage"],
      );

  Map<String, dynamic> toMap() => {
        "illustrations": illustrations == null
            ? null
            : List<dynamic>.from(illustrations.map((x) => x.toMap())),
        "hasMore": hasMore == null ? null : hasMore,
        "nextPage": nextPage == null ? null : nextPage,
      };
}

class IllustrationElement {
  IllustrationElement({
    this.id,
    this.title,
    this.image,
    this.slug,
  });

  String id;
  String title;
  String image;
  String slug;

  IllustrationElement copyWith({
    String id,
    String title,
    String image,
    String slug,
  }) =>
      IllustrationElement(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        slug: slug ?? this.slug,
      );

  factory IllustrationElement.fromJson(String str) =>
      IllustrationElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IllustrationElement.fromMap(Map<String, dynamic> json) =>
      IllustrationElement(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        slug: json["slug"] == null ? null : json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "slug": slug == null ? null : slug,
      };
}
