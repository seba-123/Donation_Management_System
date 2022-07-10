class BankModel {
  BankModel({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });
  late final List<BankItems> items;
  late final bool hasMore;
  late final int limit;
  late final int offset;
  late final int count;
  late final List<Links> links;

  BankModel.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>BankItems.fromJson(e)).toList();
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

class BankItems {
  BankItems({
    required this.bankCode,
    required this.bankEnName,
    required this.bankArName,
  });
  late final int bankCode;
  late final String bankEnName;
  late final String bankArName;

  BankItems.fromJson(Map<String, dynamic> json){
    bankCode = json['bank_code'];
    bankEnName = json['bank_en_name'];
    bankArName = json['bank_ar_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bank_code'] = bankCode;
    _data['bank_en_name'] = bankEnName;
    _data['bank_ar_name'] = bankArName;
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