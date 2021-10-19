// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cattleController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CattleController on CattleControllerBase, Store {
  final _$cattleNameAtom = Atom(name: 'CattleControllerBase.cattleName');

  @override
  String get cattleName {
    _$cattleNameAtom.reportRead();
    return super.cattleName;
  }

  @override
  set cattleName(String value) {
    _$cattleNameAtom.reportWrite(value, super.cattleName, () {
      super.cattleName = value;
    });
  }

  final _$cattleTypeAtom = Atom(name: 'CattleControllerBase.cattleType');

  @override
  String get cattleType {
    _$cattleTypeAtom.reportRead();
    return super.cattleType;
  }

  @override
  set cattleType(String value) {
    _$cattleTypeAtom.reportWrite(value, super.cattleType, () {
      super.cattleType = value;
    });
  }

  final _$cattleGenderAtom = Atom(name: 'CattleControllerBase.cattleGender');

  @override
  String get cattleGender {
    _$cattleGenderAtom.reportRead();
    return super.cattleGender;
  }

  @override
  set cattleGender(String value) {
    _$cattleGenderAtom.reportWrite(value, super.cattleGender, () {
      super.cattleGender = value;
    });
  }

  final _$cattleBirthDayAtom =
      Atom(name: 'CattleControllerBase.cattleBirthDay');

  @override
  String get cattleBirthDay {
    _$cattleBirthDayAtom.reportRead();
    return super.cattleBirthDay;
  }

  @override
  set cattleBirthDay(String value) {
    _$cattleBirthDayAtom.reportWrite(value, super.cattleBirthDay, () {
      super.cattleBirthDay = value;
    });
  }

  final _$cattleWeightAtom = Atom(name: 'CattleControllerBase.cattleWeight');

  @override
  String get cattleWeight {
    _$cattleWeightAtom.reportRead();
    return super.cattleWeight;
  }

  @override
  set cattleWeight(String value) {
    _$cattleWeightAtom.reportWrite(value, super.cattleWeight, () {
      super.cattleWeight = value;
    });
  }

  final _$cattleMilkProducedAtom =
      Atom(name: 'CattleControllerBase.cattleMilkProduced');

  @override
  String get cattleMilkProduced {
    _$cattleMilkProducedAtom.reportRead();
    return super.cattleMilkProduced;
  }

  @override
  set cattleMilkProduced(String value) {
    _$cattleMilkProducedAtom.reportWrite(value, super.cattleMilkProduced, () {
      super.cattleMilkProduced = value;
    });
  }

  final _$cattleLactationPeriodAtom =
      Atom(name: 'CattleControllerBase.cattleLactationPeriod');

  @override
  String get cattleLactationPeriod {
    _$cattleLactationPeriodAtom.reportRead();
    return super.cattleLactationPeriod;
  }

  @override
  set cattleLactationPeriod(String value) {
    _$cattleLactationPeriodAtom.reportWrite(value, super.cattleLactationPeriod,
        () {
      super.cattleLactationPeriod = value;
    });
  }

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
  Future getCattleById(int cattleID) {
    return _$getCattleByIdAsyncAction.run(() => super.getCattleById(cattleID));
  }

  final _$CattleControllerBaseActionController =
      ActionController(name: 'CattleControllerBase');

  @override
  dynamic changeCattleName(String value) {
    final _$actionInfo = _$CattleControllerBaseActionController.startAction(
        name: 'CattleControllerBase.changeCattleName');
    try {
      return super.changeCattleName(value);
    } finally {
      _$CattleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCattleType(String value) {
    final _$actionInfo = _$CattleControllerBaseActionController.startAction(
        name: 'CattleControllerBase.changeCattleType');
    try {
      return super.changeCattleType(value);
    } finally {
      _$CattleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCattleGender(String value) {
    final _$actionInfo = _$CattleControllerBaseActionController.startAction(
        name: 'CattleControllerBase.changeCattleGender');
    try {
      return super.changeCattleGender(value);
    } finally {
      _$CattleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCattleBirthDay(String value) {
    final _$actionInfo = _$CattleControllerBaseActionController.startAction(
        name: 'CattleControllerBase.changeCattleBirthDay');
    try {
      return super.changeCattleBirthDay(value);
    } finally {
      _$CattleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCattleWeight(String value) {
    final _$actionInfo = _$CattleControllerBaseActionController.startAction(
        name: 'CattleControllerBase.changeCattleWeight');
    try {
      return super.changeCattleWeight(value);
    } finally {
      _$CattleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCattleMilkProduced(String value) {
    final _$actionInfo = _$CattleControllerBaseActionController.startAction(
        name: 'CattleControllerBase.changeCattleMilkProduced');
    try {
      return super.changeCattleMilkProduced(value);
    } finally {
      _$CattleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCattleLactationPeriod(String value) {
    final _$actionInfo = _$CattleControllerBaseActionController.startAction(
        name: 'CattleControllerBase.changeCattleLactationPeriod');
    try {
      return super.changeCattleLactationPeriod(value);
    } finally {
      _$CattleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cattleName: ${cattleName},
cattleType: ${cattleType},
cattleGender: ${cattleGender},
cattleBirthDay: ${cattleBirthDay},
cattleWeight: ${cattleWeight},
cattleMilkProduced: ${cattleMilkProduced},
cattleLactationPeriod: ${cattleLactationPeriod}
    ''';
  }
}
