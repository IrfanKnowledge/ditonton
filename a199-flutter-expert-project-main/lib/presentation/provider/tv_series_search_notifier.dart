import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter/foundation.dart';

import '../../common/state_enum.dart';
import '../../domain/usecases/get_tv_series_searched.dart';

class TvSeriesSearchNotifier extends ChangeNotifier {
  final GetTvSeriesSearched _getTvSeriesSearchedUseCase;

  TvSeriesSearchNotifier({
required GetTvSeriesSearched getTvSeriesSearchedUseCase,
}) : _getTvSeriesSearchedUseCase = getTvSeriesSearchedUseCase;

  RequestState _state = RequestState.empty;

  RequestState get state => _state;

  List<TvSeries> _searchResult = [];

  List<TvSeries> get searchResult => _searchResult;

  String _message = '';

  String get message => _message;

  Future<void> fetchTvSeriesSearch(String query) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await _getTvSeriesSearchedUseCase.execute(
      GetTvSeriesSearchedParams(name: query),
    );
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
