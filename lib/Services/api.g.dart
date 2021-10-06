// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Api on ApiBase, Store {
  final _$getUserAsyncAction = AsyncAction('ApiBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$authAsyncAction = AsyncAction('ApiBase.auth');

  @override
  Future auth(String email, String password) {
    return _$authAsyncAction.run(() => super.auth(email, password));
  }

  final _$registerUserAsyncAction = AsyncAction('ApiBase.registerUser');

  @override
  Future registerUser(String email, String userName, String password) {
    return _$registerUserAsyncAction
        .run(() => super.registerUser(email, userName, password));
  }

  final _$getCattlesAsyncAction = AsyncAction('ApiBase.getCattles');

  @override
  Future getCattles() {
    return _$getCattlesAsyncAction.run(() => super.getCattles());
  }

  final _$getCattleByIdAsyncAction = AsyncAction('ApiBase.getCattleById');

  @override
  Future getCattleById(String cattleId) {
    return _$getCattleByIdAsyncAction.run(() => super.getCattleById(cattleId));
  }

  final _$updateCattleAsyncAction = AsyncAction('ApiBase.updateCattle');

  @override
  Future updateCattle(
      String cattleId,
      String creationType,
      String gender,
      String birthDay,
      String weigth,
      String qtdMilk,
      String daysToLactation,
      int farm) {
    return _$updateCattleAsyncAction.run(() => super.updateCattle(
        cattleId,
        creationType,
        gender,
        birthDay,
        weigth,
        qtdMilk,
        daysToLactation,
        farm));
  }

  final _$patchCattleByIdAsyncAction = AsyncAction('ApiBase.patchCattleById');

  @override
  Future patchCattleById(String cattleId) {
    return _$patchCattleByIdAsyncAction
        .run(() => super.patchCattleById(cattleId));
  }

  final _$deleteCattleByIdAsyncAction = AsyncAction('ApiBase.deleteCattleById');

  @override
  Future deleteCattleById(String cattleId) {
    return _$deleteCattleByIdAsyncAction
        .run(() => super.deleteCattleById(cattleId));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
