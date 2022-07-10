class ReceiveDeptModel {
  ReceiveDeptModel({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });
  late final List<ReceiveDeptItems> items;
  late final bool hasMore;
  late final int limit;
  late final int offset;
  late final int count;
  late final List<Links> links;

  ReceiveDeptModel.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>ReceiveDeptItems.fromJson(e)).toList();
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

class ReceiveDeptItems {
  ReceiveDeptItems({
    required this.deptCode,
    required this.orgCode,
    required this.deptEnName,
    required this.deptArName,
  });
  late final String deptCode;
  late final int orgCode;
  late final String deptEnName;
  late final String deptArName;

  ReceiveDeptItems.fromJson(Map<String, dynamic> json){
    deptCode = json['dept_code'];
    orgCode = json['org_code'];
    deptEnName = json['dept_en_name'];
    deptArName = json['dept_ar_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dept_code'] = deptCode;
    _data['org_code'] = orgCode;
    _data['dept_en_name'] = deptEnName;
    _data['dept_ar_name'] = deptArName;
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