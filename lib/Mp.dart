import 'package:flutter/material.dart';
import 'main.dart';

class ManagerPage extends StatelessWidget {
  final List<String> testItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.blueAccent,
        elevation: 10,
        title: Text('Manager Page'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Card(
                elevation: 4.0,
                child: Container(
                  margin: EdgeInsets.only(top: 18, bottom: 18),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.black12,
                                  size: 32,
                                ),
                                TextButton(
                                  child: Text('Add Member'),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Apsen',
                            style: TextStyle(
                              fontSize: 46,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Card(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.qr_code,
                                  color: Colors.black12,
                                  size: 32,
                                ),
                                TextButton(
                                  child: Text('Qr Code'),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            child: Column(children: [
                              TextButton.icon(
                                  onPressed: onPressed,
                                  icon: Icon(Icons.settings),
                                  label: Text('settings'))
                            ]),
                          ),
                          Card(
                            child: Column(children: [
                              TextButton.icon(
                                  onPressed: onPressed,
                                  icon: Icon(Icons.people),
                                  label: Text('Team'))
                            ]),
                          ),
                          Card(
                            child: Column(children: [
                              TextButton.icon(
                                  onPressed: onPressed,
                                  icon: Icon(Icons.history),
                                  label: Text('History'))
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(testItems[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {}
}
