import 'package:dart_talk/patient.dart';
import 'package:test/test.dart';

void main() {
  test('Patient constructor initialize first name', () {
    final firstName = 'Peter';

    var patient = Patient(firstName);

    expect(patient.firstName, equals(firstName));
  });

  test('createSomePatients creates two patients', () {
    var patients = createSomePatients();

    expect(patients.length, equals(2));
  });
}
