import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:wallpaper_api/api/api_urls.dart';

import 'app_exception.dart';



class ApiHelper{


  Future<dynamic> getApiData({required String url}) async {

   try {
     var response = await http.get(Uri.parse(url), headers: {
       'Authorization':Urls.API_KEY
     });
     return returnhttpresponse(response);
   }on SocketException catch(e){
     throw FetchDataException(errormsg: "No internet");
   }
   }


   dynamic returnhttpresponse(http.Response response){

    switch(response.statusCode){
      case 200:{
        var mData=jsonDecode(response.body);
        return mData;
      }

      case 400:
        throw BadRequestException(errormsg: response.body.toString());
      case 401:
      case 403:
        throw UnAutrosiedException(errormsg: response.body.toString());
      case 500:
      default:
        throw FetchDataException(errormsg:
        "Error occurred while Communication with Server with StatusCode : ${response.statusCode}");
    }

    }






}