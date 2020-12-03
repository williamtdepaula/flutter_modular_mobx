import 'package:mobx/mobx.dart';
import 'package:modular_app/app/modules/home/repositories/pokemon_repository.dart';
import 'package:modular_app/app/shared/models/pokemon_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  PokemonRepository pokemonRepository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _HomeControllerBase({this.pokemonRepository}) {
    this.pokemons = this.pokemonRepository.getAllPokemons().asObservable();
  }
}
