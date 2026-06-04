import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/constants.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';

abstract class FlowState {

  StateRendererType getStateRendererType();
  String getMessage();

}

class LoadingState extends FlowState{
  StateRendererType stateRendererType;
  String? message;


  LoadingState({
    required this.stateRendererType,
    this.message = AppStrings.loading,
  });

  @override
  String getMessage() => message ?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

}

class ErrorState extends FlowState{
  StateRendererType stateRendererType;
  String message;


  ErrorState(
      this.stateRendererType,
      this.message,
      );

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

}

class ContentState extends FlowState{

  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;

}

class EmptyState extends FlowState{

  String message;
  EmptyState(this.message);

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.fullScreenEmptyState;

}

extension FlowStateExtension on FlowState{
  Widget getScreenWidget(BuildContext context,Widget contentScreenWidget,Function retryActionFunction){
    switch(runtimeType){
      case LoadingState _:{
        dismissDialog(context);
        if(getStateRendererType() == StateRendererType.popupLoadingState){
          showPopup(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        }else{
          return StateRenderer(stateRendererType: getStateRendererType(),message: getMessage(),retryActionFunction: retryActionFunction,);
        }
      }
      case ErrorState _:{
        dismissDialog(context);
        if(getStateRendererType() == StateRendererType.popupLoadingState){
          showPopup(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        }else{
          return StateRenderer(stateRendererType: getStateRendererType(),message: getMessage(),retryActionFunction: retryActionFunction,);
        }
      }
      case EmptyState _:{
        return StateRenderer(stateRendererType: getStateRendererType(), retryActionFunction: (){},message: getMessage(),);
      }
      case ContentState _:{
        dismissDialog(context);
        return contentScreenWidget;
      }
      default:{
        dismissDialog(context);
        return contentScreenWidget;
      }
    }
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context){
    if(_isCurrentDialogShowing(context)){
      Navigator.of(context,rootNavigator: true).pop(true);
    }
  }

  showPopup(BuildContext context,StateRendererType type,String message){
    WidgetsBinding.instance.addPostFrameCallback((_)=>
        showDialog(context: context, builder: (BuildContext context) =>
            StateRenderer(stateRendererType: type, retryActionFunction: (){},message: message,)
        )
    );
  }
}