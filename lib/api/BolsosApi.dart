
import 'dart:typed_data';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class BolsosApi{

  static Dio dio =  Dio();


  static var baseUrlu=  'https://backend-marron.herokuapp.com/api';
  
  static void configureDio(){

   
    dio.options.baseUrl= 'https://backend-marron.herokuapp.com/api';

    //Configurar Headers

    dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''

    };
  }

///////////////////////////////////////////////////////////////
  static Future httpGet(String path) async{
    try{
      final resp= await dio.get(path);
      return resp.data;
    } on DioError catch(e){
      print(e.response);
      throw ('Error en el Get');
    }
  }
///////////////////////////////////////////////////////////////
  static Future post(String path,Map<String,dynamic>data ) async{
//    final formData = FormData.fromMap(data);
     try{
      final resp= await dio.post('$baseUrlu$path',data: data);
     // final resp= await dio.post(path,data: data);      
      print(resp);
      return resp.data;

    } on DioError catch(e){
      print(e);
      throw ('Error en el Post');
    }
  }


///////////////////////////////////////////////////////////////
  static Future put(String path,Map<String,dynamic>data ) async{

    final formData = FormData.fromMap(data);
    try{
      final resp= await dio.put('$baseUrlu$path',data: formData);
      print(resp.data);
      return resp.data;

    } on DioError catch(e){
      print('e');
      throw ('Error en el PUT');
    }
  }
///////////////////////////////////////////////////////////////
  static Future delete(String path,Map<String,dynamic>data ) async{

     final formData = FormData.fromMap(data);
 /*   var formData = FormData.fromMap({
      'data': json.encode(
      {'correo': 'f@gmail.com', 'password': '123456'})
            }); */

    try{
      final resp= await dio.delete('$baseUrlu$path',data: formData);
      print(resp);
      return resp.data;

    } on DioError catch(e){
      print('e');
      throw ('Error en el Delete');
    }
  }
///////////////////////////////////////////////////////////////
  static Future uploadFile(String path,Uint8List bytes ) async{

    final formData = FormData.fromMap({
      'archivo': MultipartFile.fromBytes(bytes)
    });

    try{
      final resp= await dio.put('$baseUrlu$path',data: formData);
      return resp.data;

    } on DioError catch(e){
      print('e');
      throw ('Error en el PUT');
    }
  }

}