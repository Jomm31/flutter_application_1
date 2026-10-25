import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Joemire Dave Loremas'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              // Top: Picture of a male
              const Text(
                'Male',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'lib/assets/male.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 24),

              // Middle: Picture of a female
              const Text(
                'Female',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'lib/assets/female.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 24),

              // Bottom: Picture of another male
              const Text(
                'Another Male',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'lib/assets/another_male.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // Stack of 6 overlapping containers
              const Text(
                'Stacked Containers',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Container 1: Red – 100x100
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                    // Container 2: Blue – 90x90
                    Container(
                      width: 90,
                      height: 90,
                      color: Colors.blue,
                    ),
                    // Container 3: Green – 80x80
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.green,
                    ),
                    // Container 4: Yellow – 70x70
                    Container(
                      width: 70,
                      height: 70,
                      color: Colors.yellow,
                    ),
                    // Container 5: Black – 60x60
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.black,
                    ),
                    // Container 6: Purple – 50x50
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
