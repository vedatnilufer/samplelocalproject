// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_user_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectUserViewModel on _SelectUserViewModelBase, Store {
  final _$_userModelAtom = Atom(name: '_SelectUserViewModelBase._userModel');

  @override
  List<UserModel> get _userModel {
    _$_userModelAtom.reportRead();
    return super._userModel;
  }

  @override
  set _userModel(List<UserModel> value) {
    _$_userModelAtom.reportWrite(value, super._userModel, () {
      super._userModel = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_SelectUserViewModelBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
