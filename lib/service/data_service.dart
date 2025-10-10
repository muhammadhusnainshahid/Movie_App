import 'dart:math';

import 'package:dio/dio.dart';
import 'package:movie_app_demo/constants/urls.dart';
import 'package:movie_app_demo/model/data_model.dart';

class ApiService{
  final Dio dio=Dio();

  Future<List<MovieData>> getMovies() async{
    try{
     final response=await dio.get(Urls.baseUrl);
       if(response.statusCode==200){
        List data= response.data['results'];
        log(data.length);
        return data.map((p)=> MovieData.fromJson(p)).toList();
     }else{
        throw Exception('Failed to get the data');
      }
    }catch(e){
      print(' API Error: $e');
      throw Exception(e);
    } 
   }
  Future<List<MovieData>> getTvShows() async{
   try{
       final response=await dio.get(Urls.tvshows);
        if(response.statusCode==200){
          List data=response.data['results'];
          return data.map((p)=>MovieData.fromJson(p)).toList();
        }else{
          throw Exception('failed to get tv shows');
        }
     }catch(e){
         throw Exception(e);
     }
   }
  Future<List<MovieData>> getUpcoming() async{
    try{
      final response=await dio.get(Urls.upcomings);
      if(response.statusCode==200){
        List data=response.data['results'];
        return data.map((p)=>MovieData.fromJson(p)).toList();
      }else{
        throw Exception('Failed to get upcoming movies');
      }
    }catch(e){
      throw Exception(e);
    }
   }
  Future<List<MovieData>> searchMovies({required searchUrl}) async{
    try{
      final response=await dio.get(searchUrl);
      if(response.statusCode==200){
        List data=response.data['results'];
        return data.map((p)=>MovieData.fromJson(p)).toList();
      }else{
        throw Exception('Will not search here');
      }
    }catch(e){
      throw Exception(e);
    }
   }
  Future<List<MovieData>> getPopular() async{
    try{
      final response=await dio.get(Urls.popular);
      if(response.statusCode==200){
        List data=response.data['results'];
        return data.map((p)=>MovieData.fromJson(p)).toList();
      }else{
        throw Exception('Failed to get popular movies');
      }
    }catch(e){
      throw Exception(e);
    }
  }
}