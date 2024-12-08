import 'package:flutter/material.dart';

import '../../common/state_enum.dart';
import '../../domain/entities/tv_series.dart';
import '../../domain/usecases/get_tv_series_popular.dart';

class TvSeriesPopularNotifier extends ChangeNotifier {
  final GetTvSeriesPopular getTvSeriesPopularUseCase;

  TvSeriesPopularNotifier({required this.getTvSeriesPopularUseCase});

  List<TvSeries> _tvSeriesList = [];
  List<TvSeries> get tvSeriesList => _tvSeriesList;

  RequestState _popularState = RequestState.empty;
  RequestState get popularState => _popularState;

  String _message = '';
  String get message => _message;

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
        _tvSeriesList = r;
        notifyListeners();
      },
    );
  }
}
