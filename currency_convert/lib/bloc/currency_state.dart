part of 'currency_bloc.dart';

@immutable
abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}


class CurrencyInitialState extends CurrencyState {}

class CurrencyLoadedState extends CurrencyState {
  final Map<String, double> exchangeRates;

  CurrencyLoadedState(this.exchangeRates);
}