import 'dart:ffi';

import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/domain/usecase/store_details_usecase.dart';
import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailsViewModel extends BaseViewModel with StoreDetailsViewModelInputs,StoreDetailsViewModelOutputs{
  final _storeDetailsStreamController = BehaviorSubject<StoreDetails>();

  final StoreDetailsUseCase _storeDetailsUseCase;
  StoreDetailsViewModel(this._storeDetailsUseCase);

  @override
  void start() {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _storeDetailsUseCase.execute(Void)).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
          (storeDetails) async {
        inputState.add(ContentState());
        inputStoreDetails.add(storeDetails);
      },
    );
  }

  @override
  void dispose() {
    _storeDetailsStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputStoreDetails => _storeDetailsStreamController.sink;

  @override
  Stream<StoreDetails> get outputStoreDetails => _storeDetailsStreamController.stream.map((storeDetails) => storeDetails);

}

mixin StoreDetailsViewModelInputs{
  Sink get inputStoreDetails;
}

mixin StoreDetailsViewModelOutputs{
  Stream<StoreDetails> get outputStoreDetails;
}