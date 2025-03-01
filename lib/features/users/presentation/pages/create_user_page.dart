import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqresz/features/users/presentation/blocs/create_user_bloc.dart';
import 'package:reqresz/features/users/presentation/blocs/create_user_event.dart';
import 'package:reqresz/features/users/presentation/blocs/create_user_state.dart';

class CreateUserPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create User")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: firstNameController, decoration: InputDecoration(labelText: "First Name")),
            TextField(controller: lastNameController, decoration: InputDecoration(labelText: "Last Name")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            SizedBox(height: 16),
            BlocConsumer<CreateUserBloc, CreateUserState>(
              listener: (context, state) {
                if (state is CreateUserFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                if (state is CreateUserLoading) return CircularProgressIndicator();
                return ElevatedButton(
                  onPressed: () {
                    context.read<CreateUserBloc>().add(
                      CreateUserRequested(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                      ),
                    );
                  },
                  child: Text("Create"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
