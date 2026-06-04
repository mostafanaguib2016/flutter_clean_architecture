import 'dart:async';

import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs{
  // - Shared variables & function that will be through any view model in the project
  // - Base inputs & outputs
  final StreamController _inputStreamController = StreamController<FlowState>.broadcast();

  @override
  Sink<dynamic> get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs{
  void start(); // start viewmodel job


  void dispose(); //

  Sink get inputState;

}

mixin BaseViewModelOutputs{
  Stream<FlowState> get outputState;
}