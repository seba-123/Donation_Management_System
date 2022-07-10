class BankBranchModel {
  BankBranchModel({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });
  late final List<BankBranchItems> items;
  late final bool hasMore;
  late final int limit;
  late final int offset;
  late final int count;
  late final List<Links> links;

  BankBranchModel.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>BankBranchItems.fromJson(e)).toList();
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

class BankBranchItems {
  BankBranchItems({
    required this.bankBranchCode,
    required this.branchEnName,
    required this.branchArName,
  });
  late final int bankBranchCode;
  late final String branchEnName;
  late final String branchArName;

  BankBranchItems.fromJson(Map<String, dynamic> json){
    bankBranchCode = json['bank_branch_code'];
    branchEnName = json['branch_en_name'];
    branchArName = json['branch_ar_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bank_branch_code'] = bankBranchCode;
    _data['branch_en_name'] = branchEnName;
    _data['branch_ar_name'] = branchArName;
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