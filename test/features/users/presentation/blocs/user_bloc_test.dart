import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reqresz/core/error/failure.dart';
import 'package:reqresz/core/usecases/usecase.dart';
import 'package:reqresz/features/users/domain/entities/user.dart';
import 'package:reqresz/features/users/domain/usecases/get_users_usecase.dart';
import 'package:reqresz/features/users/domain/usecases/update_user_usecase.dart';
import 'package:reqresz/features/users/domain/usecases/delete_user_usecase.dart';
import 'package:reqresz/features/users/presentation/blocs/user_bloc.dart';

class MockGetUsersUseCase extends Mock implements GetUsersUseCase {}
class MockUpdateUserUseCase extends Mock implements UpdateUserUseCase {}
class MockDeleteUserUseCase extends Mock implements DeleteUserUseCase {}

class FakeUpdateUserParams extends Fake implements UpdateUserParams {}
class FakeDeleteUserParams extends Fake implements DeleteUserParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(NoParams());
  });

  late MockGetUsersUseCase mockGetUsersUseCase;
  late MockUpdateUserUseCase mockUpdateUserUseCase;
  late MockDeleteUserUseCase mockDeleteUserUseCase;
  late UserBloc userBloc;

  setUpAll(() {
    registerFallbackValue(FakeUpdateUserParams());
    registerFallbackValue(FakeDeleteUserParams());
  });

  setUp(() {
    mockGetUsersUseCase = MockGetUsersUseCase();
    mockUpdateUserUseCase = MockUpdateUserUseCase();
    mockDeleteUserUseCase = MockDeleteUserUseCase();

    userBloc = UserBloc(
      getUsersUseCase: mockGetUsersUseCase,
      updateUserUseCase: mockUpdateUserUseCase,
      deleteUserUseCase: mockDeleteUserUseCase,
    );
  });

  tearDown(() {
    userBloc.close();
  });

  final testUser = User(
    id: '1',
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    avatar: 'https://example.com/avatar.jpg',
  );

  final updatedUser = User(
    id: '1',
    firstName: 'Jane',
    lastName: 'Doe',
    email: 'jane.doe@example.com',
    avatar: 'https://example.com/avatar.jpg',
  );

  final userList = [testUser];

  group('Load Users', () {
    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserLoaded] when LoadUsers is successful',
      build: () {
        when(() => mockGetUsersUseCase(any()))
            .thenAnswer((_) async => Right(userList));
        return userBloc;
      },
      act: (bloc) => bloc.add(LoadUsers()),
      expect: () => [UserLoading(), UserLoaded(userList)],
      verify: (_) {
        verify(() => mockGetUsersUseCase(NoParams())).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserError] when LoadUsers fails',
      build: () {
        when(() => mockGetUsersUseCase(any()))
            .thenAnswer((_) async => Left(ServerFailure(message: 'Server Error')));
        return userBloc;
      },
      act: (bloc) => bloc.add(LoadUsers()),
      expect: () => [UserLoading(), UserError('Server Error')],
    );
  });

  group('Update User', () {
    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserLoaded] with updated user when update succeeds',
      build: () {
        when(() => mockUpdateUserUseCase(any()))
            .thenAnswer((_) async => Right(updatedUser));
        return userBloc;
      },
      seed: () => UserLoaded(userList),
      act: (bloc) => bloc.add(UpdateUser(
        userId: '1',
        firstName: 'Jane',
        lastName: 'Doe',
        email: 'jane.doe@example.com',
      )),
      expect: () => [
        UserLoading(),
        UserLoaded([updatedUser]),
      ],
      verify: (_) {
        verify(() => mockUpdateUserUseCase(any())).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserError] when update fails',
      build: () {
        when(() => mockUpdateUserUseCase(any()))
            .thenAnswer((_) async => Left(ServerFailure(message: 'Update Failed')));
        return userBloc;
      },
      seed: () => UserLoaded(userList),
      act: (bloc) => bloc.add(UpdateUser(
        userId: '1',
        firstName: 'Jane',
        lastName: 'Doe',
        email: 'jane.doe@example.com',
      )),
      expect: () => [
        UserLoading(),
        UserError('Update Failed'),
      ],
    );
  });

  group('Delete User', () {
    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserLoaded] without the deleted user when delete succeeds',
      build: () {
        when(() => mockDeleteUserUseCase(any()))
            .thenAnswer((_) async => const Right(null));
        return userBloc;
      },
      seed: () => UserLoaded(userList),
      act: (bloc) => bloc.add(DeleteUser(id: '1')),
      expect: () => [
        UserLoading(),
        UserLoaded([]),
      ],
      verify: (_) {
        verify(() => mockDeleteUserUseCase(any())).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserError] when delete fails',
      build: () {
        when(() => mockDeleteUserUseCase(any()))
            .thenAnswer((_) async => Left(ServerFailure(message: 'Delete Failed')));
        return userBloc;
      },
      seed: () => UserLoaded(userList),
      act: (bloc) => bloc.add(DeleteUser(id: '1')),
      expect: () => [
        UserLoading(),
        UserError('Delete Failed'),
      ],
    );
  });
}
