// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashViewModel on _SplashViewModelBase, Store {
  final _$imageAtom = Atom(name: '_SplashViewModelBase.image');

  @override
  Widget get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(Widget value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$allCacheDataAsyncAction =
      AsyncAction('_SplashViewModelBase.allCacheData');

  @override
  Future<bool> allCacheData(BuildContext context) {
    return _$allCacheDataAsyncAction.run(() => super.allCacheData(context));
  }

  @override
  String toString() {
    return '''
image: ${image}
    ''';
  }
}
