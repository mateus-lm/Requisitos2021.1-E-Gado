// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FarmController on FarmControllerBase, Store {
  final _$getAsyncAction = AsyncAction('FarmControllerBase.get');

  @override
  Future get() {
    return _$getAsyncAction.run(() => super.get());
  }

  final _$postFarmAsyncAction = AsyncAction('FarmControllerBase.postFarm');

  @override
  Future postFarm(String nameFarm, String city, String state, String size) {
    return _$postFarmAsyncAction
        .run(() => super.postFarm(nameFarm, city, state, size));
  }

  final _$getFarmByIdAsyncAction =
      AsyncAction('FarmControllerBase.getFarmById');

  @override
  Future getFarmById(String farmId) {
    return _$getFarmByIdAsyncAction.run(() => super.getFarmById(farmId));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
