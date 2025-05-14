<?php 
$class_name = ucfirst($name);
$string = "
import 'dart:async';
import 'dart:convert';
import 'package:antrian/utils/webservice.dart';
import 'package:dio/dio.dart';
import 'package:antrian/utils/constants.dart';

import '".$name."_model.dart';



class ".$class_name."Service {
  Response response;
  Dio dio = new Dio();
  final String tableName = '".$table_name."';

  Future<List<".$class_name.">> getAll(page) async {
    try{
      response = await dio.post('\$APP_URL/api/getall/".$name."?page=\$page');
      Iterable list = response.data['data'];
      return list.map((model) => ".$class_name.".fromMap(model)).toList();
    } on DioError catch(e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if(e.response != null) {
          print(e.response.data);
          print(e.response.headers);
          print(e.response.request);
      } else{
          // Something happened in setting up or sending the request that triggered an Error
          print(e.request);
          print(e.message);
      }
    }
    return null;
  }

  Future<void> add(Map<String,dynamic> data) async {
    data['form_id'] = ".$form_id.";
    FormData formData = new FormData.fromMap(data);
    try{
      response = await dio.post('\$APP_URL/api/form_action', data: formData);
    } on DioError catch(e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if(e.response != null) {
          print(e.response.data);
          print(e.response.headers);
          print(e.response.request);
      } else{
          // Something happened in setting up or sending the request that triggered an Error
          print(e.request);
          print(e.message);
      }
    }
  }

  Future<void> edit(Map<String,dynamic> data) async{
    data['form_id'] = ".$form_id.";
    FormData formData = new FormData.fromMap(data);
    try{
      response = await dio.post('\$APP_URL/api/form_action', data: formData);
    } on DioError catch(e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if(e.response != null) {
          print(e.response.data);
          print(e.response.headers);
          print(e.response.request);
      } else{
          // Something happened in setting up or sending the request that triggered an Error
          print(e.request);
          print(e.message);
      }
    }
  }

  Future<void> delete(String id) {
    
  }

}
";
echo $string;

 ?>
