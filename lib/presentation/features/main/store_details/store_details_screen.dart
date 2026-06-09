import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:flutter_clean_architecture/presentation/features/main/store_details/viewmodel/store_details_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/font_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  final StoreDetailsViewModel _viewModel = instance<StoreDetailsViewModel>();

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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.storeDetails,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return Container(
              child:
              snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
                _viewModel.start();
              }) ??
                  Container(),
            );
          },
        )
    );
  }

  Widget _getContentWidget(){
    return Container(
      constraints: BoxConstraints.expand(),
      color: ColorManager.white,
      child: SingleChildScrollView(
        child: StreamBuilder<StoreDetails>(
            stream: _viewModel.outputStoreDetails,
            builder: (context,snapshot){
              return _getItem(snapshot.data);
            }
        ),
      ),
    );
  }

  Widget _getItem(StoreDetails? storeDetails){
    if(storeDetails != null){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.network(
                storeDetails.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              )),
          _getSection(AppStrings.details),
          _getInfoText(storeDetails.details),
          _getSection(AppStrings.services),
          _getInfoText(storeDetails.services),
          _getSection(AppStrings.about),
          _getInfoText(storeDetails.about)
        ],
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

  Widget _getInfoText(String info) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.s12),
      child: Text(info, style: Theme.of(context).textTheme.bodySmall),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }


}
