import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  static appBar(context) => AppBar(
        centerTitle: true,
        title:
            Text("Уведомления", style: Theme.of(context).textTheme.headline1),
      );
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[50],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            "https://a.rte.im/storage/1602670770_14e2338b70167e5e4ce007005c9b2250.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Text(
                    'Event name notiff',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1, left: 60),
                    child: MaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.close,
                              size: 20,
                            ),
                            Text('очистить'),
                          ],
                        )),
                  )
                ],
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('vav, go to event'),
                      trailing: Text('time'),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.notifications,
                          color: Colors.yellow,
                          size: 35,
                        ),
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Start on 300'),
                      trailing: Text('time'),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.notifications,
                          color: Colors.yellow,
                          size: 35,
                        ),
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        title: Text('Send for you message'),
                        trailing: Text('time'),
                        leading: Container(
                          height: 60,
                          width: 60,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.network(
                                  "https://klike.net/uploads/posts/2019-03/1551511784_4.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                  top: 30,
                                  right: 3,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.email,
                                      size: 20,
                                      color: Colors.grey[500],
                                    ),
                                  ))
                            ],
                          ),
                        )),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Likes yours foto'),
                      trailing: Text('time'),
                      leading: Container(
                        height: 60,
                        width: 60,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(
                                "https://klike.net/uploads/posts/2019-03/1551511784_4.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                top: 30,
                                right: 3,
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
