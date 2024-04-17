abstract class connectState {}

class ConnectStateiniti extends connectState {}

class ConnectStateloading extends connectState {}

class ConnectStatesuccess extends connectState {
  final String success_message;

  ConnectStatesuccess({required this.success_message});
}

class ConnectStatefailure extends connectState {
  final String error_message;

  ConnectStatefailure({required this.error_message});
}
