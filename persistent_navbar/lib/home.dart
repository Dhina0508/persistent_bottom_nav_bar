import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int badge1 = 0;
  int badge2 = 0;
  int badge3 = 0;

  Widget _buildNavIcon(IconData icon, int index, {int badge = 0}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kBottomNavigationBarHeight,
      child: Material(
        color: Colors.teal,
        child: InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 22,
                      ),
                      Positioned(
                        right: -15.0,
                        top: -15.0,
                        child: Container(
                          height: 24,
                          width: 24,
                          constraints: BoxConstraints(
                            maxHeight: 45,
                            maxWidth: 45,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text("$badge"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> _screens() {
    return [Notification_pg(), Favourite_pg(), Cart()];
  }

  List<PersistentBottomNavBarItem> _navbarItems() {
    return [
      PersistentBottomNavBarItem(
          inactiveIcon: Icon(
            Icons.notification_add_outlined,
            color: Colors.white,
          ),
          icon: _buildNavIcon(Icons.notification_add, 0, badge: badge1)),
      PersistentBottomNavBarItem(
          inactiveIcon: Icon(
            Icons.favorite_outline,
            color: Colors.white,
          ),
          icon: _buildNavIcon(Icons.favorite_outlined, 1, badge: badge2)),
      PersistentBottomNavBarItem(
          inactiveIcon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          icon: _buildNavIcon(Icons.shopping_cart, 2, badge: badge3)),
    ];
  }

  Notification_pg() {
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(50)),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    badge1++;
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: 50,
                )),
          ),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(50)),
            child: IconButton(
                onPressed: () {
                  if (badge1 > 0) {
                    setState(() {
                      badge1--;
                    });
                  }
                },
                icon: Icon(
                  Icons.horizontal_rule_outlined,
                  size: 50,
                )),
          )
        ]),
      ),
    );
  }

  Cart() {
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(50)),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    badge3++;
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: 50,
                )),
          ),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(50)),
            child: IconButton(
                onPressed: () {
                  if (badge3 > 0) {
                    setState(() {
                      badge3--;
                    });
                  }
                },
                icon: Icon(
                  Icons.horizontal_rule_outlined,
                  size: 50,
                )),
          )
        ]),
      ),
    );
  }

  Favourite_pg() {
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(50)),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    badge2++;
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: 50,
                )),
          ),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(50)),
            child: IconButton(
                onPressed: () {
                  if (badge2 > 0) {
                    setState(() {
                      badge2--;
                    });
                  }
                },
                icon: Icon(
                  Icons.horizontal_rule_outlined,
                  size: 50,
                )),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Software Kernel",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: PersistentTabView(context,
          screens: _screens(),
          items: _navbarItems(),
          backgroundColor: Colors.teal,
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.teal,
            borderRadius: BorderRadius.circular(5),
          ),
          navBarStyle: NavBarStyle.style6),
    );
  }
}
