import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reqresz/config.dart';
import 'package:reqresz/core/assets/index.dart';
import 'package:reqresz/features/auth/presentation/blocs/login_bloc.dart';
import 'package:reqresz/features/auth/presentation/pages/login/layouts/login_layout.dart';
import 'package:reqresz/features/users/presentation/pages/user_list_pages.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserListPage()),
            );
          } else if (state is LoginFailure) {
            Fluttertoast.showToast(msg: state.message);
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .40,
                    width: MediaQuery.of(context).size.width,
                    color: appTheme.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(eImageAssets.appleWhite, height: Sizes.s60),
                        const SizedBox(height: 16),
                        Text(
                          "Sign in to Account",
                          style: appCss.jakartaBold18.textColor(appTheme.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Enter your Email & Password",
                          style:
                              appCss.jakartaRegular14.textColor(appTheme.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .60,
                    color: Colors.white,
                  )
                ],
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .30,
                  right: 20.0,
                  left: 20.0,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const LoginLayout(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
