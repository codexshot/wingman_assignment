import 'dart:convert';

import 'package:assignment/networking/TokenHandler.dart';
import 'package:assignment/networking/models/VerifyOtpModel.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../constants/service_constants.dart';
import 'DioClient.dart';
import 'api_result.dart';
import 'models/RegisterUserModel.dart';
import 'models/SendOtpModel.dart';
import 'network_exceptions.dart';

class APIRepository {
  DioClient? dioClient;

  APIRepository({required bool isTokenRequired}) {
    var dio = Dio();

    if (isTokenRequired) {
      setToken(dio);
    } else {
      dioClient = DioClient(ServiceConstants.BASE_URL, '', dio);
    }
  }

  setToken(dio) async {
    final token = await readJwtToken();

    dioClient = DioClient(ServiceConstants.BASE_URL, token!, dio);
  }

//===================================Send OTP API ============================================//

  Future<ApiResult<SendOtpModel>> sendOTP({String? phoneNo}) async {
    final body = json.encode({"mobile": "$phoneNo"});
    try {
      final response =
          await dioClient!.post(ServiceConstants.SEND_OTP, data: body);
      SendOtpModel phoneNumberResponseModel = SendOtpModel.fromJson(response);
      return ApiResult.success(data: phoneNumberResponseModel);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

//===================================Verify OTP API ============================================//

  Future<ApiResult<VerifyOtpModel>> verifyOTP(
      {required String req_id, required String pin}) async {
    final body = json.encode({"request_id": req_id, "code": pin});
    try {
      final response =
          await dioClient!.post(ServiceConstants.VERIFY_OTP, data: body);
      VerifyOtpModel verifyOtpModel = VerifyOtpModel.fromJson(response);
      return ApiResult.success(data: verifyOtpModel);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //=================================Register User =============================

  Future<ApiResult<RegisterUserModel>> registerUser(
      {required String name, required String email}) async {
    final body = json.encode({"name": name, "email": email});
    try {
      final response =
          await dioClient!.post(ServiceConstants.REGISTER, data: body);
      RegisterUserModel registerUserModel =
          RegisterUserModel.fromJson(response);
      return ApiResult.success(data: registerUserModel);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
