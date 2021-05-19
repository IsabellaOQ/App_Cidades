import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isabellaoliveira_rm83588/models/locais_model.dart';


// ignore: must_be_immutable
class Detalhes extends StatelessWidget {
  LocaisModel locaisModel;

  @override
  Widget build(BuildContext context) {
    locaisModel = ModalRoute.of(context).settings.arguments;

    final maisAmadoIndicator = Container(
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey.shade700,
            value: locaisModel.maisAmado,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ),
    );

    final estrelasCidade = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: new RichText(
          text: new TextSpan(children: [
            TextSpan(
                text: locaisModel.estrelas.toString(),
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                )
                ),
            WidgetSpan(
              child:
                  new Icon(Icons.star_rounded, color: Colors.yellow.shade700),
            ),
          ]),
        ),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        Icon(
          Icons.location_city,
          color: Colors.white,
          size: 45.0,
        ),
        
        SizedBox(height: 10.0),
        Container(
          child: Text(
            locaisModel.nome,
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 45.0,
            ),
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              borderRadius: BorderRadius.circular(15)),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: maisAmadoIndicator,
            ),
            Expanded(
                flex: 5,
                child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: new RichText(
                text: new TextSpan(children: [
           
            WidgetSpan(
                child:
                    new Icon(Icons.cake_rounded, color: Colors.yellow.shade700),
                  ),
                TextSpan(
                    text: locaisModel.aniversario,
                    style: TextStyle(color: Colors.grey.shade900,  
                      fontSize: 15.0,
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                    )
                    ),
                  ]),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: estrelasCidade,
            ),
          ],
        ),
      ],
    );

    String back = locaisModel.back;

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("$back"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .0)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.grey.shade900,
            ),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      locaisModel.historia,
      style: TextStyle(fontSize: 18.0),
      textAlign: TextAlign.justify,
    );

    

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
            
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent,
          bottomContent,
        ],
      ),
    );
  }
}
