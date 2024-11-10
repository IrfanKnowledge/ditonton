import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_airing_today.dart';
import 'package:flutter/material.dart';

class TvSeriesAiringTodayNotifier extends ChangeNotifier {
  final GetTvSeriesAiringToday getTvSeriesAiringTodayUseCase;

  TvSeriesAiringTodayNotifier({
    required this.getTvSeriesAiringTodayUseCase,
  });

  List<TvSeries> _tvSeriesList = [];
  List<TvSeries> get tvSeriesList => _tvSeriesList;

  RequestState _airingTodayState = RequestState.Empty;
  RequestState get airingTodayState => _airingTodayState;

  String _message = '';
  String get message => _message;

  Future<void> fetchAiringToday() async {
    _airingTodayState = RequestState.Loading;
    notifyListeners();

    final result = await getTvSeriesAiringTodayUseCase.execute();
    result.fold(
      (l) {
        _airingTodayState = RequestState.Error;
        _message = l.message;
        notifyListeners();
      },
      (r) {
        _airingTodayState = RequestState.Loaded;
        _tvSeriesList = r;
        notifyListeners();
      },
    );
  }
}
