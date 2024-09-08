// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStoreImp on HomeStore, Store {
  late final _$pokemonNameSearchAtom =
      Atom(name: 'HomeStore.pokemonNameSearch', context: context);

  @override
  String get pokemonNameSearch {
    _$pokemonNameSearchAtom.reportRead();
    return super.pokemonNameSearch;
  }

  @override
  set pokemonNameSearch(String value) {
    _$pokemonNameSearchAtom.reportWrite(value, super.pokemonNameSearch, () {
      super.pokemonNameSearch = value;
    });
  }

  late final _$pokemonStateAtom =
      Atom(name: 'HomeStore.pokemonState', context: context);

  @override
  PokemonState get pokemonState {
    _$pokemonStateAtom.reportRead();
    return super.pokemonState;
  }

  @override
  set pokemonState(PokemonState value) {
    _$pokemonStateAtom.reportWrite(value, super.pokemonState, () {
      super.pokemonState = value;
    });
  }

  late final _$pokemonByNameStateAtom =
      Atom(name: 'HomeStore.pokemonByNameState', context: context);

  @override
  PokemonByNameState get pokemonByNameState {
    _$pokemonByNameStateAtom.reportRead();
    return super.pokemonByNameState;
  }

  @override
  set pokemonByNameState(PokemonByNameState value) {
    _$pokemonByNameStateAtom.reportWrite(value, super.pokemonByNameState, () {
      super.pokemonByNameState = value;
    });
  }

  late final _$fetchPokemonsAsyncAction =
      AsyncAction('HomeStore.fetchPokemons', context: context);

  @override
  Future<void> fetchPokemons() {
    return _$fetchPokemonsAsyncAction.run(() => super.fetchPokemons());
  }

  late final _$fetchMorePokemonsAsyncAction =
      AsyncAction('HomeStore.fetchMorePokemons', context: context);

  @override
  Future<void> fetchMorePokemons({required int page}) {
    return _$fetchMorePokemonsAsyncAction
        .run(() => super.fetchMorePokemons(page: page));
  }

  late final _$handlePokemonByNameAsyncAction =
      AsyncAction('HomeStore.handlePokemonByName', context: context);

  @override
  Future<void> handlePokemonByName({required String name}) {
    return _$handlePokemonByNameAsyncAction
        .run(() => super.handlePokemonByName(name: name));
  }

  late final _$HomeStoreActionController =
      ActionController(name: 'HomeStore', context: context);

  @override
  void setPokemonNameSearch(String value) {
    final _$actionInfo = _$HomeStoreActionController.startAction(
        name: 'HomeStore.setPokemonNameSearch');
    try {
      return super.setPokemonNameSearch(value);
    } finally {
      _$HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonNameSearch: ${pokemonNameSearch},
pokemonState: ${pokemonState},
pokemonByNameState: ${pokemonByNameState}
    ''';
  }
}
