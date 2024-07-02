import 'package:ethio_films/views/widgets/new_release.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Text('EthioFilms', style: TextStyle(color:Colors.red)),
        actions:[
          TextButton(onPressed: (){}, child: const Text('My List')),
        ]
      ),
      body: const SafeArea(child: NewReleases()),
    );
  }
}