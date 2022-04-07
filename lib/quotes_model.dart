class Quotes {
  Quotes({
    required this.text,
    this.author,
    this.tag,
  });

  String text;
  String? author;
  Tag? tag;

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        text: json["text"],
        author: json["author"],
        tag: tagValues.map[json["tag"]],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "author": author,
        "tag": tagValues.reverse[tag],
      };
}

enum Tag { GENERAL, EMPTY, ATTITUDE, BEAUTY, BEST, MARRIAGE, MEDICAL, MEN }

final tagValues = EnumValues({
  "attitude": Tag.ATTITUDE,
  "beauty": Tag.BEAUTY,
  "best": Tag.BEST,
  "": Tag.EMPTY,
  "general": Tag.GENERAL,
  "marriage": Tag.MARRIAGE,
  "medical": Tag.MEDICAL,
  "men": Tag.MEN
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
