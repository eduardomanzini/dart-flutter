import 'dart:io';


void main(List<String> arguments) {
  print("Digite o valor de A: ");
  double a = double.parse(stdin.readLineSync()!);

  print("Digite o valor de B: ");
  double b = double.parse(stdin.readLineSync()!);

  print("Digite o valor de C: ");
  double c = double.parse(stdin.readLineSync()!);

  double soma = a + b;

  print("A soma entre A e B é: $soma");
  if (soma < c) {
    print("A soma é menor que C.");
  } else {
    print("A soma não é menor que C.");
  }
}
