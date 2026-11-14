import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Music Player'),
        ),
        body: const Center(
          child: Text('Pemutar Aplikasi'),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          color: Colors.black54,
          child: Row(
            children: [
              Expanded(child: IconButton(
                  icon: const Icon(Icons.shuffle,color: Colors.white),
                  onPressed: (){},
              )),
              Expanded(child: IconButton(
                icon: const Icon(Icons.skip_previous, color: Colors.white),
                onPressed: (){},
              )),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: IconButton(
                    icon: const Icon(Icons.play_circle_fill, color: Colors.white, size: 45),
                    onPressed: (){},
                ),
              ),
              Expanded(child: IconButton(
                icon: const Icon(Icons.skip_next, color: Colors.white),
                onPressed: (){},
              )),
              Expanded(child: IconButton(
                icon: const Icon(Icons.repeat, color: Colors.white),
                onPressed: (){},
              )),
            ],
          ),
        ),
      ),
    );
  }
}
