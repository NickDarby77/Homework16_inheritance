// HomeWork - extends - Inheritance

import 'dart:math';

void main() {
  Manager marat = Manager(bonus: 40, name: 'Marat', salary: 260);
  Manager muha = Manager(bonus: 45, name: 'Muha', salary: 275);
  Developer samat =
      Developer(programmingLanguage: 'Dart', name: 'Samat', salary: 350);
  Developer talgat =
      Developer(programmingLanguage: 'Go', name: 'Talgat', salary: 400);

  List<Employee> employees = [marat, samat, muha, talgat];
  Employee.getTotalSalary(employees);
  print('--------');
  // Rectangle one = Rectangle(length: 5, width: 6);
  // Circle two = Circle(radius: 5);

  List<Shape> shapes = [
    Rectangle(length: 5, width: 6),
    Circle(radius: 5),
    Rectangle(length: 6, width: 7),
    Circle(radius: 6),
  ];
  Shape.getTotalArea(shapes);
  print('--------');
  SavingsAccount a = SavingsAccount(20, 'USD', 500);
  CheckingAccount b = CheckingAccount(600, 'SOM', 650);

  List<BankAccount> bankaccounts = [a, b];
  print(BankAccount.getTotalBalance(bankaccounts));
}

// 1st question
abstract class Employee {
  String name;
  double salary;
  Employee({required this.name, required this.salary});

  double getSalary() {
    return salary;
  }

  static getTotalSalary(List<Employee> employees) {
    double sum = 0;
    for (int i = 0; i < employees.length; i++) {
      sum += employees[i].getSalary();
    }
    print(sum);
  }
}

class Manager extends Employee {
  double bonus;
  Manager({required this.bonus, required super.name, required super.salary});

  @override
  double getSalary() {
    return salary + bonus;
  }
}

class Developer extends Employee {
  String programmingLanguage;
  Developer(
      {required this.programmingLanguage,
      required super.name,
      required super.salary});
}

// 2nd question
abstract class Shape {
  double calculateArea();

  static getTotalArea(List<Shape> shapes) {
    double sum = 0;
    for (int i = 0; i < shapes.length; i++) {
      sum = sum + shapes[i].calculateArea();
    }
    print(sum);
  }
}

class Rectangle extends Shape {
  double length;
  double width;
  Rectangle({required this.length, required this.width});

  @override
  double calculateArea() {
    return length * width;
  }
}

class Circle extends Shape {
  double radius;
  // double pi = 3.14;
  Circle({required this.radius});

  @override
  double calculateArea() {
    return pi * (radius * radius); // (A = π r²),  3.14 = π
  }
}

// 3rd question
abstract class BankAccount {
  String accountNumber;
  double balance;
  BankAccount(this.accountNumber, this.balance);

  double deposit(double amount) {
    return balance += amount;
  }

  withdraw(double amount) {
    if (amount <= balance) {
      return balance -= amount;
    } else {
      return "Insufficient funds";
    }
  }

  getBalance() {}

  static double getTotalBalance(List<BankAccount> accounts) {
    double totalBalance = 0.0;
    for (int i = 0; i < accounts.length; i++) {
      totalBalance += accounts[i].getBalance();
    }
    return totalBalance;
  }
}

class SavingsAccount extends BankAccount {
  double interestRate;
  SavingsAccount(this.interestRate, super.accountNumber, super.balance);

  @override
  getBalance() {
    return balance + (balance * interestRate / 100);
  }
}

class CheckingAccount extends BankAccount {
  double overdraftLimit;
  CheckingAccount(this.overdraftLimit, super.accountNumber, super.balance);

  @override
  getBalance() {
    return balance;
  }

  @override
  withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      return balance -= amount;
    } else {
      return "Insufficient funds";
    }
  }
}
