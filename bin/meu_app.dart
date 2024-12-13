void main() {
  Legumes mandioca1 = Legumes("Macaxeira", 4, "Marrom", true);
  Fruta uva1 = Fruta("Uva", 0.01, "Roxa", "Doce e meio citrica", 30);
  Alimento bife1 = Alimento("Bife", 1, "Vermlho");
  Nozes macadamia1 = Nozes("Macadâmia", 0.02, "Branco amarelado", "Doce", 30, 35);
  Citrica limao1 = Citrica("Limao", 0.4, "Verde", "Azeda", 30, 9);
  Fruta banana1 = Fruta("Banana", 0.01, "Amarela", "Doce", 30);

  mandioca1.cozinhar();
  limao1.fazerSuco();
  macadamia1.fazerMassa();
  banana1.fazerSuco();
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print("a $nome esta madura");
  } else {
    print("a $nome nao esta vazia");
  }

  if (cor != null) {
    print("A $nome é $cor.");
  }
}

int funcQuantosDiasMaduras(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("nome: $nome, peso: $peso, cor: $cor");
  }
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        "A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMadura para poder comer. ela está madura? $isMadura");
  }

  void fazerSuco() {
    print("Você fez um otimo suco de $nome");
  }

  @override
  void assar() {
    print("Seprar");
  }

  @override
  void fazerMassa() {
    print("Misturar a $nome com farinha e tudo mais");
  }

  @override
  void separarIngredientes() {
    print("Colocar pra assar");
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print("$nome esta cozinhando");
    } else {
      print("$nome não precisa cozinhar");
    }
  }

  @override
  void separarIngredientes() {
    // Ver c ta cozido ou cru
  }

  @override
  void fazerMassa() {
    // Fazer uma massa para o bolo
  }

  @override
  void assar() {
    // Colocar tempo para assar
  }
}

class Citrica extends Fruta {
  double nivelAzedo;

  Citrica(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print("Tem Refri");
    } else {
      print("Não tem Refri");
    }
  }
}

class Nozes extends Fruta {
  double porcentagemDeOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemDeOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print("Tirar a casca da $nome");
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();

  void fazerMassa();

  void assar();
}
