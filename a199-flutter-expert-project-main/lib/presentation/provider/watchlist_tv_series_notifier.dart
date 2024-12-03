import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_watchedlist_tv_series.dart';
import 'package:flutter/foundation.dart';

import '../../common/state_enum.dart';

class WatchlistTvSeriesNotifier extends ChangeNotifier {
  final GetWatchlistTvSeries _getWatchlistTvSeriesUseCase;

  WatchlistTvSeriesNotifier({
    required GetWatchlistTvSeries getWatchlistTvSeriesUseCase,
  }) : _getWatchlistTvSeriesUseCase = getWatchlistTvSeriesUseCase;

  var _watchlistTvSeries = <TvSeries>[];

  List<TvSeries> get watchlistTvSeries => _watchlistTvSeries;

  var _watchlistState = RequestState.Empty;

  RequestState get watchlistState => _watchlistState;

  String _message = '';

  String get message => _message;

  Future<void> fetchWatchlistTvSeries() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await _getWatchlistTvSeriesUseCase.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesList) {
        _watchlistState = RequestState.Loaded;
        _watchlistTvSeries = tvSeriesList;
        notifyListeners();
      },
    );
  }
}
