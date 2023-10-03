import 'package:bloc_bloc/data/models/user_model.dart';
import 'package:bloc_bloc/data/networks/network_service.dart';

class Repository {
  final API api;
  Repository(this.api);

  Future fetchPost() async {
    final user = await api.httpGet('users', {});
    return user.map((e) => UserModel.fromJson(e)).toList();
  }

  Future deletePost() async {
    final response = await api.httpDelete('users', 1);
    dynamic data;
    if (response == 200) {
      data = await fetchPost();
    }
    return data;
  }

  Future createPost() async {
    final response = await api.httpPost('users', {
      "name": "Cuong",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    });
    dynamic data;
    if (response == 200) {
      data = await fetchPost();
    }
    return data;
  }
}
