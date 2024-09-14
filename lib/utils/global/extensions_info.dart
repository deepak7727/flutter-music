extension TimeConversion on int {
  double get toMinutesFromMilliseconds => this / (60 * 1000);
}

extension DurationFormatting on double {
  // Convert the double value (assumed to be in minutes) to a Duration object
  Duration get toDuration => Duration(minutes: this.toInt(), seconds: ((this - this.toInt()) * 60).toInt());

  // Format the Duration object into a human-readable string
  String get formattedDuration {
    final duration = this.toDuration;
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    
    if (hours > 0) {
      return '$hours hours $minutes minutes $seconds seconds';
    } else if (minutes > 0) {
      return '$minutes minutes $seconds seconds';
    } else {
      return '$seconds seconds';
    }
  }
}