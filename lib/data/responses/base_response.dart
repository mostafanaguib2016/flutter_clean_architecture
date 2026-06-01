import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse{
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;

  CustomerResponse(this.id, this.name, this.numOfNotifications);

  // from Json
  factory CustomerResponse.fromJson(Map<String,dynamic> json) =>
      _$CustomerResponseFromJson(json);

  // toJson
  Map<String,dynamic> toJson() => _$CustomerResponseToJson(this);


}

@JsonSerializable()
class ContactsResponse{
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;

  ContactsResponse(this.phone, this.email, this.link);

  // from Json
  factory ContactsResponse.fromJson(Map<String,dynamic> json) =>
      _$ContactsResponseFromJson(json);

  // toJson
  Map<String,dynamic> toJson() => _$ContactsResponseToJson(this);

}

@JsonSerializable()
class AuthResponse extends BaseResponse{
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contact")
  ContactsResponse? contact;

  AuthResponse(this.customer, this.contact);

  // from Json
  factory AuthResponse.fromJson(Map<String,dynamic> json) =>
      _$AuthResponseFromJson(json);

  // toJson
  Map<String,dynamic> toJson() => _$AuthResponseToJson(this);
}