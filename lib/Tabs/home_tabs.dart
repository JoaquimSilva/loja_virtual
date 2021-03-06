import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override

  /*
  Autor: Rafael JS
  O bloco de código abaixo, trata-se das cores degradê da tela inicial, lembrando que as cores estão em ARBG
  Caso seja necessário, pode usar o site https://www.cssmatic.com/gradient-generator para gerar as cores.
   */

  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(250, 73, 155, 234), Colors.redAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        );

    /*
    fim do bloco de cores
     */

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Change Games'),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
                future: Firestore.instance
                    .collection('home')
                    .orderBy("pos")
                    .getDocuments(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return SliverToBoxAdapter(
                      child: Container(
                        height: 200.00,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  else {
                    return SliverStaggeredGrid.count(
                      /*
                      O campo "crossAxisCount" faz a criação de blocos no aplicativo, os blocos montados são em posição vertical
                       */
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      staggeredTiles: snapshot.data.documents.map((doc) {
                        return StaggeredTile.count(
                            doc.data['x'], doc.data['y']);
                      }).toList(),
                      children: snapshot.data.documents.map((doc) {
                        return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: doc.data['imagem'],
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                    );
                  }
                })
          ],
        )
      ],
    );
  }
}
