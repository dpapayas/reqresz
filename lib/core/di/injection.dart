import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:reqresz/core/network/api_client.dart';
import 'package:reqresz/core/network/network_info.dart';
import 'package:reqresz/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:reqresz/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:reqresz/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:reqresz/features/auth/domain/repositories/auth_repository.dart';
import 'package:reqresz/features/auth/domain/usecases/login_usecase.dart';
import 'package:reqresz/features/auth/domain/usecases/logout_usecase.dart';
import 'package:reqresz/features/auth/domain/usecases/register_usecase.dart';
import 'package:reqresz/features/auth/presentation/blocs/login_bloc.dart';
import 'package:reqresz/features/auth/presentation/blocs/register_bloc.dart';
import 'package:reqresz/features/users/data/datasources/user_remote_data_source.dart';
import 'package:reqresz/features/users/data/repositories/user_repository_impl.dart';
import 'package:reqresz/features/users/domain/repositories/user_repository.dart';
import 'package:reqresz/features/users/domain/usecases/delete_user_usecase.dart';
import 'package:reqresz/features/users/domain/usecases/get_users_usecase.dart';
import 'package:reqresz/features/users/domain/usecases/update_user_usecase.dart';
import 'package:reqresz/features/users/presentation/blocs/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Network
  sl.registerLazySingleton(() => ApiClient(baseUrl: 'https://reqres.in/api', logger: Logger()));
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(sl<AuthRemoteDataSource>(), sl<NetworkInfo>(), sl<AuthLocalDataSource>()),
  );
  sl.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(
      remoteDataSource: sl<UserRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton<GetUsersUseCase>(() => GetUsersUseCase(sl()));
  sl.registerLazySingleton<UpdateUserUseCase>(() => UpdateUserUseCase(sl()));
  sl.registerLazySingleton(() => DeleteUserUseCase(sl()));

  // Blocs
  sl.registerFactory(() => LoginBloc(sl(), sl(), sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => UserBloc(
    getUsersUseCase: sl<GetUsersUseCase>(),
    updateUserUseCase: sl<UpdateUserUseCase>(),
    deleteUserUseCase: sl<DeleteUserUseCase>(),
  ));

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
