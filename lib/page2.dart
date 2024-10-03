import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  // Widget untuk item skill dengan ikon
  Widget skillItem(String skill, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        skill,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About & Skills"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // About Section
                Text(
                  "About Me",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'I am a web developer from Indonesia with over one year of experience. I am dedicated to crafting user-friendly, responsive, and accessible websites, with an emphasis on maintainability and scalability in development, while adhering to current industry best practices. Exploring new things has always led me to become a better programmer.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 30),
                // Skills Section
                Text(
                  "Skills",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                // Skill List dengan Ikon
                skillItem('Vue.js', Icons.code),
                skillItem('Laravel', Icons.web),
                skillItem('Flutter', Icons.phone_iphone),
                skillItem('Dart', Icons.developer_mode),
                // Tambahkan skill lainnya sesuai kebutuhan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
