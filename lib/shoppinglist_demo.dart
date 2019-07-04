import 'package:flutter/material.dart';

// created by jerryzhu

// time : 2019/7/4

class Product{

  final String name;
  const Product({this.name});

}
typedef void CartChangedCallBack(Product product,bool inCart);

class ShoppingListItem extends StatelessWidget{

  final Product product;
  final bool inCart;
  final CartChangedCallBack onCartChanged;

  ShoppingListItem({Product product, this.inCart, this.onCartChanged}): product = product, super(key: new ObjectKey(product));


  Color _getColor(BuildContext context) {

    return inCart ? Colors.black12 : Theme.of(context).primaryColor;
    
  }

  TextStyle _getTextStyle(BuildContext context) {
    if(!inCart){
      return null;
    }

    return new TextStyle(
      color: Colors.black12,
      decoration: TextDecoration.lineThrough

    );

  }
  
  @override
  Widget build(BuildContext context) {

    return new ListTile(

      onTap: (){
        onCartChanged(product,!inCart);
      },
      leading: new CircleAvatar(

        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),

      title:  new Text(product.name,style: _getTextStyle(context)),

    );
  }



  
}

class ShoppingList extends StatefulWidget{

  final List<Product> products;

  ShoppingList({Key key,this.products}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList>{

  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product,bool inCart){

    setState(() {
      if(inCart){
        _shoppingCart.add(product);
      }else{
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(

        title: new Text("Shooping demo"),
      ),

      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),

        children: widget.products.map((Product product){

          return new ShoppingListItem(
            product : product,
            inCart : _shoppingCart.contains(product),
            onCartChanged : _handleCartChanged


          );


        }).toList(),

      ),

    );
  }

}





void main(){

  runApp(new MaterialApp(

    title: "shopping demo",

    home: new ShoppingList(
      products:<Product>[
        new Product(name:"apple"),
        new Product(name:"huawei"),
        new Product(name:"xiaomi"),
        new Product(name:"oppo"),

      ]

    ),

   )
  );
}

