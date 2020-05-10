import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/widgets/common/my_appbar.dart';
import 'package:project_ecommerce/widgets/common/search_bar.dart';
import 'package:project_ecommerce/widgets/home/categories_list.dart';
import 'package:project_ecommerce/widgets/home/product_list.dart';


class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TabController tabController;
  TabController bottomTabController;
  List<Product> products = [
    Product(
        'assets/cat_pro.png',
        'Gatos',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
        102.99, 
        ['Categoría 1','Cat 2']
        ),
    Product(
        'assets/dog_food.png',
        'Comida para perro',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
        55.99, ['Categoría 1','Cat 2']),
  ];
  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
        child: Column(
      children: <Widget>[
        MyAppBar(),
        SearchBar(),
        Expanded(child:
          SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text('Productos populares', style: TextStyle(fontSize: 25),),
                  padding: EdgeInsets.only(left:10, top: 10, bottom: 20),
                )
              ),
              
              ProductList(
                products: products,
              ),
              SizedBox(height: 20,),
              CategoryList()
            ],
          ),
        )
        )
        
      ],
    ));
  }
}
