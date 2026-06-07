class LoginRequest{
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class RegisterRequest{
  String userName;
  String countryCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterRequest(this.userName, this.countryCode, this.mobileNumber,
      this.email, this.password, this.profilePicture);
}