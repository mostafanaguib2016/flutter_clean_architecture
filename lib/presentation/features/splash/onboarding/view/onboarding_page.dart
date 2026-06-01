import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  final SliderObject sliderObject;

  const OnboardingPage({super.key,required this.sliderObject});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSizes.s80,),
        Padding(
          padding: const EdgeInsets.all(AppPaddings.p8),
          child: Text(
            sliderObject.title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPaddings.p8),
          child: Text(
            sliderObject.subTitle,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppSizes.s60,),
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}
