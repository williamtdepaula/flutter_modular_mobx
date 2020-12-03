import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/app/modules/home/home.screen.dart';
import 'package:modular_app/app/modules/home/home_controller.dart';
import 'package:modular_app/app/modules/home/repositories/pokemon_repository.dart';

class HomeModule extends ChildModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(pokemonRepository: i.get<PokemonRepository>()),
        ),
        Bind(
          (i) => PokemonRepository(dio: i.get<Dio>()),
        ),
      ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => HomeScreen(),
        ),
      ];
}
