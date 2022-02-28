import 'package:flutter/foundation.dart';
import 'package:mvc_imc_flutter/src/model/person_model.dart';

// Toda Lógica de negócio da view fica aqui

class ImcController extends ChangeNotifier {
  var result = 'result';
  var _weight = 0.0;
  var _height = 0.0;

  void setWeight(String text){
    _weight = double.parse(text);
  }

   void setHeight(String text){
    _height = double.parse(text);
  }

   calcImc() {
    final model = PersonModel(
      height: _height,
      weight: _weight,
    );
    var imc = model.getIMC();

    if (imc < 18) {
      result = 'Abaixo do peso';
    } else if (imc >= 18 && imc < 25) {
      result = 'Peso ideal';
    } else if (imc >= 25 && imc < 30) {
      result = 'Sobrepeso';
    } else if (imc >= 30 && imc < 35) {
      result = 'Obesidade Grau I';
    } else if (imc >= 35 && imc < 40) {
      result = 'Obesidade Grau II';
    } else if (imc >= 40) {
      result = 'Obesidade Grau III';
    }

    notifyListeners();
  }
}
