// bloc/person_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_08/bloc/person_events.dart';
import 'package:task_08/bloc/person_states.dart';

import '../models/userModel/person.dart';
import '../services/apiService/api_service.dart';
import '../services/dio_client.dart';
import '../services/hive_db.dart';

class PersonBloc extends Bloc<FetchPersonEvent, PersonState> {
  final ApiService _apiService = ApiService(DioClient.init());

  PersonBloc() : super(PersonLoadingState()) {
    on<FetchPersonEvent>(_onFetchPersonEvent);
  }

  Future<void> _onFetchPersonEvent(
    FetchPersonEvent event,
    Emitter<PersonState> emit,
  ) async {
    try {
      emit(PersonLoadingState());

      final List<Person> persons = await _apiService.getData();
      HiveDB.box.addAll(persons);

      emit(PersonLoadedState(persons));
    } catch (e) {
      emit(PersonErrorState(e.toString()));
    }
  }

  Stream<PersonState> mapEventToState(FetchPersonEvent event) async* {
    yield PersonLoadingState();
    try {
      final List<Person> persons = await _apiService.getData();
      HiveDB.box.addAll(persons);

      yield PersonLoadedState(persons);
    } catch (e) {
      yield PersonErrorState(e.toString());
    }
  }
}
