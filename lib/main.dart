import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
import 'page2.dart'; // Pastikan untuk mengimpor page2.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Saya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Memulai animasi setelah build selesai
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  // Widget untuk ikon sosial media
  Widget socialIcon(String assetPath, String url) {
    return GestureDetector(
      onTap: () async {
        Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          // Tidak dapat membuka URL
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tidak dapat membuka URL')),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white70,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar Latar Belakang
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient Overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Konten Utama dengan Animasi Fade-In
          Center(
            child: SingleChildScrollView(
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white.withOpacity(0.85),
                    elevation: 10,
                    shadowColor: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // Foto Profil dengan Border
                          CircleAvatar(
                            radius: 100.0,
                            backgroundColor: Colors.blueAccent,
                            child: CircleAvatar(
                              radius: 95.0,
                              backgroundImage:
                                  AssetImage('assets/images/download.jpg'),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Nama
                          Text(
                            "Aria Manggala Putra",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Deskripsi
                          Text(
                            "Vocational High School Student at SMK Wikrama Bogor",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(height: 20),
                          // Tombol "See More" dengan Animasi
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Page2()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white, // Ganti onPrimary dengan foregroundColor
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 5,
                              shadowColor: Colors.black45,
                            ),
                            child: Text(
                              'See More',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          // Ikon Sosial Media
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              socialIcon(
                                'assets/icons/facebook.png',
                                'https://www.facebook.com/yourprofile',
                              ),
                              socialIcon(
                                'assets/icons/instagram.png',
                                'https://www.instagram.com/_ariamanggala/',
                              ),
                              socialIcon(
                                'assets/icons/linkedin.png',
                                'https://www.linkedin.com/in/yourprofile',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
