import 'package:cathai_attendance/screens/3.request_screen.dart';
import 'package:cathai_attendance/screens/4.checklist_screen.dart';
import 'package:flutter/material.dart';
import '2.main_screen.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _selectedIndex = 2;

class _HomeScreenState extends State<HomeScreen> {
  String category = "Elderly";
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      const Text(
        'Index 0: ',
      ),
      const CheckListScreen(),
      // 메인
      const MainScreen(),
      const RequestScreen(),
      const Text(
        'Index 3:',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text("CathAI: Cabin Crew"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Wow',
            onPressed: () => {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Wow',
            onPressed: () => {},
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_purple500_outlined),
            label: 'Check List',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Flight Seats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assistant_photo_outlined),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Information',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

//hellowworld