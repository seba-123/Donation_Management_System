class PayModel {
  PayModel({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });
  late final List<PayModelItems> items;
  late final bool hasMore;
  late final int limit;
  late final int offset;
  late final int count;
  late final List<Links> links;

  PayModel.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>PayModelItems.fromJson(e)).toList();
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

class PayModelItems {
  PayModelItems({
    required this.payTypeCode,
    required this.paytypeEnName,
    required this.paytypeArName,
  });
  late final int payTypeCode;
  late final String paytypeEnName;
  late final String paytypeArName;

  PayModelItems.fromJson(Map<String, dynamic> json){
    payTypeCode = json['pay_type_code'];
    paytypeEnName = json['paytype_en_name'];
    paytypeArName = json['paytype_ar_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pay_type_code'] = payTypeCode;
    _data['paytype_en_name'] = paytypeEnName;
    _data['paytype_ar_name'] = paytypeArName;
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