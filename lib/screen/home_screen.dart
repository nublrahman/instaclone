import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Stories
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 64, 154, 251),
                            Color.fromARGB(255, 89, 39, 176),
                          ],
                        ),
                      ),
                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                              width: 2.0,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 180, 17, 36),
                                Color.fromARGB(255, 195, 229, 6),
                              ],
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('images/demin.jpg'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage('images/anim.jpg'),
                      ),
                      title: Text('nublrahman'),
                    ),
                    Image.asset(
                      'images/anim.jpg.',
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite_border),
                              SizedBox(width: 4.0),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.chat_bubble_outline),
                              SizedBox(width: 4.0),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.near_me),
                              SizedBox(width: 4.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Awesome Post',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'View all 10 comments',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'reel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation based on the selected index
        },
      ),
    );
  }
}
