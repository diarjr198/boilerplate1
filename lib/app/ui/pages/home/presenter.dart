import 'package:boilerplate/app/infrastructures/contracts/base_presenter.dart';
import 'package:boilerplate/domains/post_domain.dart';
import 'package:boilerplate/use_cases/home_use_case.dart';

class HomeListPresenter extends BasePresenter<List<Home>, Map<String, String>> {
  HomeListPresenter(GetHomeUseCase useCase) : super(useCase);

  void getHomeList(Map<String, String> params) {
    execute(params);
  }
}
