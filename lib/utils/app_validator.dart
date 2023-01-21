extension StringValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  Map<String, dynamic> isValidPassword() {
    if (isEmpty) {
      return {'isValid': false, 'message': 'Please provide a password'};
    }
    if (contains(' ')) {
      return {
        'isValid': false,
        'message': 'Password should not contain any space'
      };
    }
    //if(this.length<6) return {'isValid':false,'message':'Password must be minimum 6 characters long'};

    return {'isValid': true, 'message': ''};
  }
}