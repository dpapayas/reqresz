import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqresz/features/users/presentation/blocs/user_bloc.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(LoadUsers()); // Auto load users on page load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];

                  return Dismissible(
                    key: Key(user.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete User'),
                          content: const Text('Are you sure you want to delete this user?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Delete', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      );
                    },
                    onDismissed: (direction) {
                      context.read<UserBloc>().add(DeleteUser(id: user.id));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${user.firstName} deleted')),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),
                      onLongPress: () {
                        _showUpdateDialog(context, user);
                      },
                    ),
                  );
                },
              );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No users available'));
        },
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, user) {
    final firstNameController = TextEditingController(text: user.firstName);
    final lastNameController = TextEditingController(text: user.lastName);
    final emailController = TextEditingController(text: user.email);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: "First Name"),
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: "Last Name"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<UserBloc>().add(UpdateUser(
                  userId: user.id.toString(),
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                ));
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
