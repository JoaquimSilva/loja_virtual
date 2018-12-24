import 'package:loja_virtual/datas/product_data.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData product;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: type == 'gride'
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(product.imagem[0], fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            product.titulo,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Disponível: ' + product.disponivel,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Image.network(
                      product.imagem[0],
                      fit: BoxFit.cover,
                      height: 250.0,
                    ),
                  ),
//                  Flexible(
//                    flex: 1,
//                    child: Container(
//                      padding: EdgeInsets.all(8.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
////                          Text(
////                            product.titulo,
////                            style: TextStyle(fontWeight: FontWeight.w500),
////                          ),
////                          Text(
////                            'Disponível: ' + product.disponivel,
////                            style: TextStyle(
////                                color: Theme.of(context).primaryColor),
////                          ),
//                        ],
//                      ),
//                    ),
//                  ),
                ],
              ),
      ),
    );
  }
}
