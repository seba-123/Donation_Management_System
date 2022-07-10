// 20210928172458
// http://hospitals.talabtcp.ly/public/api/hospitals

import 'package:dio/dio.dart';

class DioHelpers {

  static Dio ?dio;

  static int()
  {
   dio = Dio(
     BaseOptions(
         baseUrl: 'https://apex.oracle.com/pls/apex/apexapi/dms/',
       receiveDataWhenStatusError: true,
     )
   );
  }

 static Future<Response> getData({
  required url,
      Map<String , dynamic>? query,
}) async {
  return await dio!.get(url , queryParameters: query,options: Options(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  }));
  }

 static Future<Response>  postData({
  required url,
      Map<String , dynamic>? query,
      Map<String , dynamic>? data,
}) async {
  return await dio!.post(url ,
    queryParameters: query,
    data:data,);
  }

}