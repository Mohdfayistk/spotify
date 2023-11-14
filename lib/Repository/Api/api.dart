import 'dart:convert';

import 'package:http/http.dart';

import '../Modelclass/spotify.dart';
import 'api_client.dart';

class AnimeApi {
  ApiClient apiClient = ApiClient();

  Future<Spotify> getAnime(String text) async {
    String trendingpath =
        'https://jio-saavan-unofficial.p.rapidapi.com/getsong';
    var body = {
      "encrypted_media_url":
          "ID2ieOjCrwfgWvL5sXl4B1ImC5QfbsDyBlrJGTfFbyAhRCAkx//LGIlozHj/EqcPOiQvaQf6g3CFte9EDf+yEhw7tS9a8Gtq",
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', body);

    return Spotify.fromJson(jsonDecode(response.body));
  }
}
