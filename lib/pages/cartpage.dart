import 'package:flutter/material.dart';
import 'package:grocery_store/models/cart_models.dart';
import 'package:provider/provider.dart';

class cartPage extends StatelessWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Consumer<cartModel>(builder: (context,value,child){
        return Column(
          children: [
            Expanded(child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: value.cartItems.length,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200]
                  ),
                  child: ListTile(
                    leading: Image.asset(value.cartItems[index][2],height: 36),
                    title: Text(value.cartItems[index][0]),
                    subtitle: Text('\$'+value.cartItems[index][1]),
                    trailing: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () => Provider.of<cartModel>(context,listen: false).removeItemFromCart(index)
                    )
                  ),
                ),
              );
            })),

            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Price",style: TextStyle(color: Colors.green[100]),),
                        SizedBox(height: 4.0),
                        Text(value.calculateTotal(),style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.red[600],
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Row(
                        children: [
                          Text('Pay Now',style: TextStyle(
                              color: Colors.white
                          ),),
                          Icon(Icons.arrow_forward_ios,size: 16,color: Colors.white),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
