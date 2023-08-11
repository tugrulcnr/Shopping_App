import 'package:flutter/material.dart';
import 'package:storeapp/commen/card_widget.dart';
import 'package:storeapp/detailsPage/view/details_view.dart';
import 'package:storeapp/mainPage/view_model/main_view_model.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends MainViewModel {
   int _selectedIndex = 0;

   
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        appBar: AppBar(
          title: Text(
            "Top Sales",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.shopping_basket_rounded,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox.shrink(),
            isLoaded
                ? Expanded(
                    child: ListView.builder(
                      itemCount: ((mainModel?.length ?? 10) ~/ 2),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            (index == 0) ? SizedBox(
                              height: 40,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: (catagoryNames.length),
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                        },
                                        child: Card(
                                          color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(color: Colors.white70, width: 1),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: (index <= catagoryNames.length)
                                                ? Padding(
                                                  padding: const EdgeInsets.only(left:15,right: 15,top: 8,bottom: 8),
                                                  child: Text(catagoryNames[index]),
                                                )
                                                : const SizedBox.shrink()),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ) : const SizedBox.shrink(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                    child: CardWidget(onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsView(mainModel: mainModel?[index],)));
                                      
                                    },
                                      canClick: true,
                                        mainModel: mainModel?[index * 2], height: MediaQuery.of(context).size.width / 2, width: MediaQuery.of(context).size.width / 2,)),
                                Expanded(
                                    child: CardWidget(
                                      onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsView(mainModel: mainModel?[index],)));
                                        
                                      },
                                      canClick: true,
                                        mainModel: mainModel?[index * 2 + 1], height: MediaQuery.of(context).size.width / 2, width: MediaQuery.of(context).size.width / 2,)),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
        
        
        
        );



  }
}
