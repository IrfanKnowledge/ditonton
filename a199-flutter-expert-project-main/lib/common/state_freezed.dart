import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_freezed.freezed.dart';

@freezed
class RequestStateFr<T> with _$RequestStateFr {
  const factory RequestStateFr.initial() = Initial;

  const factory RequestStateFr.loading() = Loading;

  const factory RequestStateFr.loaded(T data) = Loaded;

  const factory RequestStateFr.error(String message) = Error;
}
