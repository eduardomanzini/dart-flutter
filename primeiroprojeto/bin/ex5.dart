import 'dart:io';


void main(List<String> arguments) {
   const salarioMinimo = 1412;

  print("Digite o salário do usuário: ");
  double salarioUsuario = double.parse(stdin.readLineSync()!);

  double salariosMinimos = salarioUsuario / salarioMinimo;

  print("O usuário ganha $salariosMinimos salários mínimos.");
}
