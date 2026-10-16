// Q1 — Attributes and constructors
// The question requires:
// 1. Store duration internally as milliseconds.
// 2. Keep the field private.
// 3. Never allow a duration below zero.
// 4. Create named constructors for hours, minutes, and seconds.
// 5. Make the object immutable.

//. Q2 - duration1 > duration2 , duration1 < duration2, duration1 == duration2
//       duration1 + duration2
//       duration1 - duration2
class MyDuration {
  final int _milliseconds;

static const int _millisecondsPerSecond = 1000;
static const int _secondsPerMinute = 60;
static const int _minutesPerHour = 60;

// Constructor to create a duration from milliseconds
//asssert is used to ensure that the duration is not negative
  MyDuration._(this._milliseconds) : 
  if (_milliseconds < 0) {
    throw Exception('Duration cannot be negative!');
  }
  // Named constructors for hours, minutes, and seconds 
  // ex: 3*60*60*1000 = 10800000
  MyDuration.fromHours(int hours) : this._(hours * _minutesPerHour * _secondsPerMinute * _millisecondsPerSecond);
  MyDuration.fromMinutes(int minutes) : this._(minutes * _secondsPerMinute * _millisecondsPerSecond);
  MyDuration.fromSeconds(int seconds) : this._(seconds * _millisecondsPerSecond);
 

  bool operator >(MyDuration other) {
   final result= _milliseconds > other._milliseconds;
  return result;
} 
  MyDuration operator +(MyDuration other){
    final totalMilliseconds = _milliseconds + other._milliseconds;
    return MyDuration(totalMilliseconds);
  } 
    MyDuration operator -(MyDuration other){
    final totalMilliseconds = _milliseconds - other._milliseconds;
    if (totalMilliseconds < 0) {
      throw Exception('Resulting duration cannot be negative!');
    } 
    return MyDuration(totalMilliseconds);
  } 


  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1); // 3 hours, 0 minutes, 0 seconds
  print(duration2); // 0 hours, 45 minutes, 0 seconds
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
