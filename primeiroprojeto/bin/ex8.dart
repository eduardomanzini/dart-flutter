import 'dart:io';


void main(List<String> arguments) {
  print("Digite o primeiro valor inteiro: ");
  int valor1 = int.parse(stdin.readLineSync()!);

  print("Digite o segundo valor inteiro: ");
  int valor2 = int.parse(stdin.readLineSync()!);

  print("Digite o terceiro valor inteiro: ");
  int valor3 = int.parse(stdin.readLineSync()!);

  List<int> valores = [valor1, valor2, valor3];
  valores.sort((a, b) => b.compareTo(a));

  print("Valores em ordem decrescente: $valores");
}


