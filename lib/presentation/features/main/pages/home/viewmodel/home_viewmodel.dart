import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/constants.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/domain/usecase/home_usecase.dart';
import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInput,HomeViewModelOutput {

  final _dataStreamController = BehaviorSubject<HomeViewObject>();

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
      inputHomeData.add(HomeViewObject(homeObject.data.stores,
          homeObject.data.services, homeObject.data.banners))
    },
    );
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  // Inputs
  @override
  Sink<dynamic> get inputHomeData => _dataStreamController.sink;

  // Outputs
  @override
  Stream<HomeViewObject> get outputHomeData => _dataStreamController.stream.map((homeData) => homeData);

}

mixin HomeViewModelInput {
  Sink get inputHomeData;
}

mixin HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  List<Store> stores;
  List<Service> services;
  List<BannerAd> banners;

  HomeViewObject(this.stores, this.services, this.banners);
}