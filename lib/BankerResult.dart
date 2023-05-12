import 'package:flutter/material.dart';

class BankerAlgorithmResultPage extends StatelessWidget {
  final List<List<int>> allocation;
  final List<List<int>> maximum;
  final List<int> available;
  final int numProcesses;
  final int numResources;

  BankerAlgorithmResultPage({
    required this.allocation,
    required this.maximum,
    required this.available,
    required this.numProcesses,
    required this.numResources,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Implement logic for running the Banker algorithm
    List<List<int>> need = List.generate(
      numProcesses,
          (i) => List.generate(
        numResources,
            (j) => maximum[i][j] - allocation[i][j],
      ),
    );

    List<bool> finished = List.generate(numProcesses, (i) => false);

    List<int> safeSequence = [];
    List<int> work = List.from(available);

    bool isSafe(List<int> work, List<bool> finished, List<List<int>> need, int process) {
      for (int i = 0; i < numResources; i++) {
        if (need[process][i] > work[i]) {
          return false;
        }
      }
      return true;
    }

    while (safeSequence.length < numProcesses) {
      bool foundSafe = false;
      for (int i = 0; i < numProcesses; i++) {
        if (!finished[i] && isSafe(work, finished, need, i)) {
          for (int j = 0; j < numResources; j++) {
            work[j] += allocation[i][j];
          }
          finished[i] = true;
          safeSequence.add(i);
          foundSafe = true;
        }
      }
      if (!foundSafe) {
        break;
      }
    }

    Widget buildResultItem(String label, List<int> values) {
      return Row(
        children: [
          SizedBox(width: 100, child: Text(label)),
          for (int i = 0; i < values.length; i++)
            SizedBox(
              width: 64,
              child: Text(
                values[i].toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Banker Algorithm Result'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildResultItem('Allocation:', [
              for (int i = 0; i < numProcesses; i++) ...allocation[i]
            ]),
            SizedBox(height: 16),
            buildResultItem('Maximum:', [
              for (int i = 0; i < numProcesses; i++) ...maximum[i]
            ]),
            SizedBox(height: 16),
            buildResultItem('Available:', available),
            SizedBox(height: 16),
            buildResultItem('Need:', [
              for (int i = 0; i < numProcesses; i++) ...need[i]
            ]),
            SizedBox(height: 16),
            Text('Safe sequence: ${safeSequence.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
