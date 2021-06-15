import 'package:flutter/material.dart';
import 'package:punjabi/Fetchmenu.dart';
import 'package:punjabi/contactus.dart';
import 'package:punjabi/Table_book.dart';
import 'package:punjabi/signup.dart';
import 'package:punjabi/sublist.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
     const List<Widget> _widgetOptions = <Widget>[
      Text('Home', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('Cart', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),

    ];
    void _onItemTapped(int index) {
      setState() {
        _selectedIndex = index;

      };
    }
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            )
          ),
          title: const Text('Punjabi Sunrise',textAlign: TextAlign.center,),
          backgroundColor: Colors.amber
      ),
              body: Menu(),/*Center(


        //child: _widgetOptions.elementAt(_selectedIndex),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Order',
                backgroundColor: Colors.amber
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_business_sharp),
                label: 'Reservation',
                backgroundColor: Colors.amber
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
                backgroundColor: Colors.amber
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
              backgroundColor: Colors.amber,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }

}
class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {},
          ),
        /*  ListTile(
            leading: Icon(Icons.card_travel_rounded),
            title: Text('Take away'),
            onTap: () => {
              Navigator.of(context).pop()},
          ),*/
        ListTile(
         leading: Icon(Icons.person_add),
          title: Text('Signup'),
          onTap: () => {
          Navigator.push(
          context,MaterialPageRoute(builder: (context) => Register()))
        }
            ),
          /*ListTile(
            leading: Icon(Icons.border_color),
            title: Text(''),
            onTap: () => {Navigator.of(context).pop()},
          ),*/
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Order Details'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.add_business_sharp),
            title: Text('Table booking'),
            onTap: () {
           Navigator.push(
                 context, MaterialPageRoute(builder: (context) => Booking()));
          }

          ),
          ListTile(
            leading: Icon(Icons.add_business_sharp),
            title: Text('Contact us'),
            onTap: () { Navigator.push(
            context, MaterialPageRoute(builder: (context) => Contact()));},
          ),
        ],
      ),
    );
  }
}
