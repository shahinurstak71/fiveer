class Contact{
  int id;
  String name;
  String phone;
  String email;
  String address;
  String description;


  Contact({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.description
  });


  int get contact_id=>id;

  String get contact_name=>name;

  String get contact_phone=>phone;

  String get contact_email=>email;

  String get contact_address=>address;

  String get contact_description=>description;

  factory Contact.fromJson(Map<String, dynamic>data) =>new Contact(

    id: data['id'],
    name: data['name'],
    phone: data['phone'],
    email: data['email'],
    address: data['address'],
    description: data['description'],

  );

  Map<String, dynamic>toJson()=>
      {
        'id':id,
        'name':name,
        'phone':phone,
        'email':email,
        'address':address,
        'description':description,

      };

}