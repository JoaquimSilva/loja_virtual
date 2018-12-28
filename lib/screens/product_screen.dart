import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColors = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.titulo),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.imagem.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 3.0,
              //dotColor: Colors.primaryColor,
              dotBgColor: Colors.transparent,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
//                Text(
//                  product.titulo,
//                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
//                ),

                Text(
                  'Disponível: ' + product.disponivel,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: primaryColors),
                  maxLines: 2,
                ),

                Text('Genero: ' + product.genero,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: primaryColors),
                    maxLines: 2),
                Text(
                  'Descrição: ' + product.descricao,
                  style: TextStyle(
                      fontSize: 17.50,
                      fontWeight: FontWeight.normal,
                      color: Colors.blueGrey),
                ),
//                SingleChildScrollView(
//                  child: new Center(
//                    child: new HtmlView(
//                      data: product.html,
//                    ),
//                  ),
//                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
