class User{
  final String _email;
  final String _pass;

  User(this._email, this._pass, this._name, this._username, this._depart,
      this._branch, this._profilepic);

  final String _name;
  final String _username;
  final String _depart;
  final String _branch;
  final String _profilepic;
  Map<String ,dynamic> toMap(){
    return{
      "pass":this._pass,
      "email":this._email,
      "fullanme":this._name,
      "userID":this._username,
      "depart":this._depart,
      "brach":this._branch,
      "profilepic":this._profilepic,
  };
}
}



