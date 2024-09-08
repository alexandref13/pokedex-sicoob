// Mocks generated by Mockito 5.4.4 from annotations
// in pokedex_sicoob/test/mocks/home_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:convert' as _i5;
import 'dart:typed_data' as _i7;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart'
    as _i3;
import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository.dart'
    as _i8;
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemon_by_name.dart'
    as _i11;
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemons_usecase.dart'
    as _i10;
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart'
    as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_1 extends _i1.SmartFake
    implements _i2.StreamedResponse {
  _FakeStreamedResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemonDetailsModel_2 extends _i1.SmartFake
    implements _i3.PokemonDetailsModel {
  _FakePokemonDetailsModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i2.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i4.Future<_i2.Response>);

  @override
  _i4.Future<_i2.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i4.Future<_i2.Response>);

  @override
  _i4.Future<_i2.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i5.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);

  @override
  _i4.Future<_i2.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i5.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);

  @override
  _i4.Future<_i2.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i5.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);

  @override
  _i4.Future<_i2.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i5.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);

  @override
  _i4.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i4.Future<String>.value(_i6.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i4.Future<String>);

  @override
  _i4.Future<_i7.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i4.Future<_i7.Uint8List>.value(_i7.Uint8List(0)),
      ) as _i4.Future<_i7.Uint8List>);

  @override
  _i4.Future<_i2.StreamedResponse> send(_i2.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i4.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_1(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [HomeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRepository extends _i1.Mock implements _i8.HomeRepository {
  MockHomeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i9.PokemonModel>> getPokemons({int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemons,
          [],
          {#page: page},
        ),
        returnValue:
            _i4.Future<List<_i9.PokemonModel>>.value(<_i9.PokemonModel>[]),
      ) as _i4.Future<List<_i9.PokemonModel>>);

  @override
  _i4.Future<_i3.PokemonDetailsModel> getPokemonByName(
          {required String? name}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonByName,
          [],
          {#name: name},
        ),
        returnValue: _i4.Future<_i3.PokemonDetailsModel>.value(
            _FakePokemonDetailsModel_2(
          this,
          Invocation.method(
            #getPokemonByName,
            [],
            {#name: name},
          ),
        )),
      ) as _i4.Future<_i3.PokemonDetailsModel>);
}

/// A class which mocks [GetPokemonsUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPokemonsUsecase extends _i1.Mock
    implements _i10.GetPokemonsUsecase {
  MockGetPokemonsUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i9.PokemonModel>> getPokemons({int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemons,
          [],
          {#page: page},
        ),
        returnValue:
            _i4.Future<List<_i9.PokemonModel>>.value(<_i9.PokemonModel>[]),
      ) as _i4.Future<List<_i9.PokemonModel>>);
}

/// A class which mocks [GetPokemonByNameUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPokemonByNameUsecase extends _i1.Mock
    implements _i11.GetPokemonByNameUsecase {
  MockGetPokemonByNameUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i3.PokemonDetailsModel> getPokemonByName(
          {required String? name}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonByName,
          [],
          {#name: name},
        ),
        returnValue: _i4.Future<_i3.PokemonDetailsModel>.value(
            _FakePokemonDetailsModel_2(
          this,
          Invocation.method(
            #getPokemonByName,
            [],
            {#name: name},
          ),
        )),
      ) as _i4.Future<_i3.PokemonDetailsModel>);
}
