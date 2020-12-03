import 'package:dio/dio.dart';
import 'package:modular_app/app/shared/models/pokemon_model.dart';

class PokemonRepository {
  final Dio dio;

  PokemonRepository({this.dio});

  Future<List<PokemonModel>> getAllPokemons() async {
    Response res = await this.dio.get('/pokemon');

    List<PokemonModel> pokemons = [];

    for (var json in res.data['results'] as List) {
      PokemonModel pokemonModel = new PokemonModel(name: json['name']);

      pokemons.add(pokemonModel);
    }

    return pokemons;
  }
}
