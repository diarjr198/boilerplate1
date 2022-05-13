import 'package:boilerplate/app/ui/pages/home/presenter.dart';
import 'package:boilerplate/domains/post_domain.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final HomeListPresenter _presenter;

  HomeController(this._presenter);

  List<Home> _homeList = [];
  List<Home> get homeList => _homeList;

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void _initialHomeList() {
    _presenter.onSuccess = (data) {
      _homeList = data ?? [];
    };
  }
}
