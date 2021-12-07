// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_app_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RootAppViewModel on _RootAppViewModelBase, Store {
  final _$pageIndexAtom = Atom(name: '_RootAppViewModelBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  final _$_userModelAtom = Atom(name: '_RootAppViewModelBase._userModel');

  @override
  UserModel get _userModel {
    _$_userModelAtom.reportRead();
    return super._userModel;
  }

  @override
  set _userModel(UserModel value) {
    _$_userModelAtom.reportWrite(value, super._userModel, () {
      super._userModel = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_RootAppViewModelBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_RootAppViewModelBaseActionController =
      ActionController(name: '_RootAppViewModelBase');

  @override
  dynamic onPage(int? value) {
    final _$actionInfo = _$_RootAppViewModelBaseActionController.startAction(
        name: '_RootAppViewModelBase.onPage');
    try {
      return super.onPage(value);
    } finally {
      _$_RootAppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex}
    ''';
  }
}
