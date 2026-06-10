import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:flutter_clean_architecture/presentation/features/main/pages/home/viewmodel/home_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/font_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final  HomeViewModel _viewModel = instance<HomeViewModel>();

  _bind(){
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context,snapshot){
            return snapshot.data?.getScreenWidget(
                context,
                _getHomeContent(),
                    (){
                  _viewModel.start();
                }) ?? _getHomeContent();
          },
        ),
      ),
    );
  }

  Widget _getHomeContent(){
    return StreamBuilder<HomeViewObject>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _getBannerWidget(snapshot.data?.banners),
              _getSection(AppStrings.services.tr()),
              _getServicesWidget(snapshot.data?.services),
              _getSection(AppStrings.stores.tr()),
              _getStoresWidget(snapshot.data?.stores),
            ],
          );
        });
  }

  Widget _getBannerWidget(List<BannerAd>? banners){
    if(banners != null){
      return CarouselSlider(
        items: banners.map(
                (banner) =>
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: AppSizes.s1_5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(AppSizes.s12),
                        side: BorderSide(
                            color: ColorManager.primary,
                            width: AppSizes.s1
                        )
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(AppSizes.s12),
                      child: Image.network(
                        banner.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
        ).toList(),
        options: CarouselOptions(
            height: AppSizes.s190,
            autoPlay: true,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,aspectRatio: 1.0
        ),
      );
    }else{
      return SizedBox();
    }
  }

  Widget _getServicesWidget(List<Service>? services){
    if(services != null){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p12),
        child: Container(
          height: AppSizes.s140,
          margin: EdgeInsets.symmetric(vertical: AppMargins.m12),
          child: ListView.builder(
              itemCount: services.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context,index){
                return Card(
                  elevation: AppSizes.s4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(AppSizes.s12),
                      side: BorderSide(
                          color: ColorManager.transparent,
                          width: AppSizes.s1
                      )
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(AppSizes.s12),
                        child: Image.network(
                          services[index].image,
                          fit: BoxFit.cover,
                          width: AppSizes.s140,
                          height: AppSizes.s100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: AppPaddings.p8),
                        child: Align(
                          alignment: AlignmentGeometry.center,
                          child: Text(
                            services[index].title,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: ColorManager.grey2),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      );
    }else{
      return SizedBox();
    }
  }

  Widget _getStoresWidget(List<Store>? stores){
    if(stores != null){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p12),
        child: Flex(
          direction: Axis.vertical,
          children: [
            GridView.count(
              crossAxisCount: AppSizes.s2,
              crossAxisSpacing: AppSizes.s8,
              mainAxisSpacing: AppSizes.s8,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children:
                List.generate(
                    stores.length, (index){
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.storeDetailsRoute);
                        },
                        child: Card(
                          elevation: AppSizes.s12,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(AppSizes.s12),
                            child: Image.network(
                              stores[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                }),
            )
          ],
        ),
      );
    }else{
      return SizedBox();
    }
  }

  Widget _getSection(String title){
    return Padding(
      padding: EdgeInsetsGeometry.only(
          left: AppPaddings.p12,right: AppPaddings.p12,
          top: AppPaddings.p12,bottom: AppPaddings.p2
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: FontSize.s14),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
