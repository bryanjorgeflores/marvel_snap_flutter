class CardM {
  CardM({
    this.cid,
    this.name,
    this.type,
    this.cost,
    this.power,
    this.ability,
    this.flavor,
    this.art,
    this.alternateArt,
    this.url,
    this.status,
    this.carddefid,
    this.tags,
    this.rarity,
    this.raritySlug,
    this.difficulty,
    this.sketcher,
    this.inker,
    this.colorist,
  });

  int? cid;
  String? name;
  String? type;
  int? cost;
  int? power;
  String? ability;
  String? flavor;
  String? art;
  String? alternateArt;
  String? url;
  String? status;
  String? carddefid;
  List<Tag>? tags;
  String? rarity;
  String? raritySlug;
  String? difficulty;
  String? sketcher;
  String? inker;
  String? colorist;

  factory CardM.fromJson(Map<String, dynamic> json) => CardM(
        cid: json["cid"],
        name: json["name"],
        type: json["type"],
        cost: json["cost"],
        power: json["power"],
        ability: json["ability"],
        flavor: json["flavor"],
        art: json["art"],
        alternateArt: json["alternate_art"],
        url: json["url"],
        status: json["status"],
        carddefid: json["carddefid"],
        tags: List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        rarity: json["rarity"],
        raritySlug: json["rarity_slug"],
        difficulty: json["difficulty"],
        sketcher: json["sketcher"],
        inker: json["inker"],
        colorist: json["colorist"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "name": name,
        "type": type,
        "cost": cost,
        "power": power,
        "ability": ability,
        "flavor": flavor,
        "art": art,
        "alternate_art": alternateArt,
        "url": url,
        "status": status,
        "carddefid": carddefid,
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "rarity": rarity,
        "rarity_slug": raritySlug,
        "difficulty": difficulty,
        "sketcher": sketcher,
        "inker": inker,
        "colorist": colorist,
      };
}

class Tag {
  Tag({
    this.tagId,
    this.tag,
    this.tagSlug,
  });

  int? tagId;
  String? tag;
  String? tagSlug;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        tagId: json["tag_id"],
        tag: json["tag"],
        tagSlug: json["tag_slug"],
      );

  Map<String, dynamic> toJson() => {
        "tag_id": tagId,
        "tag": tag,
        "tag_slug": tagSlug,
      };
}
