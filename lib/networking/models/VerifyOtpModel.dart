class VerifyOtpModel {
  VerifyOtpModel({
      this.status, 
      this.profileExists,
    this.response,
      this.jwt,});

  VerifyOtpModel.fromJson(dynamic json) {
    status = json['status'];
    profileExists = json['profile_exists'];
    jwt = json['jwt'];
    response=json['response'];
  }
  bool? status;
  bool? profileExists;
  String? jwt;
  String? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['profile_exists'] = profileExists;
    map['jwt'] = jwt;
    map['response']=response;
    return map;
  }

}