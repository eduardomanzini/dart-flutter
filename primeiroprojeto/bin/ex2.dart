import 'dart:io';


void main(List<String> arguments) {
  print("Digite um número: ");
  double numero = double.parse(stdin.readLineSync()!);

  if (numero % 2 == 0) {
    print("O número é par.");
  } else {
    print("O número é ímpar.");
  }

  if (numero >= 0) {
    print("O número é positivo.");
  } else {
    print("O número é negativo.");
  }
}
