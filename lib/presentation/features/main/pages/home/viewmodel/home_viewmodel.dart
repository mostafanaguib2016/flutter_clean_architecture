import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/domain/usecase/home_usecase.dart';
import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInput,HomeViewModelOutput {

  final StreamController _bannersStreamController = BehaviorSubject<List<BannerAd>>();
  final StreamController _servicesStreamController = BehaviorSubject<List<Service>>();
  final StreamController _storesStreamController = BehaviorSubject<List<Store>>();

  final HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    _getHomeData();
  }

  _getHomeData() async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _homeUseCase.execute(Void)).fold(
          (failure) =>{
        inputState.add(ErrorState(StateRendererType.fullScreenErrorState,failure.message)),
        debugPrint("ERROR ==>  ${failure.message}  ${failure.code}")
      }, (homeObject) =>{

      inputState.add(ContentState()),
      inputBanners.add(homeObject.data?.banners),
      inputServices.add(homeObject.data?.services),
      inputStores.add(homeObject.data?.stores),
    },
    );
  }

  @override
  void dispose() {
    _bannersStreamController.close();
    _storesStreamController.close();
    _servicesStreamController.close();
    super.dispose();
  }

  // Inputs
  @override
  Sink<dynamic> get inputBanners => _bannersStreamController.sink;

  @override
  Sink<dynamic> get inputServices => _servicesStreamController.sink;

  @override
  Sink<dynamic> get inputStores => _storesStreamController.sink;


  // Outputs
  @override
  Stream<List<BannerAd>> get outputBanners => _bannersStreamController.stream.map((banners) => banners);

  @override
  Stream<List<Service>> get outputServices => _servicesStreamController.stream.map((services) => services);

  @override
  Stream<List<Store>> get outputStores => _storesStreamController.stream.map((stores) => stores);

}

mixin HomeViewModelInput {
  Sink get inputStores;
  Sink get inputServices;
  Sink get inputBanners;
}

mixin HomeViewModelOutput {
  Stream<List<Store>> get outputStores;
  Stream<List<Service>> get outputServices;
  Stream<List<BannerAd>> get outputBanners;
}