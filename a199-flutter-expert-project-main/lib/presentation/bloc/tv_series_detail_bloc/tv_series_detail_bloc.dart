import 'package:ditonton/common/state_freezed.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_detail_bloc.freezed.dart';
part 'tv_series_detail_event.dart';

class TvSeriesDetailBloc
    extends Bloc<TvSeriesDetailEvent, RequestStateFr<TvSeriesDetail>> {
  final GetTvSeriesDetail _getTvSeriesDetailUseCase;

  TvSeriesDetailBloc({
    required GetTvSeriesDetail getTvSeriesDetailUseCase,
  })  : _getTvSeriesDetailUseCase = getTvSeriesDetailUseCase,
        super(const RequestStateFr.initial()) {
    on<TvSeriesDetailEvent>((event, emit) {
      event.map(
        started: (value) {
          final int id = value.id;
          fetchTvSeriesDetail(emit: emit, id: id);
        },
      );
    });
  }

  Future<void> fetchTvSeriesDetail({
    required Emitter<RequestStateFr<TvSeriesDetail>> emit,
    required int id,
  }) async {
    emit(const RequestStateFr.loading());

    final detailResult = await _getTvSeriesDetailUseCase.execute(
      GetTvSeriesDetailParams(id: id),
    );

    detailResult.fold(
      (failure) {
        emit(RequestStateFr.error(failure.message));
      },
      (tvSeriesDetail) {
        emit(RequestStateFr.loaded(tvSeriesDetail));
      },
    );
  }
}
