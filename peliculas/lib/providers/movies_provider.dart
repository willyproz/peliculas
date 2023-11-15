import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '8fd7263ebcdc5beb1ae091d3c6fbc8ed';
  final String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider inicializado');    
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    
    var url = Uri.https( _baseUrl , '/3/movie/now_playing',{'api_key': _apiKey, 'language': _language, 'page': '1'});
      

    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonDecode(response.body));

    print(nowPlayingResponse.results[0].title);
  }



}
