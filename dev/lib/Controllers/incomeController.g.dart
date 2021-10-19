// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incomeController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IncomeController on IncomeControllerBase, Store {
  final _$incomeDescriptionAtom =
      Atom(name: 'IncomeControllerBase.incomeDescription');

  @override
  String get incomeDescription {
    _$incomeDescriptionAtom.reportRead();
    return super.incomeDescription;
  }

  @override
  set incomeDescription(String value) {
    _$incomeDescriptionAtom.reportWrite(value, super.incomeDescription, () {
      super.incomeDescription = value;
    });
  }

  final _$getIncomeAsyncAction = AsyncAction('IncomeControllerBase.getIncome');

  @override
  Future getIncome() {
    return _$getIncomeAsyncAction.run(() => super.getIncome());
  }

  final _$postIncomeAsyncAction =
      AsyncAction('IncomeControllerBase.postIncome');

  @override
  Future postIncome(int farm) {
    return _$postIncomeAsyncAction.run(() => super.postIncome(farm));
  }

  final _$getIncomeByIdAsyncAction =
      AsyncAction('IncomeControllerBase.getIncomeById');

  @override
  Future getIncomeById(int incomeID) {
    return _$getIncomeByIdAsyncAction.run(() => super.getIncomeById(incomeID));
  }

  final _$IncomeControllerBaseActionController =
      ActionController(name: 'IncomeControllerBase');

  @override
  dynamic changeIncomeDescription(String value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeIncomeDescription');
    try {
      return super.changeIncomeDescription(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
incomeDescription: ${incomeDescription}
    ''';
  }
}
