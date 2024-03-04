import 'dart:io';


void main(List<String> arguments) {
  print("Digite o peso (em kg): ");
  double peso = double.parse(stdin.readLineSync()!);

  print("Digite a altura (em metros): ");
  double altura = double.parse(stdin.readLineSync()!);

  double imc = peso / (altura * altura);

  print("IMC: $imc");

  if (imc < 18.5) {
    print("Condição: Abaixo do peso");
  } else if (imc <= 24.9) {
    print("Condição: Peso ideal (parabéns)");
  } else if (imc <= 29.9) {
    print("Condição: Levemente acima do peso");
  } else if (imc <= 34.9) {
    print("Condição: Obesidade grau I");
  } else if (imc <= 39.9) {
    print("Condição: Obesidade grau II (severa)");
  } else {
    print("Condição: Obesidade grau III (mórbida)");
  }
}
