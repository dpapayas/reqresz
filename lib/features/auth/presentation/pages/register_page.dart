import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqresz/core/di/injection.dart';
import 'package:reqresz/features/auth/presentation/blocs/register_bloc.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: BlocProvider(
        create: (context) => sl<RegisterBloc>(),
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Registration Successful! Token: ${state.token}")),
              );
            } else if (state is RegisterError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  state is RegisterLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      context.read<RegisterBloc>().register(email, password);
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
