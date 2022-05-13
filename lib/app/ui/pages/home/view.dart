import 'package:boilerplate/app/ui/pages/home/controller.dart';
import 'package:boilerplate/domains/post_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get_it/get_it.dart';

class HomePage extends View {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(
        GetIt.I.get(),
      );
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  final HomeController _controller;

  _HomePageState(this._controller) : super(_controller);

  Widget get mobileView => Scaffold(
      appBar: AppBar(
        title: Text("Boilerplate"),
      ),
      body: Container(
        child: _mobileBody(),
      ));

  Widget _mobileBody() {
    return ControlledWidgetBuilder<HomeController>(
      builder: (context, controller) => Column(
        children: [
          Text('HomePage'),
          SizedBox(height: 30),
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                var services = controller.homeList;
                print(services);

                return _listCard(services: services);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _listCard({
    // required HomeController controller,
    required List<Home> services,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      color: Colors.lightBlue,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Name: Sanctuary Home'),
            ],
          ),
          Row(
            children: [
              Text('City: Jakarta'),
            ],
          ),
          Row(
            children: [
              Text('Country: Indonesia'),
            ],
          ),
          Row(
            children: [
              Text('Price: 48'),
            ],
          ),
          Row(
            children: [
              Text('Rating: 5'),
            ],
          ),
          // Text('Kitchen: 2'),
          // Text('Bedroom: 3'),
          // Text('Cupboard: 3'),
        ],
      ),
    );
  }

  @override
  // TODO: implement view
  Widget get view => mobileView;
}
