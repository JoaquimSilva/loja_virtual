import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/Tiles/product_tile.dart';
import 'package:loja_virtual/datas/product_data.dart';

class CategoriaScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoriaScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data['title']),
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(icon: Icon(Icons.view_list))
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection('plataforma')
                  .document(snapshot.documentID)
                  .collection('capas')
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                          padding: EdgeInsets.all(4.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4.0,
                                  crossAxisSpacing: 4.0,
                                  childAspectRatio: 0.65),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return ProductTile(
                                'gride',
                                ProductData.fromDocument(
                                    snapshot.data.documents[index]));
                          },
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(4.0),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return ProductTile(
                                'list',
                                ProductData.fromDocument(
                                    snapshot.data.documents[index]));
                          },
                        )
                      ]);
              })),
    );
  }
}
