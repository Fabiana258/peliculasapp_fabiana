

import 'package:flutter/cupertino.dart';
import 'package:peliculasapp_fabiana/models/credits_response.dart';
import 'package:peliculasapp_fabiana/models/movie.dart';
import 'package:peliculasapp_fabiana/models/now_playing_response.dart';
import 'package:http/http.dart' as http;
import 'package:peliculasapp_fabiana/models/popular_response.dart';

class MovieProviders extends ChangeNotifier{

  //crear variables para usar con el http
  String _apikey= 'c5fc2c20b46b77ecf55f4067a28bc38f';
  String _baseurl='api.themoviedb.org';
  String _language='es-Es';

  //crear este list para mostrar las imagenes
  List<Movie> ondisplayMovies = [];
  List<Movie> popularMovie= [];
  
  //crear un map 
  Map<int, List <Cast>> movieCast = {};

  MovieProviders(){
    print('MovieProviders inizializando');
      this.getOneDisplayMovies();
      this.getPopularMovies();
  }

  getOneDisplayMovies() async{
     var url =
      Uri.https(_baseurl, '3/movie/now_playing',

      {
        'api_key': _apikey,
        'language': _language,
        'page':'1'
      });
      // Await the http get response, then decode the json-formatted response.
      final response = await http.get(url);
      
      final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
      print(nowPlayingResponse.results[1].title);

      ondisplayMovies = nowPlayingResponse.results;

      notifyListeners();

  }

  getPopularMovies () async{
    var url =
      Uri.https(_baseurl, '3/movie/popular',

      {
        'api_key': _apikey,
        'language': _language,
        'page':'1'
      });
      // Await the http get response, then decode the json-formatted response.
      final response = await http.get(url);
      
      final popularResponse = PopularResponse.fromJson(response.body);
      //print(PopularResponse.results[1].title);
     popularMovie = [...popularMovie, ...popularResponse.results];

      notifyListeners();
  }
  Future<List<Cast>> getMovieCast(int movieId) async{
    
    var url =
    Uri.https(_baseurl, '3/movie/$movieId/credits',

    {
      'api_key': _apikey,
      'language': _language,
      'page':'1'
    });
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    
    final creditsResponse = CreditsResponse.fromJson(response.body);
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
    
  }
}
