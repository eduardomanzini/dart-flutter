import 'dart:io';


void main(List<String> arguments) {
  print("Digite o primeiro valor booleano (true/false): ");
  bool valor1 = bool.parse(stdin.readLineSync()!);

  print("Digite o segundo valor booleano (true/false): ");
  bool valor2 = bool.parse(stdin.readLineSync()!);

  if (valor1 && valor2) {
    print("Ambos são VERDADEIRO.");
  } else {
    print("Pelo menos um é FALSO.");
  }
}
