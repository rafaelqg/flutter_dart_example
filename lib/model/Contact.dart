class Contact {
  String name="";
  String email="";

  //constructor
  Contact(String name, String email) {
    // Initialization code goes here.
    this.name=name;
    this.email=email;
  }

  // Method.
  void describe() {
    print('Contact: $name - $email');
  }
}