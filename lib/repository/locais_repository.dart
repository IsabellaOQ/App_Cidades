
import 'package:isabellaoliveira_rm83588/models/locais_model.dart';

import 'database.dart';

// ignore: camel_case_types
class LocaisRepository {
  Future<List<LocaisModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    // ignore: deprecated_member_use
    List<LocaisModel> locais = new List<LocaisModel>();

    if (db.created) {
      // ignore: deprecated_member_use
      locais = new List<LocaisModel>();
      locais.add(
        new LocaisModel(
            id: 1,
            nome: 'São Paulo, SP',
            aniversario: '25 de Janeiro',
            maisAmado: 1.0,
            estrelas: 5,
            historia:
                'São Paulo, está entre as cidades mais populosas do mundo, com diversas instituições culturais e uma rica tradição arquitetônica. Ao pensar em São Paulo como um destino turístico, muita gente associa a cidade aos negócios. No entanto, a capital paulista oferece muito mais do que centros para convenções, reuniões ou congressos.',
            back: 'saopaulo.jpeg',
        ),
            
      );
      locais.add(
        LocaisModel(
            id: 2,
            nome: 'Salvador, BA',
            aniversario: '29 de Março',
            maisAmado: 0.7,
            estrelas: 4,
            historia:
                'A começar pelas misturas culturais, seja do simpático povo soteropolitano ou da música animada, além da culinária com fortes raízes africanas, pode já ir se preparando para fazer as reservas em um dos hotéis baratos em Salvador.A brincadeira fica ainda mais divertida quando o assunto são os mais de 50 quilômetros de praias.',
            back: 'salvador.jpg',
        ),
      );
      locais.add(
        LocaisModel(
            id: 3,
            nome: 'Gramado, RS',
            aniversario: '15 de Dezembro',
            maisAmado: 0.6,
            estrelas: 3,
            historia:
                'O contraste cultural das origens europeias com a referência dos costumes dos gaúchos é uma particularidade mais do que exclusiva, inclusive facilmente notado em qualquer hotel em Gramado. O coração da Serra Gaúcha, tem os cenários encantadores e um povo muito hospitaleiro, com o clima diferenciado.',
            back: 'gramado.jpg',
        ),
      );
      locais.add(
        LocaisModel(
            id: 4,
            nome: 'Niterói, RJ',
            aniversario: '22 de Novembro',
            maisAmado: 0.5,
            estrelas: 3,
            historia:
                'Niterói é uma cidade incrível que todos os anos atrai milhares de turistas em razão de suas diversas atrações naturais, culturais e arquitetônicas. Se você planeja conhecer Niterói, saiba que para chegar à cidade basta fazer a travessia de carro pela ponte Rio-Niterói ou então utilizar as barcas em direção a Praça Arariboia.',
            back: 'niteroi.png',
        ),
          
      );
       locais.add(
        LocaisModel(
            id: 4,
            nome: 'Holambra, SP',
            aniversario: '27 de Outubro',
            maisAmado: 0.4,
            estrelas: 2,
            historia:
                'As fazendas de cultivo de tulipas, rosas e crisântemos de Holambra formam uma explosão de cores, principalmente na primavera. A única estância turística da Região Metropolitana de Campinas é caracterizada como um pedacinho da Holanda no Brasil que, orgulhosamente, mantém as tradições trazidas pelos colonos.',
            back: 'holambra.jpg',
        ),
      );
    }

    return new Future.value(locais);
  }
}
