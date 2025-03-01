import 'package:get_it/get_it.dart';
import 'package:reqresz/core/network/api_client.dart';
import 'package:reqresz/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:reqresz/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:reqresz/features/auth/domain/repositories/auth_repository.dart';
import 'package:reqresz/features/auth/domain/usecases/login_usecase.dart';
import 'package:reqresz/features/auth/presentation/blocs/login_bloc.dart';
import 'package:logger/logger.dart';

final sl = GetIt.instance;

void init() {
  // 🔹 Core
  sl.registerLazySingleton(() => Logger());
  sl.registerLazySingleton(() => ApiClient(baseUrl: 'https://reqres.in/', logger: sl<Logger>()));

  // 🔹 Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl<ApiClient>()));

  // 🔹 Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: sl<AuthRemoteDataSource>()));

  // 🔹 Use Case
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));

  // 🔹 Bloc / Cubit
  sl.registerFactory(() => LoginBloc(sl<LoginUseCase>()));
}
