import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_bloc/movies_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movies_detail_bloc_test.mocks.dart';

///
/// Bloc [MoviesDetailBloc],
/// bergantung pada usecase [GetMovieDetail]
///
@GenerateMocks([
  GetMovieDetail,
])
void main() {
  late MoviesDetailBloc bloc;
  late MockGetMovieDetail mockGetMovieDetail;

  setUp(
    () {
      mockGetMovieDetail = MockGetMovieDetail();
      bloc = MoviesDetailBloc(
        getMovieDetailUseCase: mockGetMovieDetail,
      );
    },
  );

  const tId = 1;

  test(
    'should have state initial, '
    'when bloc still on initialState',
    () {
      expect(bloc.state, const RequestStateFr<MovieDetail>.initial());
    },
  );

  blocTest<MoviesDetailBloc, RequestStateFr<MovieDetail>>(
    'should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(
        mockGetMovieDetail.execute(tId),
      ).thenAnswer((_) async => const Right(testMovieDetail));

      return MoviesDetailBloc(
        getMovieDetailUseCase: mockGetMovieDetail,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesDetailEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<MovieDetail>>[
      const RequestStateFr.loading(),
      const RequestStateFr.loaded(testMovieDetail),
    ],
    verify: (_) {
      verify(
        mockGetMovieDetail.execute(tId),
      );
    },
  );

  blocTest<MoviesDetailBloc, RequestStateFr<MovieDetail>>(
    'should emit [Loading, Error] when data is gotten unsuccessful',
    build: () {
      when(
        mockGetMovieDetail.execute(tId),
      ).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return MoviesDetailBloc(
        getMovieDetailUseCase: mockGetMovieDetail,
      );
    },
    act: (bloc) {
      return bloc.add(const MoviesDetailEvent.started(tId));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => <RequestStateFr<MovieDetail>>[
      const RequestStateFr.loading(),
      const RequestStateFr.error('Server Failure'),
    ],
    verify: (_) {
      verify(
        mockGetMovieDetail.execute(tId),
      );
    },
  );
}
