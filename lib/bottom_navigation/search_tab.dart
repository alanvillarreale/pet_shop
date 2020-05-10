import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/pages/view_product_page.dart';
import 'package:project_ecommerce/widgets/common/search_bar.dart';
import 'package:project_ecommerce/widgets/shopping_cart_icon.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Column(
        children: <Widget>[
          _appBar(),
          SearchBar(),
          //_categoryList(),

          _productList(context),
        ],
      )),
    );
  }
}

Widget _productList(context) {
  List<Product> products = [
    Product(
        'assets/cat_pro.png',
        'Gatos',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
        102.99,['','']),
    Product(
        'assets/dog_food.png',
        'Comida para perro',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
        55.99,['','']),
  ];
  return Expanded(
      child: GridView.count(
    crossAxisCount: 2,
//    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 10.0,
    children: List<Widget>.generate(products.length, (index) {
      return GridTile(child: _productoCard(products[index], context));
    }),
  ));
}

Widget _productoCard(Product product, context) {
  return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ViewProductPage(
                product: product,
              ))),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            elevation: 5,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Image.asset(
                          product.image,
                          fit: BoxFit.fill,
                          width: 150,
                          height: 150,
                        ),),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Text(('Hola'),
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 25,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1),
                    child: Text('\$ ${product.price}',
                        style: TextStyle(
                            color: (Color(0xFF0dc2cd)),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            )),
      ));
}

Widget _categoryList() {
  return Container(
    width: double.infinity,
    height: 120,
    padding: EdgeInsets.all(15),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (_, index) {
        return Card(
          elevation: 2.0,
          child: new Container(
            width: 150,
            alignment: Alignment.center,
            child: new Text('categoría $index'),
          ),
        );
      },
    ),
  );
}

Widget _appBar() {
  return Container(
    padding: EdgeInsets.only(top: 20, bottom: 20),
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Busca productos',
              style: TextStyle(fontSize: 20),
            )),
        Spacer(),
        ShoppingCartIcon()
      ],
    ),
  );
}
