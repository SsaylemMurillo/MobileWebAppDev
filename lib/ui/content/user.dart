// This class is the base class for the users, containing a name, an Email
// and a Password

class User {
  String name;
  String email;
  String password;

  User(this.name, this.email, this.password);

  User.withoutName(String email, String password) : this("", email, password);
}
