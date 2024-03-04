import 'dart:io';


void main(List<String> arguments) {
  print("Digite um valor: ");
  double valor = double.parse(stdin.readLineSync()!);

  double reajuste = valor * 0.05;
  double valorReajustado = valor + reajuste;

  print("O valor reajustado com 5% é: $valorReajustado");
}