import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/app/app_shared_preferences.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/presentation/features/splash/onboarding/view/onboarding_page.dart';
import 'package:flutter_clean_architecture/presentation/features/splash/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _pageController = PageController();
  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();
  final AppSharedPreferences _sharedPreferences = instance<AppSharedPreferences>();

  _bind(){
    _sharedPreferences.setOnBoardingScreenViewed();
    _onBoardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _onBoardingViewModel.outputSliderViewObject,
      builder: (context,snapshot){
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject){
    if(sliderViewObject == null){
      return Container();
    }
    else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSizes.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        extendBody: true,
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numberOfSlides,
          onPageChanged: (index) {
            _onBoardingViewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnboardingPage(sliderObject: sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          // height: AppSizes.s110,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: ColorManager.primary),
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    super.dispose();
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject){

    return Container(
      color: ColorManager.primary,
      height: AppSizes.s60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
            child: GestureDetector(
              onTap: (){
                _pageController.animateToPage(
                    _onBoardingViewModel.goPrevious(),
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
                child: SizedBox(
                  height: AppSizes.s20,
                  width: AppSizes.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrowIc),
                ),
              ),
            ),
          ),
          Row(
            children: [
              for(int i = 0; i<sliderViewObject.numberOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPaddings.p8),
                  child: _getProperCircle(i,_onBoardingViewModel.currentIndex),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
            child: GestureDetector(
              onTap: (){
                _pageController.animateToPage(
                    _onBoardingViewModel.goNext(),
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
                child: SizedBox(
                  height: AppSizes.s20,
                  width: AppSizes.s20,
                  child: SvgPicture.asset(ImageAssets.rightArrowIc),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

  Widget _getProperCircle(int index,int currentIndex){
    if(index == currentIndex){
      return const Icon(Icons.circle,color: Colors.white,size: AppSizes.s20,);
    }else{
      return const Icon(Icons.circle_outlined,color: Colors.white,size: AppSizes.s20,);
    }
  }


}
