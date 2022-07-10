class GenderModel {
  GenderModel({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });
  late final List<GenderItems> items;
  late final bool hasMore;
  late final int limit;
  late final int offset;
  late final int count;
  late final List<Links> links;

  GenderModel.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>GenderItems.fromJson(e)).toList();
    hasMore = json['hasMore'];
    limit = json['limit'];
    offset = json['offset'];
    count = json['count'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e)=>e.toJson()).toList();
    _data['hasMore'] = hasMore;
    _data['limit'] = limit;
    _data['offset'] = offset;
    _data['count'] = count;
    _data['links'] = links.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class GenderItems {
  GenderItems({
    required this.genderCode,
    required this.genderEnName,
    required this.genderArName,
  });
  late final int genderCode;
  late final String genderEnName;
  late final String genderArName;

  GenderItems.fromJson(Map<String, dynamic> json){
    genderCode = json['gender_code'];
    genderEnName = json['gender_en_name'];
    genderArName = json['gender_ar_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gender_code'] = genderCode;
    _data['gender_en_name'] = genderEnName;
    _data['gender_ar_name'] = genderArName;
    return _data;
  }
}

class Links {
  Links({
    required this.rel,
    required this.href,
  });
  late final String rel;
  late final String href;

  Links.fromJson(Map<String, dynamic> json){
    rel = json['rel'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rel'] = rel;
    _data['href'] = href;
    return _data;
  }
}