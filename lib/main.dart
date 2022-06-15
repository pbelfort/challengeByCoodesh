import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma/app/theme/app_theme.dart';

import 'app/modules/splash/splash_binding.dart';
import 'app/modules/splash/splash_page.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH, //Rota inicial
        initialBinding: SplashBinding(), // dependencias iniciais
        home: const SplashPage(), // Page inicial
        theme: appThemeData, //Tema personalizado app
        defaultTransition: Transition.noTransition, // Transição de telas padrão
        getPages: AppPages.routes, // Seu array de navegação contendo as rotas
        locale: const Locale('pt', 'BR'), // Língua padrão
        // translationsKeys:
        //     AppTranslation.translations, // Suas chaves contendo as traduções<map>
      ),
    );
  }
}
