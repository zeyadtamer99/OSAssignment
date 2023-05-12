Banker Algorithm in Flutter
This is a simple implementation of the Banker Algorithm in Flutter, a popular algorithm used to avoid deadlocks in operating systems. The project includes two pages:

The input page, which allows the user to enter the allocation vector, maximum vector, available vector, number of processes, and number of resources.
The output page, which shows the result of running the Banker Algorithm for the inputs provided by the user.
Requirements
To run this project, you need to have Flutter and Dart installed on your machine. You can download them from the official website:

Flutter
Dart
How to Run
To run this project, follow these steps:

1-Clone the repository to your local machine:
git clone https://github.com/<your-github-username>/banker_algorithm_flutter.git

2-Navigate to the project directory:
cd banker_algorithm_flutter

3-Install the project dependencies:
flutter pub get

4-Run the app:
flutter run

How to Use
-On the input page, enter the allocation vector, maximum vector, available vector, number of processes, and number of resources. Each vector should be entered on multiple lines, with one value per line.

-Click the "Run Banker Algorithm" button to run the algorithm with the inputs provided.

-On the output page, the result of running the algorithm will be displayed. If a safe sequence is found, it will be displayed at the top of the page. If no safe sequence is found, a message indicating this will be displayed instead.

-If a safe sequence is found, the user can click the "Run Next Iteration" button to see the values for each iteration of the algorithm. The values for each iteration will be displayed below the safe sequence.


Credits
This project was created by Zeyad Tamer 19106227.

References
-GeeksforGeeks: Banker's Algorithm in Operating System
