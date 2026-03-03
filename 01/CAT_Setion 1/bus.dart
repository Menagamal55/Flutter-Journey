import 'dart:io';

void main() {
  const int seatsPerBus = 12;
  int currentBusSeats = seatsPerBus;
  int busNumber = 1;

  print("Bus #$busNumber started with $currentBusSeats seats.");

  while (true) {
    stdout.write("Enter group size (0 to stop): ");
    int group = int.parse(stdin.readLineSync()!);

    if (group == 0) {
      print("All buses are handled. Program ended.");
      break;
    }

    if (group <= currentBusSeats) {
      currentBusSeats -= group;
      print("Seats remaining: $currentBusSeats");
    } else {
      print("Not enough seats! Moving to the next bus.");
      busNumber++;
      currentBusSeats = seatsPerBus - group;
      print("New Bus #$busNumber started");
      print("Seats remaining: $currentBusSeats");
    }
  }
}