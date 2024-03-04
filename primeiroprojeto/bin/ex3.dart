import 'dart:io';


void main(List<String> arguments) {
  print("Digite um número inteiro: ");
  int numero = int.parse(stdin.readLineSync()!);

  int antecessor = numero - 1;
  int sucessor = numero + 1;

  print("Antecessor: $antecessor");
  print("Sucessor: $sucessor");
}
