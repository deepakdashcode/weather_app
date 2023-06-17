import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
            height: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                'assets/background.gif',
                fit: BoxFit.fill,
              ),
            )
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.6 * height / 2.6),
              child: Container(

                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/weather.gif')
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:const EdgeInsets.only(top: 40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, _createRoute());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/button_get_started.gif'),
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MainPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  void homeSelected()
  {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Home()), (e) => false);
  }
  void searchSelected()
  {
    print("You selected Search Bar");
  }
  void profileSelected()
  {
    print("You selected Your Profile");
  }

  String? valueChoose;
  List listItems = ["Current", "Domestic", "International"];
  @override
  Widget build(BuildContext context) {


    return Stack(
      children: [
        Container(
            height: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                'assets/raining.gif',
                fit: BoxFit.fill,
              ),
            )
        ),

    Scaffold(
    backgroundColor: const Color.fromARGB(6, 6, 13, 0),
    body: Column(

      children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(

        decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(45)

        ),
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
        child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: DropdownButton(
        dropdownColor: Colors.black,
        iconSize: 30,
        iconEnabledColor: Colors.red,
        style: const TextStyle(
        fontStyle: FontStyle.italic,
        color: Colors.white,
        fontWeight: FontWeight.w200
        ),
        hint: const Text("Location", style: TextStyle(fontStyle: FontStyle.italic,
        color: Colors.white,
        fontWeight: FontWeight.w200),),
        icon: const Icon(Icons.location_on_sharp),
        items: listItems.map((valueItem) {
        return DropdownMenuItem(value: valueItem,
        child: Text(valueItem),
        );
        } ).toList(),
        value: valueChoose,
        onChanged: (newValue){
        setState(() {
        valueChoose = newValue.toString();
        });
        },
        ),
        ),
        ),
        ),
        ],
        ),


        
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
          child: Text('Today\'s Report',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ),
        ),

        Container(
            height: 300,
            width: 300,
            child: Image.asset('assets/cloud.png')
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
          child: Text('It is Raining',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
          child: Text('26°',
            style: TextStyle(
              letterSpacing: 1.5,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 80
            ),
          ),
        ),



      ],
    ),
    
    


    bottomNavigationBar: Container(
    color: Colors.black,
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    child: GNav(
    tabBorderRadius: 60,
    gap: 10,
    backgroundColor: Colors.black,
    color: Colors.white54,
    activeColor: Colors.white,
    tabBackgroundColor: Colors.white12,
    padding: const EdgeInsets.all(20),
    onTabChange: (index){
    switch(index)
    {
    case 0: homeSelected();
    break;
    case 1: searchSelected();
    break;
    }
    },
    tabs: [
    const GButton(
    icon: Icons.home,
    text: "Home",
    ),
    const GButton(
    icon: Icons.search,
    text: "Search",
    ),
    const GButton(
    icon: Icons.my_location,
    text: "Location",
    ),
    const GButton(
    icon: Icons.person,
    text: "Profile",
    )
    ],
    ),
    ),
    ),
    )
      ],
    );
  }
}

