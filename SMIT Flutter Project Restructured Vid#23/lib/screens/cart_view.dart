import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  final List Items;
  const CartView({super.key, required this.Items});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),
      ),
      body: widget.Items.isEmpty ? const Center(child: Text("Empty Cart",style: TextStyle(fontSize: 20),)) :
      ListView.builder(
        itemCount: widget.Items.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(bottom: 5),
            child: ListTile(
            tileColor: Colors.grey,
            title: Text("${widget.Items[index]["name"]}",), 
               // >> two methods to repesent price, this works same as with name
            subtitle: Text(widget.Items[index]["price"].toString()),
            // subtitle: Text("${widget.Items[index]["price"]}"),
            trailing:IconButton(onPressed: (){
              setState(() {
                widget.Items.removeAt(index);
              });
            }, icon: Icon(Icons.delete))
            ),
          );
          }),
  
    );
  }
}