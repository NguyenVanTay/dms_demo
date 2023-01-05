enum WeekDay {
  
  //các ngày trong tuần 
  monday(DateTime.monday, 'Monday'),
  tuesday(DateTime.tuesday, 'Tuesday'),
  wednesday(DateTime.wednesday, 'Wednesday'),
  thursday(DateTime.thursday, 'Thursday'),
  friday(DateTime.friday, 'Friday'),
  saturday(DateTime.saturday, 'Saturday'),
  sunday(DateTime.sunday, 'Sunday');
  
  factory WeekDay.fromIntWeekday(int weekDay) {
    return WeekDay.values[weekDay - 1];
  }
  
  factory WeekDay.fromDateTime(DateTime day) {
    return WeekDay.values[day.weekday - 1];
  }

  final int number;
  final String symbol;
  const WeekDay(this.number, this.symbol);

  @override
  String toString() => '$name ($number)';

}
