import 'dart:ffi';

import 'package:flutter/material.dart';

class Product {

const Product({required this.name});

final String name;
}
typedef RetornoLista = Function(Product product,bool inCart);

class ListaCompras extends StatelessWidget{
  ListaCompras({
    required this.product,
    required this.inCart,
    required this.onCartChange,
  }) :super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final RetornoLista onCartChange;

  Color _getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;  
    
  }

  TextStyle? _getTextStyle(BuildContext context){
    if (!inCart){
      return const TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onCartChange(product, inCart);
      },
      leading: CircleAvatar(backgroundColor: _getColor(context),
      child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context),),
    );
  }
}
class ShoppingList extends StatefulWidget{
  const ShoppingList({required this.products, super.key});


  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}