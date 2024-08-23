import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../network/ApiRepository.dart';
import '../network/apiService.dart';
import '../network/network_dio_client.dart';
import '../network/network_module.dart';
import '../persistance/shared_preference_helper.dart';
import '../view_model/account_vm.dart';
import 'navigation_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  //Navigation
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());

  //Route Observer
  getIt.registerLazySingleton<RouteObserver<ModalRoute>>(
      () => RouteObserver<ModalRoute>());

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  // singletons
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(NetworkClientDio(getIt<Dio>()));

  // api's:
  getIt.registerSingleton(ApiService(getIt<NetworkClientDio>()));

  // repository
  getIt.registerSingleton(Repository(
    getIt<ApiService>(),
    getIt<SharedPreferenceHelper>(),
  ));

  // stores
  getIt.registerSingleton(AccountViewModel(getIt<Repository>()));
  // getIt.registerSingleton(PerferencesViewModel(getIt<Repository>()));
  // getIt.registerSingleton(MatchesViewModel(getIt<Repository>()));
  // getIt.registerSingleton(ChatViewModel(getIt<Repository>()));
  /*getIt.registerSingleton(AccountViewModel(getIt<Repository>()));
  getIt.registerSingleton(CreateViewModel(getIt<Repository>()));
  getIt.registerSingleton(HomeViewModel(getIt<Repository>()));
  getIt.registerSingleton(LoginProvider());*/
}
