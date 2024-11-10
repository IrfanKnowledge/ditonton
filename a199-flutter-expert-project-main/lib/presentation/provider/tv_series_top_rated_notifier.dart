import 'package:ditonton/domain/usecases/get_tv_series_top_rated.dart';
import 'package:flutter/material.dart';

import '../../common/state_enum.dart';
import '../../domain/entities/tv_series.dart';

class TvSeriesTopRatedNotifier extends ChangeNotifier {
  final GetTvSeriesTopRated getTvSeriesTopRatedUseCase;

  TvSeriesTopRatedNotifier({required this.getTvSeriesTopRatedUseCase});

  List<TvSeries> _tvSeriesList = [];
  List<TvSeries> get tvSeriesList => _tvSeriesList;

  RequestState _topRatedState = RequestState.Empty;
  RequestState get topRatedState => _topRatedState;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRated() async {
    _topRatedState = RequestState.Loading;
    notifyListeners();

    final result = await getTvSeriesTopRatedUseCase.execute();
    result.fold(
          (l) {
        _topRatedState = RequestState.Error;
        _message = l.message;
        notifyListeners();
      },
          (r) {
        _topRatedState = RequestState.Loaded;
        _tvSeriesList = r;
        notifyListeners();
      },
    );
  }
}
