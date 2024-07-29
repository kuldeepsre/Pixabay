import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';

// Define states
abstract class SplashState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoaded extends SplashState {}

class SplashError extends SplashState {
  final String message;

  SplashError(this.message);

  @override
  List<Object> get props => [message];
}

// Define Cubit
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> loadResources() async {
    try {
      // Simulate loading resources
      await Future.delayed(const Duration(seconds: 3));
      emit(SplashLoaded());
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }
}
