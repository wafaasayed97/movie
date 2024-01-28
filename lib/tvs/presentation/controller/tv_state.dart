part of 'tv_bloc.dart';

class TvState extends Equatable {
  final RequestState onTheAirState;
  final List<Tv> onTheAirList;
  final String onTheAirMessage;

  const TvState({
        this.onTheAirState = RequestState.loading,
       this.onTheAirList=const [],
       this.onTheAirMessage ='',
  });

  @override
  List<Object?> get props => [onTheAirList, onTheAirMessage, onTheAirState];
}
