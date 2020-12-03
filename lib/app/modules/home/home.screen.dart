import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/app/modules/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
      ),
      body: _handlerRenderBody(),
    );
  }

  Widget _handlerRenderBody() {
    return Observer(builder: (BuildContext context) {
      if (_homeController.pokemons.error != null) {
        return Center(
          child: Text('Erro'),
        );
      }
      if (_homeController.pokemons.value == null) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
        itemCount: _homeController.pokemons.value.length,
        itemBuilder: (_, int i) {
          return ListTile(
            title: Text(_homeController.pokemons.value[i].name),
          );
        },
      );
    });
  }
}
