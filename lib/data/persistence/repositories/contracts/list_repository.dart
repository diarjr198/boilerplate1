import 'package:boilerplate/domains/post_domain.dart';

abstract class HomeRepository {
  Future<List<Home>> getHomeList(Map<String, String> params);
}
