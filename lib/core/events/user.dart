import 'dart:convert';
import 'package:digipost/core/services/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class NexusUserProfile extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String _responseMessage = '';
  String get reponseMessage => _responseMessage;

  String _userId = '';
  String get userId => _userId;

  String _contactFirstName = '';
  String _contactLastName = '';
  String _contactTitle = '';
  String _addressLine1 = '';
  String _addressLine2 = '';
  String _city = '';
  final String _state = '';
  String _country = '';
  final String _zip = '';
  String _phone = '';
  String _email = '';
  String _cellPhone = '';

  String get contactFristName => _contactFirstName;
  String get contactLastName => _contactLastName;
  String get contactTitle => _contactTitle;
  String get addressLine1 => _addressLine1;
  String get addressLine2 => _addressLine2;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get zip => _zip;
  String get phone => _phone;
  String get email => _email;
  String get cellPhone => _cellPhone;

  void setContactTitle(String title) {
    _contactTitle = title;
  }

  void setContactFirstName(String firstName) {
    _contactFirstName = firstName;
  }

  void setContactLastName(String lastName) {
    _contactLastName = lastName;
  }

  void setPhone(String phone) {
    _phone = phone;
  }

  void setCellPhone(String cellPhone) {
    _cellPhone = cellPhone;
  }

  void setContactEmail(String email) {
    _email = email;
  }

  void setIsLoggedIn(bool loggedIn) {
    _isLoggedIn = loggedIn;
    _userId = '';
    _addressLine1 = '';
    _addressLine2 = '';
    _cellPhone = '';
    _city = '';
    _contactFirstName = '';
    _contactLastName = '';
    _contactTitle = '';
    _country = '';
    _email = '';
    _phone = '';
    notifyListeners();
  }

  Future<String> login(String username, String password) async {
    final apiService = ProfileService();
    final http.Response responseObj =
        await apiService.login(username, password);
    var responseMap = jsonDecode(responseObj.body.toString());
    if (responseObj.statusCode == 200) {
      _isLoggedIn = true;
      _responseMessage = 'Success';
      _userId = responseMap['_userId'].toString();
    } else {
      _isLoggedIn = false;
      _responseMessage = "Failed to login";
    }

    notifyListeners();
    return _responseMessage;
  }

  Future<String> forgotPassword(String email) async {
    Object body = jsonEncode({'email': email});
    final apiService = ProfileService();
    final http.Response responseObj = await apiService.forgotPassword(body);
    if (responseObj.statusCode == 200) {
      _responseMessage = 'Success';
    } else {
      _responseMessage = 'Failed to send email';
    }
    notifyListeners();
    return _responseMessage;
  }

  Future<String> createContact(String email, String password) async {
    Object body = jsonEncode({'email': email, 'password': password});
    final apiService = ProfileService();
    final http.Response responseObj = await apiService.createContact(body);
    if (responseObj.statusCode == 201) {
      _responseMessage = 'Success';
    } else {
      _responseMessage = 'Failed to create account';
    }
    notifyListeners();
    return _responseMessage;
  }
}
