class Spotify {
  Spotify({
      this.results,});

  Spotify.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Results {
  Results({
      this.Kbps,});

  Results.fromJson(dynamic json) {
    Kbps = json['96_kbps'];
  }
  String? Kbps;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['96_kbps'] = Kbps;
    return map;
  }

}