import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/models/cart_models.dart';
import 'package:provider/provider.dart';

import '../components/grocerytile.dart';
import 'cartpage.dart';

class introPage extends StatelessWidget {
  const introPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
          return cartPage();
        })),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_cart),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Good Morning'),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("lets's order some fresh fruits",
                style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                ),),
            ),
            SizedBox(height: 12),
            Divider(thickness: 2),
            SizedBox(height: 12),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Fresh Items',style: TextStyle(
                fontSize: 16,
              ),),
            ),
            SizedBox(height: 12),

            Expanded(
                child: Consumer<cartModel>(builder: (context, value, child) =>
                    GridView.builder(
                      itemCount: value.shopitems.length,
                    padding: EdgeInsets.all(12.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.3),
                    itemBuilder: (context,index){
                    return groceryTile(
                      itemName: value.shopitems[index][0],
                      itemPrice: value.shopitems[index][1],
                      imagePath: value.shopitems[index][2],
                      color: value.shopitems[index][3],
                      onPressed: () {
                        Provider.of<cartModel>(context,listen: false).addItemToCart(index);
                      }
                  );
                }),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
