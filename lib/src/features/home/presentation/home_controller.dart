import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/services/motel_service.dart';
import 'package:guia_moteis_go/src/features/home/presentation/home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({required MotelService motelService})
      : _motelService = motelService,
        super(HomeInitialState());

  final carouselController = PageController(viewportFraction: 1.25);
  final MotelService _motelService;

  Future<void> fetchInitialData() async {
    emit(HomeLoadingState());

    try {
      final motelsResponse = await _motelService.getMotels();

      if (motelsResponse.data.moteis.isEmpty) {
        emit(HomeFailureState(message: 'Nenhum motel encontrado'));
        return;
      }

      // emit(HomeFailureState(message: 'Erro inesperado !'));
      emit(HomeSuccessState(motelsResponse: motelsResponse));
    } catch (e) {
      emit(HomeFailureState(message: e.toString()));
    }
  }
}
