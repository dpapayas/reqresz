import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqresz/config.dart';
import 'package:reqresz/core/assets/index.dart';
import 'package:reqresz/core/extension/widget_extension.dart';
import 'package:reqresz/core/theme/app_css.dart';
import 'package:reqresz/features/auth/presentation/blocs/login_bloc.dart';
import 'package:reqresz/features/auth/presentation/pages/login/login_page.dart';
import 'package:reqresz/features/auth/presentation/pages/register/register_page.dart';
import 'package:reqresz/features/users/presentation/pages/user_list_pages.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(CheckUserSession());
  }

  void _navigateToPage(Widget page) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            _navigateToPage(UserListPage());
          } else if (state is LoginInitial) {
            _navigateToPage(LoginPage());
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Sizes.s100,
                height: Sizes.s100,
                child: Image.asset(eImageAssets.apple),
              ),
            ],
          ).alignment(Alignment.center),
        ),
      ),
    );
  }
}
