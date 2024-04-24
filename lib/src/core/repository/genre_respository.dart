import 'package:zexonline/src/api/api.dart';
import 'package:zexonline/src/api/apiUrl.dart';
import 'package:zexonline/src/core/model/response/genres_response.dart';

class GenresRepository extends Api {
  GenresRepository();

  Future<GenreResponse> getGenres() async {
    final url = APIUrl.getGenre;
    final response = await request(url, Method.get, useIDToken: false);
    // Save to Local DB

    return GenreResponse.fromJson(response.data);
  }
}
