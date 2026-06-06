import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:flutter_clean_architecture/presentation/features/auth/forget_password/viewmodel/forget_password_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
  TextEditingController();

  final ForgetPasswordViewModel _viewModel =
  instance<ForgetPasswordViewModel>();

  bind() {
    _viewModel.start();
    _emailTextEditingController.addListener(
            () => _viewModel.setEmail(_emailTextEditingController.text));
  }

  @override
  void initState() {
    bind();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.forgotPassword();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.only(top: AppPaddings.p100),
      color: ColorManager.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Image(image: AssetImage(ImageAssets.splashLogo)),
              const SizedBox(
                height: AppSizes.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPaddings.p28, right: AppPaddings.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputIsEmailValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                          hintText: AppStrings.emailHint,
                          labelText: AppStrings.emailHint,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStrings.invalidEmail),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSizes.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPaddings.p28, right: AppPaddings.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputIsAllInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSizes.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () => _viewModel.forgotPassword()
                              : null,
                          child: Text(AppStrings.resetPassword)),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
