class Staff {
  final String? id;
  final String name;
  final String address;
  final int phone;
  final String email;
  final String avt;

  Staff ({
    this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.avt
});
  Staff copyWith({
    String? id,
    String? name,
    String? address,
    int? phone,
    String? email,
    String? avt,
 }) 
 {return Staff (
  id: id ?? this.id,
  name: name ?? this.name,
  address: address ?? this.address,
  phone: phone ?? this.phone,
  email: email ?? this.email,
  avt: avt ?? this.avt
 );
 }
 }
