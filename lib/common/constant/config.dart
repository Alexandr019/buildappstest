import 'package:injectable/injectable.dart' show singleton;

@singleton
class Config {
  Uri get baseUrl => Uri.parse('https://jsonplaceholder.typicode.com/posts');
}
