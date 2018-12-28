import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String categoria;
  String id;
  String genero;
  List imagem;
  String titulo;
  String disponivel;
  String descricao;
  String html;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    genero = snapshot.data['genero'];
    titulo = snapshot.data['titulo'];
    disponivel = snapshot.data['disponivel'];
    imagem = snapshot.data['imagem'];
    descricao = snapshot.data['descricao'];
    html = snapshot.data['html'];
  }
}
