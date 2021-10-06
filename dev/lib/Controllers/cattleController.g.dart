// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cattleController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CattleController on CattleControllerBase, Store {
  final _$getCattlesAsyncAction =
      AsyncAction('CattleControllerBase.getCattles');

  @override
  Future getCattles() {
    return _$getCattlesAsyncAction.run(() => super.getCattles());
  }

  final _$postCattlesAsyncAction =
      AsyncAction('CattleControllerBase.postCattles');

  @override
  Future postCattles(
      String creationType,
      String cattleId,
      String gender,
      String birthDay,
      String weigth,
      String qtdMilk,
      String daysToLactation,
      int farm) {
    return _$postCattlesAsyncAction.run(() => super.postCattles(creationType,
        cattleId, gender, birthDay, weigth, qtdMilk, daysToLactation, farm));
  }

  final _$getCattleByIdAsyncAction =
      AsyncAction('CattleControllerBase.getCattleById');

  @override
  Future getCattleById(String cattleID) {
    return _$getCattleByIdAsyncAction.run(() => super.getCattleById(cattleID));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
