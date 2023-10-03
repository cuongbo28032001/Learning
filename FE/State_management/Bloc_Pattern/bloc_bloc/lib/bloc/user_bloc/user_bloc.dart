import 'package:bloc/bloc.dart';
import 'package:bloc_bloc/data/repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository? repository;
  UserBloc({this.repository}) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserLoadedEvent) {
        return await _fetchUser(emit);
      } else if (event is UserInitialEvent) {
        return _loadingUser(emit);
      } else if (event is UserDeleteEvent) {
        return _deleteUser(emit);
      } else if (event is UserCreatedEvent) {
        return _createdUser(emit);
      }
    });
  }

  _fetchUser(Emitter emitter) async {
    var value = await repository!.fetchPost();
    try {
      if (value.isNotEmpty) {
        emitter(UserLoadedState(value));
      } else {
        emitter(UserErorState("Error while fetching Posts"));
      }
    } catch (e) {
      emitter(UserErorState(e.toString()));
    }
  }

  _loadingUser(Emitter emitter) {
    emitter(UserInitial());
  }

  _deleteUser(Emitter emitter) async {
    try {
      var value = await repository!.deletePost();
      if (value != null) {
        if (value == 200) {
          await _fetchUser(emitter);
        }
      } else {
        emitter(UserErorState("Error while fetching Posts"));
      }
    } catch (e) {
      emitter(UserErorState(e.toString()));
    }
  }

  _createdUser(Emitter emitter) async {
    try {
      var response = await repository!.createPost();
      if (response != null) {
        emitter(UserLoadedState(response));
      }
    } catch (_) {}
  }
}
