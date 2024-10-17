import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'page2.dart';


class Main2Page extends StatelessWidget {
  final String username;
  final String role;
  final String sekolah;
  final String deskripsi;

  const Main2Page({
    Key? key,
    required this.username,
    required this.role,
    required this.sekolah,
    required this.deskripsi,
  }) : super(key: key);

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
                          username,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Role dan Sekolah
                        Text(
                          "$role - $sekolah",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Deskripsi
                        Text(
                          "Deskripsi: $deskripsi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Tombol "See More" dengan Animasi
                        ElevatedButton(
                          onPressed: () {
                            // Tambahkan logika untuk tombol "See More" jika diperlukan
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
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
                      ],
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
