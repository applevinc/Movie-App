import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/src/data_source/repositories/movie_repository_imp.dart';
import 'package:movie_app/src/data_source/sources/remote_data_source.dart';
import 'package:movie_app/src/domain/repositories/movie_repository.dart';
import 'package:movie_app/src/domain/usecases/fetch_TMBD_genre_list_usecase.dart';
import 'package:movie_app/src/domain/usecases/fetch_movie_cast_usecase.dart';
import 'package:movie_app/src/domain/usecases/fetch_movie_search_result_usecase.dart';
import 'package:movie_app/src/domain/usecases/fetch_movie_trailer_usecase.dart';
import 'package:movie_app/src/domain/usecases/fetch_popular_movies_usecase.dart';
import 'package:movie_app/src/domain/usecases/fetch_upcoming_movies_usecase.dart';
import 'package:movie_app/src/view/screens/home/controllers/popular_movies_controller.dart';
import 'package:movie_app/src/view/screens/home/controllers/tmbd_genre_list_controller.dart';
import 'package:movie_app/src/view/screens/home/controllers/upcoming_movies_controller.dart';
import 'package:movie_app/src/view/screens/movieDetails/casts_controller.dart';
import 'package:movie_app/src/view/screens/search/movie_search_results_controller.dart';
import 'package:movie_app/src/view/screens/trailer/movie_trailer_controller.dart';

final GetIt backend = GetIt.instance;

void init() {
  // features
  // - controllers
  backend.registerFactory(() => GetPopularMoviesController(backend()));
  backend.registerFactory(() => GetUpcomingMoviesController(backend()));
  backend.registerFactory(() => CastController(backend()));
  backend.registerFactory(() => MovieTrailerController(backend()));
  backend.registerFactory(() => MovieSearchResultsController(backend()));
  backend.registerLazySingleton(() => GenreListController(backend()));

  // - usecases
  backend.registerLazySingleton(() => GetMovieCastUsecase(backend()));
  backend.registerLazySingleton(() => GetMovieSearchResultUsecase(backend()));
  backend.registerLazySingleton(() => GetMovieTrailerUsecase(backend()));
  backend.registerLazySingleton(() => GetPopularMoviesUsecase(backend()));
  backend.registerLazySingleton(() => GetUpComingMoviesUsecase(backend()));
  backend.registerLazySingleton(() => GetGenreListUsecase(backend()));

  // - repository
  backend.registerLazySingleton<IMovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: backend()));

  // - data sources
  backend.registerLazySingleton<IMovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(dio: backend()));

  // core

  // external
  backend.registerLazySingleton(() => Dio());
}
