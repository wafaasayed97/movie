import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import '../../domain/entities/tv_entity.dart';
import '../../domain/usecases/get_on_the_air_tv.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirTVUseCase getOnTheAirTVUseCase;
  TvBloc(this.getOnTheAirTVUseCase) : super(const TvState()) {
    on<GetOnTheAirTvEvent>((event, emit) async {
      final result = await getOnTheAirTVUseCase.execute();

      result.fold(
          (l) => emit(TvState(
              onTheAirState: RequestState.error, onTheAirMessage: l.message)),
          (r) => emit(
              TvState(onTheAirList: r, onTheAirState: RequestState.loaded)));
    });
  }
}
