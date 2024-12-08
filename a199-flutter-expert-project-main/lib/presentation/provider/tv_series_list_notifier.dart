import 'package:flutter/foundation.dart';

import '../../common/state_enum.dart';
import '../../domain/entities/tv_series.dart';
import '../../domain/usecases/get_tv_series_airing_today.dart';
import '../../domain/usecases/get_tv_series_popular.dart';
import '../../domain/usecases/get_tv_series_top_rated.dart';

class TvSeriesListNotifier extends ChangeNotifier {
  final GetTvSeriesAiringToday getTvSeriesAiringTodayUseCase;
  final GetTvSeriesPopular getTvSeriesPopularUseCase;
  final GetTvSeriesTopRated getTvSeriesTopRatedUseCase;

  TvSeriesListNotifier({
    required this.getTvSeriesAiringTodayUseCase,
    required this.getTvSeriesPopularUseCase,
    required this.getTvSeriesTopRatedUseCase,
  });

  List<TvSeries> _tvSeriesAiringTodayList = [];
  List<TvSeries> get tvSeriesAiringTodayList => _tvSeriesAiringTodayList;

  RequestState _airingTodayState = RequestState.empty;
  RequestState get airingTodayState => _airingTodayState;

  List<TvSeries> _tvSeriesPopularList = [];
  List<TvSeries> get tvSeriesPopularList => _tvSeriesPopularList;

  RequestState _popularState = RequestState.empty;
  RequestState get popularState => _popularState;

  List<TvSeries> _tvSeriesTopRatedList = [];
  List<TvSeries> get tvSeriesTopRatedList => _tvSeriesTopRatedList;

  RequestState _topRatedState = RequestState.empty;
  RequestState get topRatedState => _topRatedState;

  String _message = '';
  String get message => _message;

  Future<void> fetchAiringToday() async {
    _airingTodayState = RequestState.loading;
    notifyListeners();

    final result = await getTvSeriesAiringTodayUseCase.execute();
    result.fold(
          (l) {
        _airingTodayState = RequestState.error;
        _message = l.message;
        notifyListeners();
      },
          (r) {
        _airingTodayState = RequestState.loaded;
        _tvSeriesAiringTodayList = r;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopular() async {
    _popularState = RequestState.loading;
    notifyListeners();

    final result = await getTvSeriesPopularUseCase.execute();
    result.fold(
          (l) {
        _popularState = RequestState.error;
        _message = l.message;
        notifyListeners();
      },
          (r) {
        _popularState = RequestState.loaded;
        _tvSeriesPopularList = r;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRated() async {
    _topRatedState = RequestState.loading;
    notifyListeners();

    final result = await getTvSeriesTopRatedUseCase.execute();
    result.fold(
          (l) {
        _topRatedState = RequestState.error;
        _message = l.message;
        notifyListeners();
      },
          (r) {
        _topRatedState = RequestState.loaded;
        _tvSeriesTopRatedList = r;
        notifyListeners();
      },
    );
  }
}
