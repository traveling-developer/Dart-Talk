class Patient {
  var _firstName = "";
  String? lastName;
  late int age;
  dynamic anything;

  Patient(this._firstName);

  String get firstName {
    return _firstName;
  }

  set firstName(String name) {
    _firstName = name;
  }

  String fullName() {
    return "$_firstName $lastName";
  }

  factory Patient.dummyFactory() {
    return Patient('dummy');
  }
}

enum Insurance { privately, statutory }

List<Patient> createSomePatients() {
  return [
    Patient('Michael'),
    Patient('Peter'),
  ];
}

Set<String> fruits() {
  return {'apple', 'orange', 'banana'};
}

Map<int, String> cars() {
  return {1: 'BMW', 2: 'Audi', 3: 'Volkswagen'};
}

// Extension Methods
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}

int parseExample() {
  return '42'.parseInt();
}

// Cascades
Patient createNewPatient(String firstName, String lastName, int age) {
  var patient = Patient(firstName)
    ..lastName = lastName
    ..age = age
    ..anything = 'anything';

  return patient;
}

// enhanced enums since 2.17
enum Direction {
  north('N'),
  east('E'),
  south('S'),
  west('W');

  final String shortName;
  const Direction(this.shortName);

  @override
  String toString() => "Long name $name and short name $shortName";
  // e.g.: Long name north and short name N
}

// Mixins
mixin Address {
  String street = '';
  String houseNumber = '';
  String city = '';

  String get address {
    return '$street $houseNumber /n $city';
  }
}

class User with Address {
  String name = '';
}

void mixinExample() {
  var user = User();
  user.street = 'My Street';

  var fullAddress = user.address;
}

// Generators
Iterable<User> someUsers(int numberOfUsers) sync* {
  for (var i = 0; i < numberOfUsers; i++) {
    yield User();
  }
}
