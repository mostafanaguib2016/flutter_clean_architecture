import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/app/app_shared_preferences.dart';
import 'package:flutter_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/network/app_api.dart';
import 'package:flutter_clean_architecture/data/network/dio_factory.dart';
import 'package:flutter_clean_architecture/data/network/network_info.dart';
import 'package:flutter_clean_architecture/data/repository/repository_impl.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/usecase/login_usecase.dart';
import 'package:flutter_clean_architecture/presentation/features/auth/login/viewmodel/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{
  // putting all generic dependency injection

  // shared preference instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // App Prefs
  instance.registerLazySingleton<AppSharedPreferences>(() => AppSharedPreferences(instance<SharedPreferences>()));

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker.I));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(),instance()));

}

initLoginModule() {
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewmodel>(() => LoginViewmodel(instance()));
  }

}