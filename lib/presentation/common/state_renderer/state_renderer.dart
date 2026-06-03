import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/font_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/styles_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';

enum StateRendererType {
  // Popup states
  popupLoadingState,
  popupErrorState,

  // FullScreen states
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // general
  contentState,

}

class StateRenderer extends StatelessWidget {

  StateRenderer({
    required this.stateRendererType,
    this.message = AppStrings.loading,
    this.title = "",
    required this.retryActionFunction,
    super.key
  });
  StateRendererType stateRendererType;
  String message;
  String title;
  // Failure? failure;
  Function retryActionFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getStateWidget(context),
    );
  }

  Widget _getStateWidget(BuildContext context){
    switch(stateRendererType){

      case StateRendererType.popupLoadingState:
        return _getPopupDialog(
          context,
          [
            _getAnimatedImage(),
          ]
        );
      case StateRendererType.popupErrorState:
        return _getPopupDialog(
            context,
            [
              _getAnimatedImage(),
              _getMessage(message),
              _getRetryButton(AppStrings.ok,context)
            ]
        );
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          _getAnimatedImage(),
          _getMessage(message)
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgain,context)
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn(
          [_getAnimatedImage(),_getMessage(message)]
        );
      case StateRendererType.contentState:
        return Container();
      }
  }

  Widget _getPopupDialog(BuildContext context,List<Widget> children){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.s14),
      ),
      elevation: AppSizes.s1_5,
      backgroundColor: ColorManager.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSizes.s14),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
            ),
          ],
        ),
        child: _getDialogContent(context,children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context,List<Widget> children){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget _getItemsColumn(List<Widget> children){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(){
    return SizedBox(
      height: AppSizes.s100,
      width: AppSizes.s100,
      child: Container(),
    );
  }

  Widget _getMessage(String message){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.p8),
        child: Text(
          message,
          style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s18),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle,BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.p18),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){
              if(stateRendererType == StateRendererType.fullScreenErrorState){
                retryActionFunction.call();
              }else{
                Navigator.of(context).pop();
              }
            },
            child: Text(buttonTitle),
          ),
        ),
      ),
    );
  }

}
