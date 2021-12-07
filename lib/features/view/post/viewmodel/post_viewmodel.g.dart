// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostViewModel on _PostViewModelBase, Store {
  final _$pageStateAtom = Atom(name: '_PostViewModelBase.pageState');

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

  final _$_postListAtom = Atom(name: '_PostViewModelBase._postList');

  @override
  List<PostModel> get _postList {
    _$_postListAtom.reportRead();
    return super._postList;
  }

  @override
  set _postList(List<PostModel> value) {
    _$_postListAtom.reportWrite(value, super._postList, () {
      super._postList = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_PostViewModelBase.init');

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
