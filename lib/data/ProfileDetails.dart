class ProfileDetails{
  String name;
  String phone;
  String email;
  String practitionerId;
  String billingAddress;
  String profilePicUrl;

  ProfileDetails({
    required this.name,
    required this.phone,
    required this.email,
    required this.practitionerId,
    required this.billingAddress,
    required this.profilePicUrl,
  });

  // Convert to Map (for Firebase)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'practitionerId': practitionerId,
      'billingAddress': billingAddress,
      'profilePicUrl': profilePicUrl,
    };
  }

  // Create from Firebase snapshot
  factory ProfileDetails.fromMap(Map<dynamic, dynamic> map) {
    return ProfileDetails(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      practitionerId: map['practitionerId'] ?? '',
      billingAddress: map['billingAddress'] ?? '',
      profilePicUrl: map['profilePicUrl'] ?? '',
    );
  }
}
