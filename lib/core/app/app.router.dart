// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bchain_assessment/models/_models.dart' as _i7;
import 'package:bchain_assessment/ui/views/dashboard_view/dashboard_view.dart'
    as _i3;
import 'package:bchain_assessment/ui/views/login_view/login_view.dart' as _i2;
import 'package:bchain_assessment/ui/views/transaction_detail_view/transaction_detail_view.dart'
    as _i5;
import 'package:bchain_assessment/ui/views/transactions_view/transactions_view.dart'
    as _i4;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const loginView = '/';

  static const dashboardView = '/dashboard-view';

  static const transactionsView = '/transactions-view';

  static const transactionDetailView = '/transaction-detail-view';

  static const all = <String>{
    loginView,
    dashboardView,
    transactionsView,
    transactionDetailView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i3.DashboardView,
    ),
    _i1.RouteDef(
      Routes.transactionsView,
      page: _i4.TransactionsView,
    ),
    _i1.RouteDef(
      Routes.transactionDetailView,
      page: _i5.TransactionDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
        settings: data,
      );
    },
    _i3.DashboardView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.DashboardView(),
        settings: data,
      );
    },
    _i4.TransactionsView: (data) {
      final args = data.getArgs<TransactionsViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i4.TransactionsView(key: args.key, asset: args.asset),
        settings: data,
      );
    },
    _i5.TransactionDetailView: (data) {
      final args = data.getArgs<TransactionDetailViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i5.TransactionDetailView(
            key: args.key, transaction: args.transaction),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class TransactionsViewArguments {
  const TransactionsViewArguments({
    this.key,
    required this.asset,
  });

  final _i6.Key? key;

  final _i7.Asset asset;

  @override
  String toString() {
    return '{"key": "$key", "asset": "$asset"}';
  }

  @override
  bool operator ==(covariant TransactionsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.asset == asset;
  }

  @override
  int get hashCode {
    return key.hashCode ^ asset.hashCode;
  }
}

class TransactionDetailViewArguments {
  const TransactionDetailViewArguments({
    this.key,
    required this.transaction,
  });

  final _i6.Key? key;

  final _i7.ITransactionModel transaction;

  @override
  String toString() {
    return '{"key": "$key", "transaction": "$transaction"}';
  }

  @override
  bool operator ==(covariant TransactionDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.transaction == transaction;
  }

  @override
  int get hashCode {
    return key.hashCode ^ transaction.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransactionsView({
    _i6.Key? key,
    required _i7.Asset asset,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transactionsView,
        arguments: TransactionsViewArguments(key: key, asset: asset),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransactionDetailView({
    _i6.Key? key,
    required _i7.ITransactionModel transaction,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transactionDetailView,
        arguments:
            TransactionDetailViewArguments(key: key, transaction: transaction),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransactionsView({
    _i6.Key? key,
    required _i7.Asset asset,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transactionsView,
        arguments: TransactionsViewArguments(key: key, asset: asset),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransactionDetailView({
    _i6.Key? key,
    required _i7.ITransactionModel transaction,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transactionDetailView,
        arguments:
            TransactionDetailViewArguments(key: key, transaction: transaction),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
