class Employee {};
class Intern extends Employee {};

// Employee and its subclass can be passed in
function f(classname<Employee> $clsname): void {
    // At runtime, $clsname will be converted to string literal. 
    // Employee::class will be converted to 'Employee'
    new $clsname();
}

<<__EntryPoint>>
function main(): void {
    f(Employee::class);
    f(Intern::class);
}