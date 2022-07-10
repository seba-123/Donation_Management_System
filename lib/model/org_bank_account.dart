class OrgBankAccount {
  OrgBankAccount({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });
  late final List<OrgBankItems> items;
  late final bool hasMore;
  late final int limit;
  late final int offset;
  late final int count;
  late final List<Links> links;

  OrgBankAccount.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>OrgBankItems.fromJson(e)).toList();
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

class OrgBankItems {
  OrgBankItems.OrgBankItems({
    required this.orgCode,
    required this.bankCode,
    required this.bankName,
    required this.bankBranchCode,
    required this.accountNo,
  });
  late final int orgCode;
  late final int bankCode;
  late final String bankName;
  late final int bankBranchCode;
  late final String accountNo;

  OrgBankItems.fromJson(Map<String, dynamic> json){
    orgCode = json['org_code'];
    bankCode = json['bank_code'];
    bankName = json['bank_name'];
    bankBranchCode = json['bank_branch_code'];
    accountNo = json['account_no'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['org_code'] = orgCode;
    _data['bank_code'] = bankCode;
    _data['bank_name'] = bankName;
    _data['bank_branch_code'] = bankBranchCode;
    _data['account_no'] = accountNo;
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