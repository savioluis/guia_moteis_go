import 'package:equatable/equatable.dart';
import 'package:guia_moteis_go/core/services/dtos/motel_response_dto.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  HomeSuccessState({required this.motelsResponse});
  final MotelResponseDTO motelsResponse;

  @override
  List<Object> get props => [motelsResponse];
}

class HomeFailureState extends HomeState {
  HomeFailureState({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
