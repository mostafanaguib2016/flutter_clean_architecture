// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginObject {

 String get userName; String get password;
/// Create a copy of LoginObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginObjectCopyWith<LoginObject> get copyWith => _$LoginObjectCopyWithImpl<LoginObject>(this as LoginObject, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginObject&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,userName,password);

@override
String toString() {
  return 'LoginObject(userName: $userName, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginObjectCopyWith<$Res>  {
  factory $LoginObjectCopyWith(LoginObject value, $Res Function(LoginObject) _then) = _$LoginObjectCopyWithImpl;
@useResult
$Res call({
 String userName, String password
});




}
/// @nodoc
class _$LoginObjectCopyWithImpl<$Res>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._self, this._then);

  final LoginObject _self;
  final $Res Function(LoginObject) _then;

/// Create a copy of LoginObject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? password = null,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginObject].
extension LoginObjectPatterns on LoginObject {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginObject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginObject() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginObject value)  $default,){
final _that = this;
switch (_that) {
case _LoginObject():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginObject value)?  $default,){
final _that = this;
switch (_that) {
case _LoginObject() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userName,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginObject() when $default != null:
return $default(_that.userName,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userName,  String password)  $default,) {final _that = this;
switch (_that) {
case _LoginObject():
return $default(_that.userName,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userName,  String password)?  $default,) {final _that = this;
switch (_that) {
case _LoginObject() when $default != null:
return $default(_that.userName,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _LoginObject implements LoginObject {
  const _LoginObject(this.userName, this.password);
  

@override final  String userName;
@override final  String password;

/// Create a copy of LoginObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginObjectCopyWith<_LoginObject> get copyWith => __$LoginObjectCopyWithImpl<_LoginObject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginObject&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,userName,password);

@override
String toString() {
  return 'LoginObject(userName: $userName, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginObjectCopyWith<$Res> implements $LoginObjectCopyWith<$Res> {
  factory _$LoginObjectCopyWith(_LoginObject value, $Res Function(_LoginObject) _then) = __$LoginObjectCopyWithImpl;
@override @useResult
$Res call({
 String userName, String password
});




}
/// @nodoc
class __$LoginObjectCopyWithImpl<$Res>
    implements _$LoginObjectCopyWith<$Res> {
  __$LoginObjectCopyWithImpl(this._self, this._then);

  final _LoginObject _self;
  final $Res Function(_LoginObject) _then;

/// Create a copy of LoginObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? password = null,}) {
  return _then(_LoginObject(
null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RegisterObject {

 String get userName; String get countryCode; String get mobileNumber; String get email; String get password; String get profilePicture;
/// Create a copy of RegisterObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterObjectCopyWith<RegisterObject> get copyWith => _$RegisterObjectCopyWithImpl<RegisterObject>(this as RegisterObject, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterObject&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture));
}


@override
int get hashCode => Object.hash(runtimeType,userName,countryCode,mobileNumber,email,password,profilePicture);

@override
String toString() {
  return 'RegisterObject(userName: $userName, countryCode: $countryCode, mobileNumber: $mobileNumber, email: $email, password: $password, profilePicture: $profilePicture)';
}


}

/// @nodoc
abstract mixin class $RegisterObjectCopyWith<$Res>  {
  factory $RegisterObjectCopyWith(RegisterObject value, $Res Function(RegisterObject) _then) = _$RegisterObjectCopyWithImpl;
@useResult
$Res call({
 String userName, String countryCode, String mobileNumber, String email, String password, String profilePicture
});




}
/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._self, this._then);

  final RegisterObject _self;
  final $Res Function(RegisterObject) _then;

/// Create a copy of RegisterObject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? countryCode = null,Object? mobileNumber = null,Object? email = null,Object? password = null,Object? profilePicture = null,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,mobileNumber: null == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,profilePicture: null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterObject].
extension RegisterObjectPatterns on RegisterObject {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterObject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterObject() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterObject value)  $default,){
final _that = this;
switch (_that) {
case _RegisterObject():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterObject value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterObject() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userName,  String countryCode,  String mobileNumber,  String email,  String password,  String profilePicture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterObject() when $default != null:
return $default(_that.userName,_that.countryCode,_that.mobileNumber,_that.email,_that.password,_that.profilePicture);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userName,  String countryCode,  String mobileNumber,  String email,  String password,  String profilePicture)  $default,) {final _that = this;
switch (_that) {
case _RegisterObject():
return $default(_that.userName,_that.countryCode,_that.mobileNumber,_that.email,_that.password,_that.profilePicture);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userName,  String countryCode,  String mobileNumber,  String email,  String password,  String profilePicture)?  $default,) {final _that = this;
switch (_that) {
case _RegisterObject() when $default != null:
return $default(_that.userName,_that.countryCode,_that.mobileNumber,_that.email,_that.password,_that.profilePicture);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterObject implements RegisterObject {
  const _RegisterObject(this.userName, this.countryCode, this.mobileNumber, this.email, this.password, this.profilePicture);
  

@override final  String userName;
@override final  String countryCode;
@override final  String mobileNumber;
@override final  String email;
@override final  String password;
@override final  String profilePicture;

/// Create a copy of RegisterObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterObjectCopyWith<_RegisterObject> get copyWith => __$RegisterObjectCopyWithImpl<_RegisterObject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterObject&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture));
}


@override
int get hashCode => Object.hash(runtimeType,userName,countryCode,mobileNumber,email,password,profilePicture);

@override
String toString() {
  return 'RegisterObject(userName: $userName, countryCode: $countryCode, mobileNumber: $mobileNumber, email: $email, password: $password, profilePicture: $profilePicture)';
}


}

/// @nodoc
abstract mixin class _$RegisterObjectCopyWith<$Res> implements $RegisterObjectCopyWith<$Res> {
  factory _$RegisterObjectCopyWith(_RegisterObject value, $Res Function(_RegisterObject) _then) = __$RegisterObjectCopyWithImpl;
@override @useResult
$Res call({
 String userName, String countryCode, String mobileNumber, String email, String password, String profilePicture
});




}
/// @nodoc
class __$RegisterObjectCopyWithImpl<$Res>
    implements _$RegisterObjectCopyWith<$Res> {
  __$RegisterObjectCopyWithImpl(this._self, this._then);

  final _RegisterObject _self;
  final $Res Function(_RegisterObject) _then;

/// Create a copy of RegisterObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? countryCode = null,Object? mobileNumber = null,Object? email = null,Object? password = null,Object? profilePicture = null,}) {
  return _then(_RegisterObject(
null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,null == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String,null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
