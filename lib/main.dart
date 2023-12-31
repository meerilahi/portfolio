import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/routes/route_config.dart';
import 'package:portfolio/core/theme/theme_data.dart';
import 'package:portfolio/data/repo/repository.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return Provider(
      create: (_) => FirebaseRepository(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        theme: themeData,
        routerConfig: appRouter.router,
      ),
    );
  }
}
