class HairModel {
  String? color;
  String? type;

  HairModel({this.color, this.type});

  factory HairModel.fromJson(Map<String, dynamic> json) {
    return HairModel(color: json['color'], type: json['type']);
  }
}

class AddressModel {
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  CoordinatesModel? coordinates;

  AddressModel(
      {this.address,
        this.city,
        this.state,
        this.stateCode,
        this.postalCode,
        this.coordinates});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json['address'],
      city: json['city'],
      state: json['state'],
      stateCode: json['stateCode'],
      postalCode: json['postalCode'],
      coordinates: CoordinatesModel.fromJson(json['coordinates']),
    );
  }
}

class CoordinatesModel {
  num? lat;
  num? lng;

  CoordinatesModel({this.lat, this.lng});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(lat: json['lat'], lng: json['lng']);
  }
}

class BankModel {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  BankModel(
      {this.cardExpire,
        this.cardNumber,
        this.cardType,
        this.currency,
        this.iban});

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      cardExpire: json['cardExpire'],
      cardNumber: json['cardNumber'],
      cardType: json['cardType'],
      currency: json['currency'],
      iban: json['iban'],
    );
  }
}

class CompanyModel {
  String? department;
  String? name;
  String? title;

  CompanyModel({this.department, this.name, this.title});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      department: json['department'],
      name: json['name'],
      title: json['title'],
    );
  }
}

class CryptoModel {
  String? coin;
  String? network;
  String? wallet;

  CryptoModel({this.coin, this.network, this.wallet});

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      coin: json['coin'],
      wallet: json['wallet'],
      network: json['network'],
    );
  }
}

class UserModel {
  AddressModel? address;
  int? age;
  BankModel? bank;
  String? date;
  String? bloodGroup;
  CryptoModel? crypto;
  String? ein;
  String? email;
  String? eyeColor;
  String? firstName;
  String? gender;
  HairModel? hair;
  num? height;
  int? id;
  String? image;
  String? ip;
  String? lastName;
  String? macAddress;
  String? maidenName;
  String? password;
  String? phone;
  String? role;
  String? ssn;
  String? university;
  String? userAgent;
  String? username;
  num? weight;

  UserModel(
      {this.address,
        this.age,
        this.bank,
        this.date,
        this.bloodGroup,
        this.crypto,
        this.ein,
        this.email,
        this.eyeColor,
        this.firstName,
        this.gender,
        this.hair,
        this.height,
        this.id,
        this.image,
        this.ip,
        this.lastName,
        this.macAddress,
        this.maidenName,
        this.password,
        this.phone,
        this.role,
        this.ssn,
        this.university,
        this.userAgent,
        this.username,
        this.weight});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        address: AddressModel.fromJson(json['address']),
        age: json['age'],
        bank: BankModel.fromJson(json['bank']),
        date: json['date'],
        bloodGroup: json['bloodGroup'],
        crypto: CryptoModel.fromJson(json['crypto']),
        ein: json['ein'],
        email: json['email'],
        eyeColor: json['eyeColor'],
        firstName: json['firstName'],
        gender: json['gender'],
        hair: HairModel.fromJson(json['hair']),
        height: json['height'],
        id: json['id'],
        image: json['image'],
        ip: json['ip'],
        lastName: json['lastName'],
        macAddress: json['macAddress'],
        maidenName: json['maidenName'],
        password: json['password'],
        phone: json['phone'],
        role: json['role'],
        ssn: json['ssn'],
        university: json['university'],
        userAgent: json['userAgent'],
        username: json['username'],
        weight: json['weight']);
  }
}

class UserDataModel {
  num? limit;
  num? skip;
  num? total;
  List<UserModel>? users;

  UserDataModel({this.limit, this.skip, this.total, this.users});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    List<UserModel> mUsers = [];
    for (var eachUser in json['users']) {
      mUsers.add(UserModel.fromJson(eachUser));
    }
    return UserDataModel(
      limit: json['limit'],
      skip: json['skip'],
      total: json['total'],
      users: mUsers,
    );
  }
}
