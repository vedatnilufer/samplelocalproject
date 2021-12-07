// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$pageStateAtom = Atom(name: '_ProfileViewModelBase.pageState');

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ProfileViewModelBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$deleteItemAsyncAction =
      AsyncAction('_ProfileViewModelBase.deleteItem');

  @override
  Future deleteItem(dynamic key, dynamic model) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(key, model));
  }

  @override
  String toString() {
    return '''
pageState: ${pageState}
    ''';
  }
}
