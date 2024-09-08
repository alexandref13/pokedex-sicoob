// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsStoreImp on DetailsStore, Store {
  late final _$pokemonStateAtom =
      Atom(name: 'DetailsStore.pokemonState', context: context);

  @override
  PokemonDetailsState get pokemonState {
    _$pokemonStateAtom.reportRead();
    return super.pokemonState;
  }

  @override
  set pokemonState(PokemonDetailsState value) {
    _$pokemonStateAtom.reportWrite(value, super.pokemonState, () {
      super.pokemonState = value;
    });
  }

  late final _$fetchPokemonByIdAsyncAction =
      AsyncAction('DetailsStore.fetchPokemonById', context: context);

  @override
  Future<void> fetchPokemonById({required String id}) {
    return _$fetchPokemonByIdAsyncAction
        .run(() => super.fetchPokemonById(id: id));
  }

  @override
  String toString() {
    return '''
pokemonState: ${pokemonState}
    ''';
  }
}
