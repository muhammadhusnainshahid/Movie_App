import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app_demo/model/data_model.dart';
import 'package:movie_app_demo/service/data_service.dart';

class MovieProvider extends ChangeNotifier{
  bool isLoading=false;
  List<MovieData> movies=[];
  List<MovieData> upcoming=[];
  List<MovieData> similarMovies=[];
  List<MovieData> tvshows=[];
  List<MovieData> popular=[];
 List<MovieData> watchList=[];
 bool isWatched=false;

 Future<void> toggleWatchList(MovieData movie) async{
    if(watchList.contains(movie)){
         watchList.remove(movie);
         movie.isWatched=false;
    }else{
        watchList.add(movie);
        movie.isWatched=true;
    }
  notifyListeners();
 }
 
  Future<void> fetchAllMovies() async{
    try{
      isLoading=true;
      notifyListeners();
      movies=await ApiService().getMovies();
      log('Fetched ${movies.length} movies');
      notifyListeners();
    }catch(e){
      throw Exception('In getting movies: $e');
    }finally{
      isLoading=false;
    notifyListeners();
    }
   }
  Future<void> fetchPopular() async{
    try{
      popular=await ApiService().getPopular();
      notifyListeners();
    }catch(e){
      throw Exception('In similarMovies');
    }
   }
  Future<void> fetchTvshows() async{
    try{
      tvshows=await ApiService().getTvShows();
      log(tvshows.toString());
      notifyListeners();
    }catch(e){
      throw Exception('In tvShows :$e');
    }
   }

  Future<void> fetchUpcoming() async{
    try{
      upcoming=await ApiService().getUpcoming();
      notifyListeners();
    }catch(e){
      throw Exception('In upcoming :$e');
    }
  }
 }
                                                      // BOTTOM
class BottomProvider extends ChangeNotifier{
  int currentIndex=0;
  currentPage(int index){
    currentIndex=index;
    notifyListeners();
  }
}
                                                     //SEARCH
class SearchProvider extends ChangeNotifier{
  List<MovieData> searchData=[];
  bool isLoading=false;
  Future<void> searchMovies(String data) async{
      if(data.isEmpty){
        searchData=[];
        notifyListeners();
      }
    isLoading=true;
    notifyListeners();
    try{
      final searchUrl=  "https://api.themoviedb.org/3/search/movie?query=$data&api_key=62993259b09bd60f498f3221ef24fe9c";
      searchData=await ApiService().searchMovies(searchUrl: searchUrl);
    }catch(e){
      throw Exception('In searching: $e');
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }
}
