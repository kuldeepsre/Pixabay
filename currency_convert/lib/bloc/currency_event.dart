part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent {}
class FetchExchangeRates extends CurrencyEvent {}