import 'package:stuffy_paradise/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
GetIt configureDependencies() => getIt.init();
