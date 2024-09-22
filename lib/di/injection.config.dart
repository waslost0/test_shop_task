// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:test_shop_task/core/api/base_api.dart' as _i60;
import 'package:test_shop_task/core/api/private_api.dart' as _i423;
import 'package:test_shop_task/core/logic/key_value_storage.dart' as _i788;
import 'package:test_shop_task/di/injection.dart' as _i794;
import 'package:test_shop_task/features/auth/data/datasources/local/auth_local_data_source.dart'
    as _i12;
import 'package:test_shop_task/features/auth/data/datasources/remote/auth_remote_data_source.dart'
    as _i839;
import 'package:test_shop_task/features/auth/domain/repositories/auth_repository.dart'
    as _i405;
import 'package:test_shop_task/features/auth/domain/usecases/login_by_phone_code.dart'
    as _i801;
import 'package:test_shop_task/features/user/data/datasources/remote/user_remote_data_source.dart'
    as _i406;
import 'package:test_shop_task/features/user/domain/repositories/user_repository.dart'
    as _i563;
import 'package:test_shop_task/features/user/domain/usecases/load_profile.dart'
    as _i107;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i60.BaseApi>(() => _i60.BaseApi());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i788.LocalStorageService>(
        () => _i788.LocalStorageService(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i839.AuthRemoteDataSource>(
        () => _i839.AuthRemoteDataSourceImpl(gh<_i60.BaseApi>()));
    gh.lazySingleton<_i12.AuthLocalDataSource>(
        () => _i12.AuthLocalDataSourceImpl(gh<_i788.LocalStorageService>()));
    gh.lazySingleton<_i405.AuthRepository>(() => _i405.AuthRepositoryImpl(
          gh<_i839.AuthRemoteDataSource>(),
          gh<_i12.AuthLocalDataSource>(),
        ));
    gh.factory<_i423.PrivateApi>(
        () => _i423.PrivateApi(gh<_i405.AuthRepository>()));
    gh.factory<_i801.LoginByPhoneCodeUseCase>(
        () => _i801.LoginByPhoneCodeUseCase(gh<_i405.AuthRepository>()));
    gh.lazySingleton<_i406.UserRemoteDataSource>(
        () => _i406.UserRemoteDataSourceImpl(gh<_i423.PrivateApi>()));
    gh.lazySingleton<_i563.UserRepository>(
        () => _i563.UserRepositoryImpl(gh<_i406.UserRemoteDataSource>()));
    gh.factory<_i107.LoadProfileUseCase>(
        () => _i107.LoadProfileUseCase(gh<_i563.UserRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i794.RegisterModule {}
