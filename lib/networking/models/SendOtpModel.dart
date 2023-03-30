class SendOtpModel {
  SendOtpModel({
      this.status,
      this.response,
      this.requestId,});

  SendOtpModel.fromJson(dynamic json) {
    status = json['status'];
    response = json['response'];
    requestId = json['request_id'];
  }
  bool? status;
  String? response;
  dynamic? requestId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['response'] = response;
    map['request_id'] = requestId;
    return map;
  }

}