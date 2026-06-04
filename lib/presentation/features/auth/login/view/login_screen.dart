import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:flutter_clean_architecture/presentation/features/auth/login/viewmodel/login_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewmodel _loginViewmodel = instance<LoginViewmodel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  _bind(){
    _loginViewmodel.start();
    _userNameController.addListener(() => _loginViewmodel.setUserName(_userNameController.text));
    _passwordController.addListener(() => _loginViewmodel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
          stream: _loginViewmodel.outputState,
        builder: (context,snapShot){
            return snapShot.data?.getScreenWidget(context, _getContentWidget(), (){
              _loginViewmodel.login();
            }) ?? _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget(){
    return Container(
        padding: EdgeInsets.only(top: AppPaddings.p100),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                    child: Image(image: AssetImage(ImageAssets.splashLogo))),
                SizedBox(
                  height: AppSizes.s28,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPaddings.p28, right: AppPaddings.p28),
                  child: StreamBuilder<bool>(
                      stream: _loginViewmodel.outIsUserNameValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                          decoration: InputDecoration(
                              hintText: AppStrings.username,
                              labelText: AppStrings.username,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.usernameError),
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSizes.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPaddings.p28, right: AppPaddings.p28),
                  child: StreamBuilder<bool>(
                      stream: _loginViewmodel.outIsPasswordValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              hintText: AppStrings.password,
                              labelText: AppStrings.password,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.passwordError),
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSizes.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPaddings.p28, right: AppPaddings.p28),
                  child: StreamBuilder<bool>(
                      stream: _loginViewmodel.outAreAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: AppSizes.s40,
                          child: ElevatedButton(
                            onPressed: (snapshot.data ?? false) ? (){
                              _loginViewmodel.login();
                            } : null,
                            child: const Text(AppStrings.login),
                          ),
                        );
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: AppPaddings.p8,
                        left: AppPaddings.p24,
                        right: AppPaddings.p24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.forgetPasswordRoute);
                          },
                          child: Text(AppStrings.forgetPassword,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.primary)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.registerRoute);
                          },
                          child: Text(AppStrings.registerText,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.primary)),
                        )
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  @override
  void dispose() {
    _loginViewmodel.dispose();
    super.dispose();
  }
}
