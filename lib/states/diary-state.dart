import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class DiaryState extends Equatable {
  const DiaryState();

  @override
  List<Object> get props => <Object>[];
}

class DiaryInitial extends DiaryState {}

class DiaryLoading extends DiaryState {}

class DiaryFailure extends DiaryState {
  const DiaryFailure({@required this.error});

  final String error;

  @override
  List<Object> get props => <Object>[error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}