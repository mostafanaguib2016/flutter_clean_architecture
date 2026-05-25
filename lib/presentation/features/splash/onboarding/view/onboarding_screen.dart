import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/presentation/features/splash/onboarding/view/onboarding_page.dart';
import 'package:flutter_clean_architecture/presentation/features/splash/onboarding/view/slider_object.dart';
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

  late List<SliderObject> _list = _getSliderData();
  PageController _pageController = PageController();
  int currentPage = 0;

  List<SliderObject> _getSliderData() => [
    SliderObject(
        AppStrings.onBoardingTitle1,
        AppStrings.onBoardingSubTitle1,
        ImageAssets.onboardingLogo1
    ),
    SliderObject(
        AppStrings.onBoardingTitle2,
        AppStrings.onBoardingSubTitle2,
        ImageAssets.onboardingLogo2
    ),
    SliderObject(
        AppStrings.onBoardingTitle3,
        AppStrings.onBoardingSubTitle3,
        ImageAssets.onboardingLogo3
    ),
    SliderObject(
        AppStrings.onBoardingTitle4,
        AppStrings.onBoardingSubTitle4,
        ImageAssets.onboardingLogo4
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
        itemCount: _list.length,
        onPageChanged: (index){
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context,index){
          return OnboardingPage(sliderObject: _list[index]);
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
                onPressed: (){
                  Navigator.pushNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorManager.primary),
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget(){

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
                    _getPreviousPage(),
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
              for(int i = 0; i<_list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPaddings.p8),
                  child: _getProperCircle(i),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
            child: GestureDetector(
              onTap: (){
                _pageController.animateToPage(
                    _getNextPage(),
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

  int _getPreviousPage(){
    int index = --currentPage;
    if(index == -1) {
      index = _list.length -1;
    }

    return index;
  }

  _getNextPage(){
    int index = ++currentPage;
    if(index == _list.length) {
      index = 0;
    }
    return index;
  }

  Widget _getProperCircle(int index){
    if(index == currentPage){
      return const Icon(Icons.circle,color: Colors.white,size: AppSizes.s20,);
    }else{
      return const Icon(Icons.circle_outlined,color: Colors.white,size: AppSizes.s20,);
    }
  }


}
