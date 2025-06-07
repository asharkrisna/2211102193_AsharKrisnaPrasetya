import '../models/user.dart';

class ApiService {
  static Album fetchAlbum() {
    // Contoh response JSON
    Map<String, dynamic> jsonResponse = {
      "user_id": 1,
      "id": 13,
      "title": "Bedroom Pop"
    };

    // Mengubah JSON ke objek Album
    return Album.fromJson(jsonResponse);
  }
}