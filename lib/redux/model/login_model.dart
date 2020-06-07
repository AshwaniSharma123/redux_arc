class LoginModel {
  String _email;
  String _password;
  String _deviceId;
  String _deviceType;

  LoginModel(this._email, this._password, this._deviceId, this._deviceType);


  String get deviceType => _deviceType;

  set deviceType(String value) {
    _deviceType = value;
  }

  String get deviceId => _deviceId;

  set deviceId(String value) {
    _deviceId = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

}