import 'package:flutter/material.dart';

class Profilecard extends StatelessWidget {


  final List<Map<String,String>> profiles = [
    {
      'imagePath': 'https://i.pravatar.cc/300?img=1',
      'name': 'Abdillah',
      'email': 'abdillah@example.com',
      'assetsImage': 'assets/Profile.png',
    },
    {
      'imagePath': 'https://i.pravatar.cc/300?img=2',
      'name': 'Naif',
      'email': 'naif@example.com',
      'assetsImage': 'assets/Profile.png',
    },
    {
      'imagePath': 'https://i.pravatar.cc/300?img=3',
      'name': 'Zohaib',
      'email': 'zohaib@example.com',
      'assetsImage': 'assets/Profile.png',
    },
    {
      'imagePath': 'https://i.pravatar.cc/300?img=4',
      'name': 'Rehan',
      'email': 'rehan@example.com',
      'assetsImage': 'assets/Profile.png',
    },
  ];

  Profilecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profiles"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(profiles[index]['assetsImage']!),
              ),
              title: Text(profiles[index]['name']!),
              subtitle: Text(profiles[index]['email']!),
              trailing: Icon(Icons.arrow_forward_ios),


              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileDetailScreen(
                      name: profiles[index]['name']!,
                      email: profiles[index]['email']!,
                      imagePath: profiles[index]['imagePath']!,
                      assetImage: profiles[index]['assetsImage']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProfileDetailScreen extends StatelessWidget {
  final String name;
  final String email;
  final String imagePath;
  final String assetImage;

  const ProfileDetailScreen({
    super.key,
    required this.name,
    required this.email,
    required this.imagePath,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(assetImage),
                  foregroundImage: NetworkImage(imagePath),
                ),
                SizedBox(height: 20),
                Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(email, style: TextStyle(fontSize: 18, color: Colors.grey[600])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
