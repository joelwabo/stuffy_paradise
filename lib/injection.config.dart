// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:stuffy_paradise/database/sql_database_service.dart' as _i49;
import 'package:stuffy_paradise/provider/home_screen_provider.dart' as _i55;
import 'package:stuffy_paradise/provider/user_session_provider.dart' as _i455;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i49.SqlDatabaseService>(() => _i49.SqlDatabaseService());
    gh.lazySingleton<_i55.HomeScreenProvider>(() => _i55.HomeScreenProvider());
    gh.lazySingleton<_i455.UserSessionProvider>(
        () => _i455.UserSessionProvider());
    return this;
  }
}
