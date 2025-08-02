import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
GetIt configureInjection() => $initGetIt(getIt);
