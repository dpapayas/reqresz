import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqresz/core/di/injection.dart' as di;
import 'package:reqresz/features/auth/presentation/blocs/register_bloc.dart';
import 'package:reqresz/features/auth/presentation/blocs/login_bloc.dart';
import 'package:reqresz/features/auth/presentation/pages/splash/splash_screen_page.dart';
import 'package:reqresz/features/users/presentation/blocs/user_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => di.sl<LoginBloc>()..add(CheckUserSession())), // Inject LoginBloc
            BlocProvider(create: (_) => di.sl<RegisterBloc>()), // Inject LoginBloc
            BlocProvider(create: (_) => di.sl<UserBloc>()), // Inject UserBloc
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Reqresz App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreenPage(),
          ),
        );
      },
    );
  }
}