import 'package:flutter/material.dart';

import '../models/mainMenu_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  List<MainMenu> mainMenus;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _foundMenu = [];
  TextEditingController editingController = TextEditingController();

  Widget _searchBox() {
    return Expanded(
      child: TextField(
        onChanged: (value) {
          _runFilter(value);
        },
        controller: editingController,
        decoration: InputDecoration(
          hintText: 'Поиск',
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 169, 225, 200),
          contentPadding: EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  @override
  initState() {
    _foundMenu = widget.mainMenus;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.mainMenus;
    } else {
      results = widget.mainMenus
          .where((user) => user['title']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundMenu = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Это я - твой помощник',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(
                IconData(0xe0ef, fontFamily: 'MaterialIcons'),
                size: 40,
                color: Color.fromARGB(255, 31, 106, 85),
              )
            ],
          ),
          Text(
            'по уходу за цветами и растениями',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 20, 109, 91)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 35),
            child: Row(
              children: [_searchBox()],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 4,
              itemCount: _foundMenu.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            product: _products[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/images/${_foundMenu[index]['image']}',
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${_foundMenu[index]['title']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ));
              },
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
            ),
          )
        ],
      ),
    );
  }
}
