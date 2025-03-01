import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqresz/core/di/injection.dart' as di;
import 'package:reqresz/features/auth/presentation/pages/login_page.dart';
import 'package:reqresz/features/auth/presentation/blocs/login_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init(); // 🔹 Inisialisasi Dependency Injection sebelum runApp()
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<LoginBloc>()), // Inject LoginBloc
      ],
      child: MaterialApp(
        title: 'Reqresz App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage(), // Halaman pertama saat aplikasi dibuka
      ),
    );
  }
}
