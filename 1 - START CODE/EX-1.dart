enum Skill { FLUTTER, DART, OTHER }

// - Q1 — Attributes: Complete. You have skills, address, and yearsOfExperience.
// - Q2 — Constructors: Complete. The named constructor automatically assigns Flutter and Dart skills.
// - Q3 — Encapsulation: Complete. Your fields are private, and getters provide access.
// - Q4 — Salary calculation: Complete. Your fold() method sums the skill bonuses, and your formula includes the base salary and experience bonus.
// map skills to their bonus values

const Map<Skill, double> skillBonus = {
  Skill.FLUTTER: 5000.0,
  Skill.DART: 3000.0,
  Skill.OTHER: 1000.0,
};
//Address class to represent an employee's address
class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  const Address(this._street, this._city, this._zipCode);

// Getters use for encapsulation, allowing read-only access to the private fields
  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString() {
    return 'Address: $_street, $_city, $_zipCode';
  }
}

// Employee class to represent an employee
class Employee {
  static const int yearBonus = 2000;

  final String _name;
  final double _baseSalary;
  final Address _address;
  final List<Skill> _skills;
  final int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._address,
    this._skills,
    this._yearsOfExperience,
  );

  // Named constructor: mobile developer gets FLUTTER and DART
  Employee.mobileDeveloper(
    String name,
    double baseSalary,
    Address address,
    int yearsOfExperience,
  ) : this(
          name,
          baseSalary,
          address,
          const [Skill.FLUTTER, Skill.DART],
          yearsOfExperience,
        );

  String get name => _name;
  double get baseSalary => _baseSalary;
  Address get address => _address;
  List<Skill> get skills => List.unmodifiable(_skills);
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double total = _baseSalary + _yearsOfExperience * yearBonus;
    for (final skill in _skills) {
      total += skillBonus[skill]!;
    }
    return total;
  }

  void printDetails() {
    print('Employee name: $_name, \n Base Salary: \$$_baseSalary');
    print(_address);
    print('Years of Experience: $_yearsOfExperience');
    print('Skills:');
    for (final skill in _skills) {
      print('  $skill: ${skillBonus[skill]}');
    }
    print('Total Salary: \$${computeSalary()}');
  }
}

void main() {
  var employee = Employee(
    'kimtech',
    50000.0,
    const Address('123 Main St', 'New York', '10001'),
    [Skill.FLUTTER, Skill.DART],
    5,
  );
  print('Employee Details:');
  employee.printDetails();

  var mobileDev = Employee.mobileDeveloper(
    'Sokea',
    40000.0,
    const Address('456 Elm St', 'Los Angeles', '90001'),
    3,
  );
  mobileDev.printDetails();
}