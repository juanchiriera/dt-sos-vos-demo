import 'package:dtPanel/model/cambio.dart';
import 'package:flutter/material.dart';

class CambiosPage extends StatefulWidget {
  @override
  _CambiosPageState createState() => _CambiosPageState();
}

class _CambiosPageState extends State<CambiosPage> {
  @override
  Widget build(BuildContext context) {
    List<Cambio> cambios = _initCambiosList();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Text("DT en vivo - Cambios Sugeridos")),
          Container(
            child: Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: cambios == null ? 0 : cambios.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _cambioItemView(
                          nombre: cambios[index].nombre,
                          numero: cambios[index].numero,
                          votos: cambios[index].votos)),
            ),
          )
        ],
      ),
    );
  }

  List<Cambio> _initCambiosList() {
    List<Cambio> cambios = new List();
    for (var i = 0; i < 3; i++) {
      cambios.add(new Cambio(
          nombreJugador: "Jugador ${i + 1}",
          numeroJugador: i + 1,
          votos: i * 10));
    }
    return cambios;
  }

  Widget _cambioItemView({String nombre, int numero, int votos}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: ListTile(
          title: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(flex: 4, child: Text(nombre)),
                Expanded(flex: 2, child: Text(numero.toString())),
                Expanded(flex: 2, child: Text(votos.toString()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
