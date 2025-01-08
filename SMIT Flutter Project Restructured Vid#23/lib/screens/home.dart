import 'package:flutter/material.dart';
import 'package:learningpurpose/data/product_List.dart';
import 'package:learningpurpose/screens/cart_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// Cart Items added in cartItems List When you clicked on Plus + icon
  List cartItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar of the App
      appBar:AppBar(
        title: const Text("My Learning Purpose App"),
      actions: [Text(cartItems.length.toString(),style: TextStyle(fontSize: 30))],
      ),
      body: ListView.builder(
        itemCount: productData.length,
        itemBuilder: (context,index){
        return Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: ListTile(
            tileColor: Colors.grey,
          title: Text(productData[index]["name"]),
          subtitle: Text(productData[index]["price"].toString()),
          trailing: Column(
            children: [
              IconButton(
              onPressed: (){
              setState(() {
              cartItems.add(productData[index]);
              });
              },
              icon: const Icon(Icons.add)),
            ],
          ),
          ),
        );
        },
      ), 


// Use Asyncronous function to rebuit a status of cart item  //ISSUE RESOLVED !
      floatingActionButton:FloatingActionButton(onPressed:() async{
      await Navigator.push(context, MaterialPageRoute(
        builder: (context) => CartView(Items: cartItems,)));
      // print("Hello World");
      // when you push back to the home refresh the home screen and its state as well cart counter
      setState(() {
        
      });
      },
      child: const Icon(Icons.store),),
    );
  }
}