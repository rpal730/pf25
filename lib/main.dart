import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart'; // safe to keep; won't be used on web
import 'package:flutter_web_portfolio_2025/app/view/app.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage =
      kIsWeb
          ? await HydratedStorage.build(storageDirectory: HydratedStorageDirectory.web)
          : await HydratedStorage.build(storageDirectory: HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path));

  HydratedBloc.storage = storage;

  configureInjection();

  runApp(MyApp());
}
