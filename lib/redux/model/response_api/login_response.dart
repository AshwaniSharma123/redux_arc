class LoginResponse {
  bool success;
  int statusCode;
  String message;
  Data data;

  LoginResponse({this.success, this.statusCode, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int userId;
  String firstName;
  String lastName;
  String email;
  String otpVerified;
  String language;
  String notifications;
  String apiToken;
  int swimmerCount;
  String loginUser;

  Data(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.otpVerified,
      this.language,
      this.notifications,
      this.apiToken,
      this.swimmerCount,
      this.loginUser});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    otpVerified = json['otp_verified'];
    language = json['language'];
    notifications = json['notifications'];
    apiToken = json['api_token'];
    swimmerCount = json['swimmer_count'];
    loginUser = json['login_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['otp_verified'] = this.otpVerified;
    data['language'] = this.language;
    data['notifications'] = this.notifications;
    data['api_token'] = this.apiToken;
    data['swimmer_count'] = this.swimmerCount;
    data['login_user'] = this.loginUser;
    return data;
  }
}
