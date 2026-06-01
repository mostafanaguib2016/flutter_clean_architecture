abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs{
  // - Shared variables & function that will be through any view model in the project
  // - Base inputs & outputs


}

abstract class BaseViewModelInputs{
  void start(); // start viewmodel job


  void dispose(); //

}

mixin class BaseViewModelOutputs{


}