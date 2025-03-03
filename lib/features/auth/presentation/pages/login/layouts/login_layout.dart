import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:reqresz/config.dart';
import 'package:reqresz/core/assets/index.dart';
import 'package:reqresz/core/extension/spacing.dart';
import 'package:reqresz/core/extension/widget_extension.dart';
import 'package:reqresz/features/auth/presentation/blocs/login_bloc.dart';
import 'package:reqresz/widgets/button_main.dart';
import 'package:reqresz/widgets/text_field_common_auth.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  final GlobalKey<FormBuilderState> _formKey =
  GlobalKey<FormBuilderState>(debugLabel: 'GlobalFormKey #Login');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Stack(children: [
          FormBuilder(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpace(Sizes.s20),
                    Row(children: [
                      const HSpace(Sizes.s20),
                      Text(lblText.email,
                          style:
                          appCss.jakartaMedium14.textColor(appTheme.grey40))
                    ]),
                    const VSpace(Sizes.s8),
                    TextFieldCommonAuth(
                      name: "email",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: lblText.pleaseEnterEmail),
                      ]),
                      hintText: lblText.email,
                      keyboardType: TextInputType.emailAddress,
                    ).paddingSymmetric(horizontal: Insets.i20),
                    const VSpace(Sizes.s15),
                    Row(children: [
                      const HSpace(Sizes.s20),
                      Text(lblText.password,
                          style:
                          appCss.jakartaMedium14.textColor(appTheme.grey40))
                    ]),
                    const VSpace(Sizes.s8),
                    TextFieldCommonAuth(
                      name: 'password',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: lblText.pleaseEnterPassword),
                      ]),
                      suffixIcon: SvgPicture.asset(
                          state.isPasswordVisible
                              ? eSvgAssets.hide
                              : eSvgAssets.eye,
                          fit: BoxFit.scaleDown)
                          .inkWell(
                          onTap: () => context
                              .read<LoginBloc>()
                              .add(TogglePasswordVisibility())),
                      hintText: lblText.pleaseEnterPassword,
                      obscureText: !state.isPasswordVisible,
                    ).paddingSymmetric(horizontal: Insets.i20),
                    const VSpace(Sizes.s20),
                    Column(children: [
                      Text(lblText.forgotPassword,
                          style: appCss.jakartaMedium14
                              .textColor(appTheme.grey20))
                          .inkWell(
                          onTap: () => {})
                          .alignment(Alignment.bottomRight)
                          .paddingSymmetric(horizontal: Insets.i20),
                    ]),
                    const VSpace(Sizes.s20),
                    ButtonMain(
                      title: lblText.login,
                      color: appTheme.primary,
                      fontColor: appTheme.white,
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          final email = _formKey
                              .currentState?.fields['email']?.value as String;
                          final password = _formKey.currentState
                              ?.fields['password']?.value as String;
                          context
                              .read<LoginBloc>()
                              .add(LoginSubmitted(email, password));
                        }
                      },
                    ).paddingSymmetric(horizontal: Insets.i20),
                    const VSpace(Sizes.s20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: appCss.jakartaMedium14
                              .textColor(appTheme.black),
                        ),
                        Text(
                          " Register",
                          style: appCss.jakartaMedium14
                              .textColor(appTheme.primary),
                        ),
                      ],
                    )
                  ]).paddingSymmetric(vertical: Insets.i20))
              .decorated(
              color: appTheme.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 2,
                    color: appTheme.black.withOpacity(0.06))
              ],
              borderRadius: BorderRadius.circular(AppRadius.r10),
              border: Border.all(color: appTheme.stroke)),
        ]);
      },
    );
  }
}
