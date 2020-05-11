class Products {
  List<Product> items = new List();
  Products();
  Products.fromJsonList(List<dynamic> jsonList){
    
    if( jsonList == null ) return;

    for(var item in jsonList){
      final producto = new Product.fromJsonMap(item);
      items.add(producto);
    }
  }
}

class Product{
  String image;
  String name;
  String description;
  String price;

  Product(this.image, this.name, this.description, this.price);

  Product.fromJsonMap(Map<String, dynamic> json){
    image          = 'assets/cat_pro.png';
    name           = json['nombre'];
    description    = json['descripcion'];
    price          = json['precio'];
  }
}