import 'package:get_it/get_it.dart';
import 'package:reqresz/features/auth/domain/usecases/login_usecase.dart';
import 'package:reqresz/features/auth/domain/usecases/register_usecase.dart';
import 'package:reqresz/features/auth/presentation/blocs/login_bloc.dart';
import 'package:reqresz/features/auth/presentation/blocs/register_bloc.dart';
import 'package:reqresz/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:reqresz/features/auth/domain/repositories/auth_repository.dart';
import 'package:reqresz/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:reqresz/core/network/api_client.dart';
import 'package:logger/logger.dart';

final sl = GetIt.instance;

void init() {
  // Network
  sl.registerLazySingleton(() => ApiClient(baseUrl: 'https://reqres.in/api', logger: Logger()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // Blocs
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
}
