import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_add_watchlist_bloc/movies_detail_add_watchlist_bloc.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_bloc/movies_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_load_watchlist_status_bloc/movies_detail_load_watchlist_status_bloc.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_recommendation_bloc/movies_detail_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/movies/movies_detail_remove_watchlist_bloc/movies_detail_remove_watchlist_bloc.dart';
import 'package:ditonton/presentation/pages/movies/movies_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'movies_detail_page_test.mocks.dart';

///
/// Page [MoviesDetailPage],
/// bergantung pada:
///  - Bloc [MoviesDetailBloc]
///  - Bloc [MoviesDetailRecommendationBloc]
///  - Bloc [MoviesDetailLoadWatchlistStatusBloc]
///  - Bloc [MoviesDetailAddWatchlistBloc]
///  - Bloc [MoviesDetailRemoveWatchlistBloc]
///
@GenerateMocks([
  MoviesDetailBloc,
  MoviesDetailRecommendationBloc,
  MoviesDetailLoadWatchlistStatusBloc,
  MoviesDetailAddWatchlistBloc,
  MoviesDetailRemoveWatchlistBloc,
])
void main() {
  late MockMoviesDetailBloc mockMoviesDetail;
  late MockMoviesDetailRecommendationBloc mockMoviesDetailRecommendation;
  late MockMoviesDetailLoadWatchlistStatusBloc
      mockMoviesDetailLoadWatchlistStatus;
  late MockMoviesDetailAddWatchlistBloc mockMoviesDetailAddWatchlist;
  late MockMoviesDetailRemoveWatchlistBloc mockMoviesDetailRemoveWatchlist;

  const tId = 1;

  const tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: tId,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovies = <Movie>[tMovie];

  void arrangeStreamDetailAndRecommendations() {
    when(mockMoviesDetail.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        const RequestStateFr.loaded(testMovieDetail),
      ]),
    );
    when(mockMoviesDetailRecommendation.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tMovies),
      ]),
    );
  }

  void arrangeStateDetailAndRecommendations() {
    when(mockMoviesDetail.state)
        .thenReturn(const RequestStateFr.loaded(testMovieDetail));

    when(mockMoviesDetailRecommendation.state)
        .thenReturn(RequestStateFr.loaded(tMovies));
  }

  setUp(
    () {
      mockMoviesDetail = MockMoviesDetailBloc();
      mockMoviesDetailRecommendation = MockMoviesDetailRecommendationBloc();
      mockMoviesDetailLoadWatchlistStatus =
          MockMoviesDetailLoadWatchlistStatusBloc();
      mockMoviesDetailAddWatchlist = MockMoviesDetailAddWatchlistBloc();
      mockMoviesDetailRemoveWatchlist = MockMoviesDetailRemoveWatchlistBloc();

      arrangeStreamDetailAndRecommendations();
      arrangeStateDetailAndRecommendations();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesDetailBloc>.value(
          value: mockMoviesDetail,
        ),
        BlocProvider<MoviesDetailRecommendationBloc>.value(
          value: mockMoviesDetailRecommendation,
        ),
        BlocProvider<MoviesDetailLoadWatchlistStatusBloc>.value(
          value: mockMoviesDetailLoadWatchlistStatus,
        ),
        BlocProvider<MoviesDetailAddWatchlistBloc>.value(
          value: mockMoviesDetailAddWatchlist,
        ),
        BlocProvider<MoviesDetailRemoveWatchlistBloc>.value(
          value: mockMoviesDetailRemoveWatchlist,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when tv series not added to watchlist',
      (WidgetTester tester) async {
    when(mockMoviesDetailLoadWatchlistStatus.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
      ]),
    );

    when(mockMoviesDetailAddWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailAddWatchlistState(
            watchlistMessage:
                MoviesDetailAddWatchlistBloc.watchlistAddResetMessage),
      ]),
    );

    when(mockMoviesDetailRemoveWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailRemoveWatchlistState(
          watchlistMessage:
              MoviesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage,
        ),
      ]),
    );

    when(mockMoviesDetailLoadWatchlistStatus.state).thenReturn(
      const MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
    );

    when(mockMoviesDetailAddWatchlist.state).thenReturn(
      const MoviesDetailAddWatchlistState(
          watchlistMessage:
              MoviesDetailAddWatchlistBloc.watchlistAddResetMessage),
    );
    when(mockMoviesDetailRemoveWatchlist.state).thenReturn(
      const MoviesDetailRemoveWatchlistState(
          watchlistMessage:
              MoviesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage),
    );

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester
        .pumpWidget(makeTestableWidget(const MoviesDetailPage(id: tId)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when tv series is added to wathclist',
      (WidgetTester tester) async {
    when(mockMoviesDetailLoadWatchlistStatus.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: true),
      ]),
    );

    when(mockMoviesDetailAddWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailAddWatchlistState(
            watchlistMessage:
                MoviesDetailAddWatchlistBloc.watchlistAddResetMessage),
      ]),
    );

    when(mockMoviesDetailRemoveWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailRemoveWatchlistState(
          watchlistMessage:
              MoviesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage,
        ),
      ]),
    );

    when(mockMoviesDetailLoadWatchlistStatus.state).thenReturn(
      const MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: true),
    );

    when(mockMoviesDetailAddWatchlist.state).thenReturn(
      const MoviesDetailAddWatchlistState(
          watchlistMessage:
              MoviesDetailAddWatchlistBloc.watchlistAddResetMessage),
    );
    when(mockMoviesDetailRemoveWatchlist.state).thenReturn(
      const MoviesDetailRemoveWatchlistState(
          watchlistMessage:
              MoviesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage),
    );

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester
        .pumpWidget(makeTestableWidget(const MoviesDetailPage(id: tId)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(mockMoviesDetailLoadWatchlistStatus.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
      ]),
    );

    when(mockMoviesDetailAddWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailAddWatchlistState(
            watchlistMessage: 'Added to Watchlist'),
      ]),
    );

    when(mockMoviesDetailRemoveWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailRemoveWatchlistState(
          watchlistMessage:
              MoviesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage,
        ),
      ]),
    );

    when(mockMoviesDetailLoadWatchlistStatus.state).thenReturn(
      const MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
    );

    when(mockMoviesDetailAddWatchlist.state).thenReturn(
      const MoviesDetailAddWatchlistState(
          watchlistMessage: 'Added to Watchlist'),
    );
    when(mockMoviesDetailRemoveWatchlist.state).thenReturn(
      const MoviesDetailRemoveWatchlistState(
          watchlistMessage:
              MoviesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester
        .pumpWidget(makeTestableWidget(const MoviesDetailPage(id: tId)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockMoviesDetailLoadWatchlistStatus.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
      ]),
    );

    when(mockMoviesDetailAddWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailAddWatchlistState(watchlistMessage: 'Failed'),
      ]),
    );

    when(mockMoviesDetailRemoveWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const MoviesDetailRemoveWatchlistState(
          watchlistMessage:
              MoviesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage,
        ),
      ]),
    );

    when(mockMoviesDetailLoadWatchlistStatus.state).thenReturn(
      const MoviesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
    );
    when(mockMoviesDetailAddWatchlist.state).thenReturn(
      const MoviesDetailAddWatchlistState(watchlistMessage: 'Failed'),
    );
    when(mockMoviesDetailRemoveWatchlist.state).thenReturn(
      const MoviesDetailRemoveWatchlistState(
          watchlistMessage:
              MoviesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage),
    );

    // final watchlistButton = find.byType(ElevatedButton);
    final watchlistButton = find.widgetWithText(InkWell, 'Watchlist');

    await tester
        .pumpWidget(makeTestableWidget(const MoviesDetailPage(id: tId)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
