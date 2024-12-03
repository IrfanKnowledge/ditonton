import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail_recommendtaions.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:flutter/widgets.dart';

import '../../common/state_enum.dart';
import '../../domain/entities/tv_series.dart';
import '../../domain/entities/tv_series_detail.dart';

class TvSeriesDetailNotifier extends ChangeNotifier {
  final GetTvSeriesDetail _getTvSeriesDetailUseCase;
  final GetTvSeriesDetailRecommendations
      _getTvSeriesDetailRecommendationsUseCase;
  final GetWatchlistStatusTvSeries _getWatchlistStatusTvSeriesUseCase;
  final SaveWatchlistTvSeries _saveWatchlistTvSeriesUseCase;
  final RemoveWatchlistTvSeries _removeWatchlistTvSeriesUseCase;

  TvSeriesDetailNotifier({
    required GetTvSeriesDetail getTvSeriesDetailUseCase,
    required GetTvSeriesDetailRecommendations
        getTvSeriesDetailRecommendationsUseCase,
    required GetWatchlistStatusTvSeries getWatchlistStatusTvSeriesUseCase,
    required SaveWatchlistTvSeries saveWatchlistTvSeriesUseCase,
    required RemoveWatchlistTvSeries removeWatchlistTvSeriesUseCase,
  })  : _getTvSeriesDetailUseCase = getTvSeriesDetailUseCase,
        _getTvSeriesDetailRecommendationsUseCase =
            getTvSeriesDetailRecommendationsUseCase,
        _getWatchlistStatusTvSeriesUseCase = getWatchlistStatusTvSeriesUseCase,
        _saveWatchlistTvSeriesUseCase = saveWatchlistTvSeriesUseCase,
        _removeWatchlistTvSeriesUseCase = removeWatchlistTvSeriesUseCase;

  late TvSeriesDetail _tvSeriesDetail;

  TvSeriesDetail get tvSeriesDetail => _tvSeriesDetail;

  RequestState _tvSeriesState = RequestState.Empty;

  RequestState get tvSeriesState => _tvSeriesState;

  List<TvSeries> _tvSeriesRecommendations = [];

  List<TvSeries> get tvSeriesRecommendations => _tvSeriesRecommendations;

  RequestState _recommendationState = RequestState.Empty;

  RequestState get recommendationState => _recommendationState;

  String _message = '';

  String get message => _message;

  bool _isAddedtoWatchlist = false;

  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  String _watchlistMessage = '';

  String get watchlistMessage => _watchlistMessage;

  Future<void> fetchTvSeriesDetail(int id) async {
    _tvSeriesState = RequestState.Loading;
    notifyListeners();
    final detailResult = await _getTvSeriesDetailUseCase.execute(
      GetTvSeriesDetailParams(id: id),
    );
    final recommendationResult =
        await _getTvSeriesDetailRecommendationsUseCase.execute(
      GetTvSeriesDetailRecommendationsParams(id: id),
    );

    detailResult.fold(
      (failure) {
        _tvSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesDetail) {
        _recommendationState = RequestState.Loading;
        _tvSeriesDetail = tvSeriesDetail;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
          (tvSeriesDetailRecommendations) {
            _recommendationState = RequestState.Loaded;
            _tvSeriesRecommendations = tvSeriesDetailRecommendations;
          },
        );
        _tvSeriesState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  Future<void> addWatchlist(TvSeriesDetail tvSeriesDetail) async {
    final result = await _saveWatchlistTvSeriesUseCase.execute(
      SaveWatchlistTvSeriesParams(tvSeriesDetail: tvSeriesDetail),
    );

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvSeriesDetail.id!);
  }

  Future<void> removeFromWatchlist(TvSeriesDetail tvSeriesDetail) async {
    final result = await _removeWatchlistTvSeriesUseCase.execute(
      RemoveWatchlistTvSeriesParams(tvSeriesDetail: tvSeriesDetail),
    );

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvSeriesDetail.id!);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await _getWatchlistStatusTvSeriesUseCase.execute(
      GetWatchlistStatusTvSeriesParams(id: id),
    );
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
