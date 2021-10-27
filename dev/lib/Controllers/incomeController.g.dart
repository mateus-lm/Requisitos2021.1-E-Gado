// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incomeController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IncomeController on IncomeControllerBase, Store {
  final _$profitAtom = Atom(name: 'IncomeControllerBase.profit');

  @override
  int get profit {
    _$profitAtom.reportRead();
    return super.profit;
  }

  @override
  set profit(int value) {
    _$profitAtom.reportWrite(value, super.profit, () {
      super.profit = value;
    });
  }

  final _$expenseAtom = Atom(name: 'IncomeControllerBase.expense');

  @override
  int get expense {
    _$expenseAtom.reportRead();
    return super.expense;
  }

  @override
  set expense(int value) {
    _$expenseAtom.reportWrite(value, super.expense, () {
      super.expense = value;
    });
  }

  final _$totalValueAtom = Atom(name: 'IncomeControllerBase.totalValue');

  @override
  int get totalValue {
    _$totalValueAtom.reportRead();
    return super.totalValue;
  }

  @override
  set totalValue(int value) {
    _$totalValueAtom.reportWrite(value, super.totalValue, () {
      super.totalValue = value;
    });
  }

  final _$profit30Atom = Atom(name: 'IncomeControllerBase.profit30');

  @override
  int get profit30 {
    _$profit30Atom.reportRead();
    return super.profit30;
  }

  @override
  set profit30(int value) {
    _$profit30Atom.reportWrite(value, super.profit30, () {
      super.profit30 = value;
    });
  }

  final _$expense30Atom = Atom(name: 'IncomeControllerBase.expense30');

  @override
  int get expense30 {
    _$expense30Atom.reportRead();
    return super.expense30;
  }

  @override
  set expense30(int value) {
    _$expense30Atom.reportWrite(value, super.expense30, () {
      super.expense30 = value;
    });
  }

  final _$totalValue90Atom = Atom(name: 'IncomeControllerBase.totalValue90');

  @override
  int get totalValue90 {
    _$totalValue90Atom.reportRead();
    return super.totalValue90;
  }

  @override
  set totalValue90(int value) {
    _$totalValue90Atom.reportWrite(value, super.totalValue90, () {
      super.totalValue90 = value;
    });
  }

  final _$incomeIdAtom = Atom(name: 'IncomeControllerBase.incomeId');

  @override
  int get incomeId {
    _$incomeIdAtom.reportRead();
    return super.incomeId;
  }

  @override
  set incomeId(int value) {
    _$incomeIdAtom.reportWrite(value, super.incomeId, () {
      super.incomeId = value;
    });
  }

  final _$incomeTypeAtom = Atom(name: 'IncomeControllerBase.incomeType');

  @override
  String get incomeType {
    _$incomeTypeAtom.reportRead();
    return super.incomeType;
  }

  @override
  set incomeType(String value) {
    _$incomeTypeAtom.reportWrite(value, super.incomeType, () {
      super.incomeType = value;
    });
  }

  final _$incomeValueAtom = Atom(name: 'IncomeControllerBase.incomeValue');

  @override
  String get incomeValue {
    _$incomeValueAtom.reportRead();
    return super.incomeValue;
  }

  @override
  set incomeValue(String value) {
    _$incomeValueAtom.reportWrite(value, super.incomeValue, () {
      super.incomeValue = value;
    });
  }

  final _$incomeDateAtom = Atom(name: 'IncomeControllerBase.incomeDate');

  @override
  String get incomeDate {
    _$incomeDateAtom.reportRead();
    return super.incomeDate;
  }

  @override
  set incomeDate(String value) {
    _$incomeDateAtom.reportWrite(value, super.incomeDate, () {
      super.incomeDate = value;
    });
  }

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

  final _$incomeListAtom = Atom(name: 'IncomeControllerBase.incomeList');

  @override
  List<dynamic> get incomeList {
    _$incomeListAtom.reportRead();
    return super.incomeList;
  }

  @override
  set incomeList(List<dynamic> value) {
    _$incomeListAtom.reportWrite(value, super.incomeList, () {
      super.incomeList = value;
    });
  }

  final _$incomeListMonthAtom =
      Atom(name: 'IncomeControllerBase.incomeListMonth');

  @override
  List<dynamic> get incomeListMonth {
    _$incomeListMonthAtom.reportRead();
    return super.incomeListMonth;
  }

  @override
  set incomeListMonth(List<dynamic> value) {
    _$incomeListMonthAtom.reportWrite(value, super.incomeListMonth, () {
      super.incomeListMonth = value;
    });
  }

  final _$getIncomeAsyncAction = AsyncAction('IncomeControllerBase.getIncome');

  @override
  Future getIncome() {
    return _$getIncomeAsyncAction.run(() => super.getIncome());
  }

  final _$getListAsyncAction = AsyncAction('IncomeControllerBase.getList');

  @override
  Future getList(int opcao) {
    return _$getListAsyncAction.run(() => super.getList(opcao));
  }

  final _$getValuesAsyncAction = AsyncAction('IncomeControllerBase.getValues');

  @override
  Future getValues() {
    return _$getValuesAsyncAction.run(() => super.getValues());
  }

  final _$postIncomeAsyncAction =
      AsyncAction('IncomeControllerBase.postIncome');

  @override
  Future postIncome(String incomeType, String value, String date,
      String description, int farm) {
    return _$postIncomeAsyncAction.run(
        () => super.postIncome(incomeType, value, date, description, farm));
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
  dynamic changeProfit(int value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeProfit');
    try {
      return super.changeProfit(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeExpense(int value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeExpense');
    try {
      return super.changeExpense(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTotalValue(int value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeTotalValue');
    try {
      return super.changeTotalValue(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeProfit30(int value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeProfit30');
    try {
      return super.changeProfit30(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeExpense30(int value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeExpense30');
    try {
      return super.changeExpense30(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTotalValue90(int value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeTotalValue90');
    try {
      return super.changeTotalValue90(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIncomeId(int value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeIncomeId');
    try {
      return super.changeIncomeId(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIncomeType(String value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeIncomeType');
    try {
      return super.changeIncomeType(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIncomeValue(String value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeIncomeValue');
    try {
      return super.changeIncomeValue(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIncomeDate(String value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeIncomeDate');
    try {
      return super.changeIncomeDate(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic changeIncomeList(List<dynamic> value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeIncomeList');
    try {
      return super.changeIncomeList(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIncomeListMonth(List<dynamic> value) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.changeIncomeListMonth');
    try {
      return super.changeIncomeListMonth(value);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getValuePerDay(int opcao) {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.getValuePerDay');
    try {
      return super.getValuePerDay(opcao);
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profit: ${profit},
expense: ${expense},
totalValue: ${totalValue},
profit30: ${profit30},
expense30: ${expense30},
totalValue90: ${totalValue90},
incomeId: ${incomeId},
incomeType: ${incomeType},
incomeValue: ${incomeValue},
incomeDate: ${incomeDate},
incomeDescription: ${incomeDescription},
incomeList: ${incomeList},
incomeListMonth: ${incomeListMonth}
    ''';
  }
}
