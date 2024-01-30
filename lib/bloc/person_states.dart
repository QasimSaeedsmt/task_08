import 'package:equatable/equatable.dart';

import '../constants/constant_resources.dart';
import '../models/userModel/person.dart';

class PersonState extends Equatable {
  @override
  List<Object> get props => ConstantsResources.EMPTY_LIST;
}

class PersonLoadingState extends PersonState {}

class PersonLoadedState extends PersonState {
  final List<Person> persons;

  PersonLoadedState(this.persons);

  @override
  List<Object> get props => [persons];
}

class PersonErrorState extends PersonState {
  final String error;

  PersonErrorState(this.error);

  @override
  List<Object> get props => [error];
}
