// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../app/cubit/app_cubit.dart' as _i356;
import '../internet_checker/cubit/network_checker.dart' as _i125;
import '../network/app_repository.dart' as _i820;
import '../network/firestore_service.dart' as _i977;
import '../res/base_snackbar_manager.dart' as _i425;
import '../screens/dashboard/cubit/dashboard_cubit.dart' as _i518;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.factory<_i977.FirestoreService>(() => _i977.FirestoreService());
  gh.factory<_i518.DashboardCubit>(() => _i518.DashboardCubit());
  gh.lazySingleton<_i425.SnackbarManager>(() => _i425.SnackbarManager());
  gh.lazySingleton<_i356.AppCubit>(() => _i356.AppCubit());
  gh.lazySingleton<_i820.AppRepository>(() => _i820.AppRepository());
  gh.lazySingleton<_i125.NetworkCheckerCubit>(
    () => _i125.NetworkCheckerCubit(),
  );
  return getIt;
}
