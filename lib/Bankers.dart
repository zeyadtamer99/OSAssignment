import 'package:flutter/material.dart';
import 'package:osassignment/BankerResult.dart';

class BankerAlgorithmPage extends StatefulWidget {
  @override
  _BankerAlgorithmPageState createState() => _BankerAlgorithmPageState();
}

class _BankerAlgorithmPageState extends State<BankerAlgorithmPage> {
  List<List<int>> allocation = [[]];
  List<List<int>> maximum = [[]];
  List<int> available = [];
  int numProcesses = 0;
  int numResources = 0;

  void updateAllocationValue(int row, int col, String value) {
    int newValue = int.tryParse(value) ?? 0;
    setState(() {
      allocation[row][col] = newValue;
    });
  }

  void updateMaximumValue(int row, int col, String value) {
    int newValue = int.tryParse(value) ?? 0;
    setState(() {
      maximum[row][col] = newValue;
    });
  }

  void updateAvailableValue(int index, String value) {
    int newValue = int.tryParse(value) ?? 0;
    setState(() {
      available[index] = newValue;
    });
  }

  void updateNumProcesses(String value) {
    int newValue = int.tryParse(value) ?? 0;
    setState(() {
      numProcesses = newValue;
      allocation =
          List.generate(numProcesses, (_) => List.filled(numResources, 0));
      maximum =
          List.generate(numProcesses, (_) => List.filled(numResources, 0));
    });
  }

  void updateNumResources(String value) {
    int newValue = int.tryParse(value) ?? 0;
    setState(() {
      numResources = newValue;
      available = List.filled(numResources, 0);
      allocation =
          List.generate(numProcesses, (_) => List.filled(numResources, 0));
      maximum =
          List.generate(numProcesses, (_) => List.filled(numResources, 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banker Algorithm Inputs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Allocation:'),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < numResources; i++)
                    SizedBox(
                      width: 64,
                      child: Text('Resource $i'),
                    ),
                  SizedBox(width: 16),
                  for (int i = 0; i < numProcesses; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int j = 0; j < numResources; j++)
                          SizedBox(
                            width: 64,
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  updateAllocationValue(i, j, value),
                            ),
                          ),
                        SizedBox(height: 8),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 16),
              Text('Maximum:'),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < numResources; i++)
                    SizedBox(
                      width: 64,
                      child: Text('Resource $i'),
                    ),
                  SizedBox(width: 16),
                  for (int i = 0; i < numProcesses; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int j = 0; j < numResources; j++)
                          SizedBox(
                            width: 64,
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  updateMaximumValue(i, j, value),
                            ),
                          ),
                        SizedBox(height: 8),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 16),
              Text('Available:'),
              SizedBox(height: 8),
              Row(
                children: [
                  for (int i = 0; i < numResources; i++)
                    SizedBox(
                      width: 64,
                      child: TextField(
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        onChanged: (value) => updateAvailableValue(i, value),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Number of processes',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: updateNumProcesses,
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Number of resources',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: updateNumResources,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Run Banker Algorithm'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BankerAlgorithmResultPage(allocation: allocation, maximum: maximum, available: available, numProcesses: numProcesses, numResources: numResources)),
                  );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
