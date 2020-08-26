class Cambio {
  String nombreJugador;
  int numeroJugador;
  int votos;

  Cambio({this.nombreJugador, this.numeroJugador, this.votos});

  int get numero {
    return numeroJugador;
  }

  String get nombre {
    return nombreJugador;
  }

  int get cantVotos {
    return votos;
  }
}
