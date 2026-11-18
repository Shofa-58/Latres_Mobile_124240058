import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/show.dart';

class ApiService {
  static const String _base = 'https://api.tvmaze.com/shows';

  Future<List<Show>> fetchShows() async {
    final res = await http.get(Uri.parse(_base));
    if (res.statusCode != 200) throw Exception('Gagal memuat shows');
    final List data = jsonDecode(res.body);
    return data.map((e) => Show.fromJson(e)).toList();
  }

  Future<Show> fetchShowDetail(int id) async {
    final res = await http.get(Uri.parse('$_base/$id'));
    if (res.statusCode != 200) throw Exception('Gagal memuat detail');
    return Show.fromJson(jsonDecode(res.body));
  }
}