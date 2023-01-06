import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';
import '../provider/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    final provider = Provider.of<ThemeProvider>(context);
    final count = counter.count;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Center(
                child: Text(
                  'You press button\n $count times',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: DecreaseButton(counter),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IncreaseButton(counter),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ResetButton(counter),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  onPressed: () {
                    provider.toggleTheme();
                  },
                  child: const Text('Toggle Theme'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    textStyle: TextStyle(
                      fontSize: 18
                    )
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

IncreaseButton(counter) {
  return Container(
    padding: EdgeInsets.all(40),
    child: FloatingActionButton(
      onPressed: counter.increment,
      child: const Icon(Icons.add),
    ),
  );
}

DecreaseButton(counter) {
  return Container(
    padding: EdgeInsets.all(40),
    child: FloatingActionButton(
      onPressed: counter.decrement,
      child: const Icon(Icons.remove),
    ),
  );
}

ResetButton(counter) {
  return Container(
    padding: EdgeInsets.all(40),
    child: FloatingActionButton(
      onPressed: counter.reset,
      child: const Icon(Icons.refresh),
    ),
  );
}
