import 'package:flutter/material.dart';
import 'package:loja_virtual/Tabs/home_tabs.dart';
import 'package:loja_virtual/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pagerController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pagerController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pagerController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Plataformas'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pagerController),
          body: Container(),
        ),
        Container(
          color: Colors.yellowAccent,
        ),
        Container(
          color: Colors.yellowAccent,
        ),
        Container(
          color: Colors.yellowAccent,
        ),
      ],
    );
  }
}
