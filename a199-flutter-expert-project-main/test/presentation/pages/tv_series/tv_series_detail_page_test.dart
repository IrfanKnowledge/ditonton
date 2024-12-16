import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_add_watchlist_bloc/tv_series_detail_add_watchlist_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_bloc/tv_series_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_load_watchlist_status_bloc/tv_series_detail_load_watchlist_status_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_recommendation_bloc/tv_series_detail_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_remove_watchlist_bloc/tv_series_detail_remove_watchlist_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_page_test.mocks.dart';

///
/// Page [TvSeriesDetailPage],
/// bergantung pada:
///  - Bloc [TvSeriesDetailBloc]
///  - Bloc [TvSeriesDetailRecommendationBloc]
///  - Bloc [TvSeriesDetailLoadWatchlistStatusBloc]
///  - Bloc [TvSeriesDetailAddWatchlistBloc]
///  - Bloc [TvSeriesDetailRemoveWatchlistBloc]
///
@GenerateMocks([
  TvSeriesDetailBloc,
  TvSeriesDetailRecommendationBloc,
  TvSeriesDetailLoadWatchlistStatusBloc,
  TvSeriesDetailAddWatchlistBloc,
  TvSeriesDetailRemoveWatchlistBloc,
])
void main() {
  late MockTvSeriesDetailBloc mockTvSeriesDetail;
  late MockTvSeriesDetailRecommendationBloc mockTvSeriesDetailRecommendation;
  late MockTvSeriesDetailLoadWatchlistStatusBloc
      mockTvSeriesDetailLoadWatchlistStatus;
  late MockTvSeriesDetailAddWatchlistBloc mockTvSeriesDetailAddWatchlist;
  late MockTvSeriesDetailRemoveWatchlistBloc mockTvSeriesDetailRemoveWatchlist;

  void arrangeStreamDetailAndRecommendations() {
    when(mockTvSeriesDetail.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tTvSeriesDetail),
      ]),
    );
    when(mockTvSeriesDetailRecommendation.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const RequestStateFr.initial(),
        const RequestStateFr.loading(),
        RequestStateFr.loaded(tTvSeriesDetailRecommendationList),
      ]),
    );
  }

  void arrangeStateDetailAndRecommendations() {
    when(mockTvSeriesDetail.state)
        .thenReturn(RequestStateFr.loaded(tTvSeriesDetail));

    when(mockTvSeriesDetailRecommendation.state)
        .thenReturn(RequestStateFr.loaded(tTvSeriesDetailRecommendationList));
  }

  setUp(
    () {
      mockTvSeriesDetail = MockTvSeriesDetailBloc();
      mockTvSeriesDetailRecommendation = MockTvSeriesDetailRecommendationBloc();
      mockTvSeriesDetailLoadWatchlistStatus =
          MockTvSeriesDetailLoadWatchlistStatusBloc();
      mockTvSeriesDetailAddWatchlist = MockTvSeriesDetailAddWatchlistBloc();
      mockTvSeriesDetailRemoveWatchlist =
          MockTvSeriesDetailRemoveWatchlistBloc();

      arrangeStreamDetailAndRecommendations();
      arrangeStateDetailAndRecommendations();
    },
  );

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvSeriesDetailBloc>.value(
          value: mockTvSeriesDetail,
        ),
        BlocProvider<TvSeriesDetailRecommendationBloc>.value(
          value: mockTvSeriesDetailRecommendation,
        ),
        BlocProvider<TvSeriesDetailLoadWatchlistStatusBloc>.value(
          value: mockTvSeriesDetailLoadWatchlistStatus,
        ),
        BlocProvider<TvSeriesDetailAddWatchlistBloc>.value(
          value: mockTvSeriesDetailAddWatchlist,
        ),
        BlocProvider<TvSeriesDetailRemoveWatchlistBloc>.value(
          value: mockTvSeriesDetailRemoveWatchlist,
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
    when(mockTvSeriesDetailLoadWatchlistStatus.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
      ]),
    );

    when(mockTvSeriesDetailAddWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailAddWatchlistState(
            watchlistMessage:
                TvSeriesDetailAddWatchlistBloc.watchlistAddResetMessage),
      ]),
    );

    when(mockTvSeriesDetailRemoveWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailRemoveWatchlistState(
          watchlistMessage:
              TvSeriesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage,
        ),
      ]),
    );

    when(mockTvSeriesDetailLoadWatchlistStatus.state).thenReturn(
      const TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
    );

    when(mockTvSeriesDetailAddWatchlist.state).thenReturn(
      const TvSeriesDetailAddWatchlistState(
          watchlistMessage:
              TvSeriesDetailAddWatchlistBloc.watchlistAddResetMessage),
    );
    when(mockTvSeriesDetailRemoveWatchlist.state).thenReturn(
      const TvSeriesDetailRemoveWatchlistState(
          watchlistMessage:
              TvSeriesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage),
    );

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when tv series is added to wathclist',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailLoadWatchlistStatus.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: true),
      ]),
    );

    when(mockTvSeriesDetailAddWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailAddWatchlistState(
            watchlistMessage:
                TvSeriesDetailAddWatchlistBloc.watchlistAddResetMessage),
      ]),
    );

    when(mockTvSeriesDetailRemoveWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailRemoveWatchlistState(
          watchlistMessage:
              TvSeriesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage,
        ),
      ]),
    );

    when(mockTvSeriesDetailLoadWatchlistStatus.state).thenReturn(
      const TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: true),
    );

    when(mockTvSeriesDetailAddWatchlist.state).thenReturn(
      const TvSeriesDetailAddWatchlistState(
          watchlistMessage:
              TvSeriesDetailAddWatchlistBloc.watchlistAddResetMessage),
    );
    when(mockTvSeriesDetailRemoveWatchlist.state).thenReturn(
      const TvSeriesDetailRemoveWatchlistState(
          watchlistMessage:
              TvSeriesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage),
    );

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailLoadWatchlistStatus.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
      ]),
    );

    when(mockTvSeriesDetailAddWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailAddWatchlistState(
            watchlistMessage: 'Added to Watchlist'),
      ]),
    );

    when(mockTvSeriesDetailRemoveWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailRemoveWatchlistState(
          watchlistMessage:
              TvSeriesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage,
        ),
      ]),
    );

    when(mockTvSeriesDetailLoadWatchlistStatus.state).thenReturn(
      const TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
    );

    when(mockTvSeriesDetailAddWatchlist.state).thenReturn(
      const TvSeriesDetailAddWatchlistState(
          watchlistMessage: 'Added to Watchlist'),
    );
    when(mockTvSeriesDetailRemoveWatchlist.state).thenReturn(
      const TvSeriesDetailRemoveWatchlistState(
          watchlistMessage:
              TvSeriesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockTvSeriesDetailLoadWatchlistStatus.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
      ]),
    );

    when(mockTvSeriesDetailAddWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailAddWatchlistState(watchlistMessage: 'Failed'),
      ]),
    );

    when(mockTvSeriesDetailRemoveWatchlist.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const TvSeriesDetailRemoveWatchlistState(
          watchlistMessage:
              TvSeriesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage,
        ),
      ]),
    );

    when(mockTvSeriesDetailLoadWatchlistStatus.state).thenReturn(
      const TvSeriesDetailLoadWatchlistStatusState(isAddedToWatchList: false),
    );
    when(mockTvSeriesDetailAddWatchlist.state).thenReturn(
      const TvSeriesDetailAddWatchlistState(watchlistMessage: 'Failed'),
    );
    when(mockTvSeriesDetailRemoveWatchlist.state).thenReturn(
      const TvSeriesDetailRemoveWatchlistState(
          watchlistMessage:
              TvSeriesDetailRemoveWatchlistBloc.watchlistRemoveResetMessage),
    );

    // final watchlistButton = find.byType(ElevatedButton);
    final watchlistButton = find.widgetWithText(InkWell, 'Watchlist');

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
