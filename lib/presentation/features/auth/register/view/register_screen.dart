import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_clean_architecture/app/app_shared_preferences.dart';
import 'package:flutter_clean_architecture/app/constants.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:flutter_clean_architecture/presentation/features/auth/register/viewmodel/register_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final ImagePicker _imagePicker = instance<ImagePicker>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AppSharedPreferences _sharedPreferences = instance<AppSharedPreferences>();

  _bind(){
    _viewModel.start();

    _userNameController.addListener((){
      _viewModel.setUserName(_userNameController.text.toString());
    });
    _emailController.addListener((){
      _viewModel.setEmail(_emailController.text.toString());
    });
    _mobileNumberController.addListener((){
      _viewModel.setMobileNumber(_mobileNumberController.text.toString());
    });
    _passwordController.addListener((){
      _viewModel.setPassword(_passwordController.text.toString());
    });

    _viewModel.isUserRegisteredSuccessfullyStreamController.stream.listen((isRegistered){
      if(isRegistered){
        SchedulerBinding.instance.addPostFrameCallback((_){
          _sharedPreferences.setUserLoggedIn();
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
        });
      }
    });

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
      appBar: AppBar(
        elevation: AppSizes.s0,
        backgroundColor: ColorManager.white,
        iconTheme: IconThemeData(
          color: ColorManager.primary,
        ),
      ),
      body: StreamBuilder(
        stream: _viewModel.outputState,
        builder: (context,snapshot){
          return snapshot.data?.getScreenWidget(context, _getContentWidget(), (){
            _viewModel.register();
          }) ?? _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget(){
    return Container(
      // padding: EdgeInsets.only(top: AppPaddings.p100),
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
                child: StreamBuilder<String?>(
                    stream: _viewModel.outErrorUserName,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameController,
                        decoration: InputDecoration(
                            hintText: AppStrings.username,
                            labelText: AppStrings.username,
                            errorText: snapshot.data),
                      );
                    }),
              ),
              const SizedBox(
                height: AppSizes.s18,
              ),

              Center(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: AppPaddings.p28),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: CountryCodePicker(
                            initialSelection: 'EG',
                            favorite: ['+20','EG','+966'],
                            showCountryOnly: true,
                            showOnlyCountryWhenClosed: true,
                            hideMainText: true,
                            alignLeft: false,
                            padding: EdgeInsetsGeometry.zero,
                            flagWidth: AppSizes.s60,
                            onChanged: (countryCode){
                              debugPrint("CODE ==> $countryCode ${countryCode.code}");
                              _viewModel.setCountryCode(countryCode.toString() ?? Constants.empty);
                            },
                          )
                      ),
                      Expanded(
                        flex: 9,
                        child: StreamBuilder<String?>(
                            stream: _viewModel.outErrorMobileNumber,
                            builder: (context, snapshot) {
                              return TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _mobileNumberController,
                                decoration: InputDecoration(
                                    hintText: AppStrings.mobileNumber,
                                    labelText: AppStrings.mobileNumber,
                                    errorText: snapshot.data),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSizes.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPaddings.p28, right: AppPaddings.p28),
                child: StreamBuilder<String?>(
                    stream: _viewModel.outErrorEmail,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: AppStrings.emailHint,
                            labelText: AppStrings.emailHint,
                            errorText: snapshot.data),
                      );
                    }),
              ),
              const SizedBox(
                height: AppSizes.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPaddings.p28, right: AppPaddings.p28),
                child: StreamBuilder<String?>(
                    stream: _viewModel.outErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: AppStrings.password,
                            labelText: AppStrings.password,
                            errorText: snapshot.data),
                      );
                    }),
              ),
              const SizedBox(
                height: AppSizes.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPaddings.p28, right: AppPaddings.p28),
                child: Container(
                  height: AppSizes.s40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.s8),
                    border: Border.all(
                      color: ColorManager.lightGrey,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      _showPicker(context);
                    },
                    child: _getMediaWidget(),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSizes.s40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPaddings.p28, right: AppPaddings.p28),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outAreAllInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSizes.s40,
                        child: ElevatedButton(
                          onPressed: (snapshot.data ?? false) ? (){
                            _viewModel.register();
                          } : null,
                          child: const Text(AppStrings.register),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPaddings.p8,
                    left: AppPaddings.p24,
                    right: AppPaddings.p24),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppStrings.loginText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.primary)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMediaWidget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(AppStrings.profilePicture),),
          Flexible(
            child: StreamBuilder<File>(
              stream: _viewModel.outProfilePicture,
              builder: (context,snapshot){
                return _imagePickedByUser(snapshot.data);
              },
            ),
          ),
          Flexible(child: SvgPicture.asset(ImageAssets.photoCameraIc)),
        ],
      ),
    );
  }

  Widget _imagePickedByUser(File? image){
    if(image != null){
      return Image.file(image);
    }else{
      return SizedBox();
    }
  }

  _showPicker(BuildContext context){
    showModalBottomSheet(
        context: context,
      builder: (BuildContext context){
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  trailing: Icon(Icons.arrow_forward),
                  leading: Icon(Icons.camera),
                  title: Text(AppStrings.photoGallery),
                  onTap: (){
                    _imageFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  trailing: Icon(Icons.arrow_forward),
                  leading: Icon(Icons.camera_outlined),
                  title: Text(AppStrings.photoCamera),
                  onTap: (){
                    _imageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
      },
    );
  }

  _imageFromGallery() async{
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    _viewModel.setProfilePicture(File(image?.path ?? ""));
  }

  _imageFromCamera() async{
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    _viewModel.setProfilePicture(File(image?.path ?? ""));
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
