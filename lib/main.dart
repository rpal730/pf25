import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart'; // safe to keep; won't be used on web
import 'package:flutter_web_portfolio_2025/app/view/app.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.dart';
import 'package:flutter_web_plugins/url_strategy.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCbVT71vJG-vA6knhhPcZky32Hdb1uoLnw",
      authDomain: "pf25-1c9e3.firebaseapp.com",
      projectId: "pf25-1c9e3",
      storageBucket: "pf25-1c9e3.firebasestorage.app",
      messagingSenderId: "1020532227067",
      appId: "1:1020532227067:web:62f201a0ee7adbb5a9a95e",
      measurementId: "G-274BZ24VVT",
    ),
  );

  final storage =
      kIsWeb
          ? await HydratedStorage.build(
            storageDirectory: HydratedStorageDirectory.web,
          )
          : await HydratedStorage.build(
            storageDirectory: HydratedStorageDirectory(
              (await getApplicationDocumentsDirectory()).path,
            ),
          );

  HydratedBloc.storage = storage;

  configureInjection();
   usePathUrlStrategy();

  // Check if a redirect path exists (from 404.html)
  final redirect = window.sessionStorage['redirect'];
  if (redirect != null && redirect.isNotEmpty) {
    window.sessionStorage.remove('redirect');
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp(initialRoute: redirect));
  } else {
    runApp(MyApp());
  }
}
