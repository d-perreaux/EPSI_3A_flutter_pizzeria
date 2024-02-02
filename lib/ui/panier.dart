import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

import '../models/cart.dart';

class Panier extends StatefulWidget {
  final Cart _cart;

  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  double PriceTotal = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(

      padding: const EdgeInsets.all(4.0),
        itemCount: widget._cart.totalItems(),
        itemBuilder: (context, index) {
          //PriceTotal += widget._cart.getCartItem(index).pizza.total.toDouble();
          return _buildItem(widget._cart.getCartItem(index));
        }
    )
          ),
          Row(
            children: [
              Text('Total'),
              Text(" : " + widget._cart.getPriceTotalPanier().toString() + " €"),
            ],
          ),
          Container(
            child: ElevatedButton(
              child: Text('Valider'),
              onPressed: () {
                print('Valider');
              },
            )
          )
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/pizzas/${cartItem.pizza.image}',
            fit: BoxFit.fitWidth,
            height: 120,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartItem.pizza.title,
                    style: PizzeriaStyle.subHeaderTextStyle,
                  ),
                  Text(
                    '${cartItem.pizza.total.toStringAsFixed(2)} €',
                  style: PizzeriaStyle.itemPriceTextStyle,),
                  Text(
                    'Sous-total',
                    style: PizzeriaStyle.subPriceTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
