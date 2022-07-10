class MaritalStatusModel {
  MaritalStatusModel({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });
  late final List<MaritalStatusItems> items;
  late final bool hasMore;
  late final int limit;
  late final int offset;
  late final int count;
  late final List<Links> links;

  MaritalStatusModel.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>MaritalStatusItems.fromJson(e)).toList();
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

class MaritalStatusItems {
  MaritalStatusItems({
    required this.maritalStatusCode,
    required this.maritalStatusEnName,
    required this.maritalStatusArName,
  });
  late final int maritalStatusCode;
  late final String maritalStatusEnName;
  late final String maritalStatusArName;

  MaritalStatusItems.fromJson(Map<String, dynamic> json){
    maritalStatusCode = json['marital_status_code'];
    maritalStatusEnName = json['marital_status_en_name'];
    maritalStatusArName = json['marital_status_ar_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['marital_status_code'] = maritalStatusCode;
    _data['marital_status_en_name'] = maritalStatusEnName;
    _data['marital_status_ar_name'] = maritalStatusArName;
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