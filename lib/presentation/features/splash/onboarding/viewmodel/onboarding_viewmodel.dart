import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{

  final StreamController _streamController = StreamController<SliderViewObject>();
  late List<SliderObject> _list ;
  int currentIndex = 0;

  void _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[currentIndex],_list.length,currentIndex));
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    // _streamController.add(_list);
    _postDataToView();

  }

  @override
  int goNext() {
    int index = ++currentIndex;
    if(index == _list.length) {
      index = 0;
    }
    return index;
  }

  @override
  int goPrevious() {
    int index = --currentIndex;
    if(index == -1) {
      index = _list.length -1;
    }

    return index;
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding functions

  List<SliderObject> _getSliderData() => [
    SliderObject(
        AppStrings.onBoardingTitle1.tr(),
        AppStrings.onBoardingSubTitle1.tr(),
        ImageAssets.onboardingLogo1
    ),
    SliderObject(
        AppStrings.onBoardingTitle2.tr(),
        AppStrings.onBoardingSubTitle2.tr(),
        ImageAssets.onboardingLogo2
    ),
    SliderObject(
        AppStrings.onBoardingTitle3.tr(),
        AppStrings.onBoardingSubTitle3.tr(),
        ImageAssets.onboardingLogo3
    ),
    SliderObject(
        AppStrings.onBoardingTitle4.tr(),
        AppStrings.onBoardingSubTitle4.tr(),
        ImageAssets.onboardingLogo4
    ),
  ];


}

mixin OnBoardingViewModelInputs{
  int goPrevious();
  int goNext();
  void onPageChanged(int index);

  // stream controller input

  Sink get inputSliderViewObject;

}

mixin OnBoardingViewModelOutputs{

  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject{
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}