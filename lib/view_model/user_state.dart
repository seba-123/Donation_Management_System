abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoading extends UserState {}

class LoginSuccess extends UserState {}

class LoginFailed extends UserState {}

class SendOtpSuccess extends UserState {}
class SendOtpFailed extends UserState {}

class ActivationCodeSuccess extends UserState {}
class ActivationCodeFailed extends UserState {}

class UpdatePasswordSuccess extends UserState {}
class UpdatePasswordFailed extends UserState {}
