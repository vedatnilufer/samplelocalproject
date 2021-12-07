// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CommentViewModel on _CommentViewModelBase, Store {
  final _$pageStateAtom = Atom(name: '_CommentViewModelBase.pageState');

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

  final _$initAsyncAction = AsyncAction('_CommentViewModelBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
pageState: ${pageState}
    ''';
  }
}
