part of 'destination_cubit.dart';

sealed class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

final class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestintaionSuccess extends DestinationState {
  final List<DestinationModel> destinations;

  const DestintaionSuccess(this.destinations);

  @override
  List<Object> get props => [destinations];
}

class DestinationFailed extends DestinationState {
  final String error;
  const DestinationFailed(this.error);

  @override
  List<Object> get props => [error];
}
