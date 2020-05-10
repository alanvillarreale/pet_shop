import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/widgets/product/more_products.dart';
import 'package:project_ecommerce/widgets/product/product_options.dart';
import 'package:project_ecommerce/widgets/shopping_cart_icon.dart';

class ViewProductPage extends StatefulWidget {
  final Product product;

  ViewProductPage({Key key, this.product}) : super(key: key);

  @override
  _ViewProductPageState createState() => _ViewProductPageState(product);
}

class _ViewProductPageState extends State<ViewProductPage> {
  final Product product;

  _ViewProductPageState(this.product);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int active;

  @override
  Widget build(BuildContext context) {
    
    Widget description = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        product.description,
        maxLines: 5,
        semanticsLabel: '...',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black),
      ),
    );

    return Scaffold(
        //key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkGrey),
          actions: <Widget>[
            ShoppingCartIcon()
          ],
          title: Text(
            product.name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                fontSize: 18.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                ProductOption(
                  _scaffoldKey,
                  product: product,
                ),

                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Marca: Marca 1', style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),),
                  ),
                ),
                description,
                MoreProducts(),
                // Container(
                //   padding: EdgeInsets.only(left:30),
                //     height: MediaQuery.of(context).size.height / 5,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.stretch,
                //       children:
                //           List.generate(5 , (index) {
                //         return Expanded(
                          
                //           child: Text('Característica $index',style: TextStyle(fontSize: 15),),
                          
                //         );
                //       }),
                //     )),
              ],
            ),
          ),
        ));
  }

  
}
