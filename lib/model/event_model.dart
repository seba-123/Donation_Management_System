class EventsModel {
  EventsModel({
    required this.items,
    required this.hasMore,
    required this.limit,
    required this.offset,
    required this.count,
    required this.links,
  });
  late final List<EventItems> items;
  late final bool hasMore;
  late final int limit;
  late final int offset;
  late final int count;
  late final List<Links> links;

  EventsModel.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>EventItems.fromJson(e)).toList();
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

class EventItems {
  EventItems({
    required this.evnttypeCode,
    required this.eventEnName,
    required this.eventArName,
  });
  late final int evnttypeCode;
  late final String eventEnName;
  late final String eventArName;

  EventItems.fromJson(Map<String, dynamic> json){
    evnttypeCode = json['evnttype_code'];
    eventEnName = json['event_en_name'];
    eventArName = json['event_ar_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['evnttype_code'] = evnttypeCode;
    _data['event_en_name'] = eventEnName;
    _data['event_ar_name'] = eventArName;
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