import 'package:flutter/material.dart';
import 'package:isabellaoliveira_rm83588/models/locais_model.dart';
import 'package:isabellaoliveira_rm83588/repository/locais_repository.dart';

class LocaisScreen extends StatefulWidget {
  @override
  _LocaisScreenState createState() => _LocaisScreenState();
}

class _LocaisScreenState extends State<LocaisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text("Turismo no Brasil",
        style: TextStyle(
          color : Colors.pink.shade50
        ),),
      ),
      body: FutureBuilder<List<LocaisModel>>(
        future: LocaisRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<LocaisModel> locais) {
    return ListView.builder(
      itemCount: locais == null ? 0 : locais.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardLocal(locais[index]);
      },
    );
  }

  Card cardLocal(LocaisModel local) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 7.0,
        vertical: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              Icons.location_city,
              color: Colors.white,
            ),
          ),
          title: Text(
            local.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      value: local.maisAmado,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0,bottom: 0),
                    
                      child:Icon(
                    Icons.cake,
                        color: Colors.pink.shade50,
                       )
                 ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Text(
                    local.aniversario,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              "/detalhes",
              arguments: local,
            );
          },
        ),
      ),
    );
  }
}
