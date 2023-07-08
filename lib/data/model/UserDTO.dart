
import 'package:ecommerce/domain/model/User.dart';

class UserDTO {
  UserDTO({
      this.name, 
      this.email, 
      this.phone, 
      this.id,});

  UserDTO.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['_id'];
  }
  String? name;
  String? email;
  String? phone;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['_id'] = id;
    return map;
  }
  User toUserDTo(){
    return User(
      name: name,
      email: email,
      phone: phone,
      id: id
    );
  }
}