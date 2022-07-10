class DonorDatoModel {
  DonorDatoModel({
    required this.civilId,
    required this.fname,
    required this.sname,
    required this.tnmae,
    required this.lname,
    required this.fnameAr,
    required this.snameAr,
    required this.tnmaeAr,
    required this.lnameAr,
    required this.mobil1,
    required this.countryCode,
    required this.genderCode,
    required this.maritalStatusCode,
    required this.zoneCode,
    required this.links,
  });
  late final String civilId;
  late final String fname;
  late final String sname;
  late final String tnmae;
  late final String lname;
  late final String fnameAr;
  late final String snameAr;
  late final String tnmaeAr;
  late final String lnameAr;
  late final String mobil1;
  late final int countryCode;
  late final int genderCode;
  late final int maritalStatusCode;
  late final String zoneCode;
  late final List<Links> links;

  DonorDatoModel.fromJson(Map<String, dynamic> json){
    civilId = json['civil_id'];
    fname = json['fname'];
    sname = json['sname'];
    tnmae = json['tnmae'];
    lname = json['lname'];
    fnameAr = json['fname_ar'];
    snameAr = json['sname_ar'];
    tnmaeAr = json['tnmae_ar'];
    lnameAr = json['lname_ar'];
    mobil1 = json['mobil1'];
    countryCode = json['country_code'];
    genderCode = json['gender_code'];
    maritalStatusCode = json['marital_status_code'];
    zoneCode = json['zone_code'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['civil_id'] = civilId;
    _data['fname'] = fname;
    _data['sname'] = sname;
    _data['tnmae'] = tnmae;
    _data['lname'] = lname;
    _data['fname_ar'] = fnameAr;
    _data['sname_ar'] = snameAr;
    _data['tnmae_ar'] = tnmaeAr;
    _data['lname_ar'] = lnameAr;
    _data['mobil1'] = mobil1;
    _data['country_code'] = countryCode;
    _data['gender_code'] = genderCode;
    _data['marital_status_code'] = maritalStatusCode;
    _data['zone_code'] = zoneCode;
    _data['links'] = links.map((e)=>e.toJson()).toList();
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