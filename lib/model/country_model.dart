class CountryModel {
  CountryModel({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });
  late final List<CountryItems> items;
  late final bool hasMore;
  late final int limit;
  late final int offset;
  late final int count;
  late final List<Links> links;

  CountryModel.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>CountryItems.fromJson(e)).toList();
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

class CountryItems {
  CountryItems({
    required this.countryCode,
    required this.countryEnName,
    required this.countryArName,
  });
  late final int countryCode;
  late final String countryEnName;
  late final String countryArName;

  CountryItems.fromJson(Map<String, dynamic> json){
    countryCode = json['country_code'];
    countryEnName = json['country_en_name'];
    countryArName = json['country_ar_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country_code'] = countryCode;
    _data['country_en_name'] = countryEnName;
    _data['country_ar_name'] = countryArName;
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