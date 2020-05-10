
import 'package:flutter/material.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/pages/check_out_page.dart';

import 'shop_bottomSheet.dart';

class ProductOption extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Product product;
  const ProductOption(this.scaffoldKey, {Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     void _showMyBottomSheet(){
    // the context of the bottomSheet will be this widget
    //the context here is where you want to showthe bottom sheet
    showBottomSheet(context: context,
        builder: (BuildContext context){ 
          return ShopBottomSheet(); // returns your BottomSheet widget
        }
    );
  }
    print(product.image);
    return SizedBox(
      height: 200,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 16.0,
            child: Hero(
              tag: product.image,
              child: Image.asset(
              product.image,
              height: 200,
              width: 200,
            ),
            )
            

          ),
          Positioned(
            right: 0.0,
            child: Container(
              height: 180,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text('\$${product.price ?? 0.0}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: shadow)),
                  ),
                  InkWell(
                    
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: transparentPink,
                          
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'Comprar ahora',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showMyBottomSheet();

                    },
                    // onTap: () async {
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CheckOutPage()));

                    // },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: transparentPink,
                        
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'Agregar al carrito',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                      
                    
                    
                    
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    
}
  }
  

