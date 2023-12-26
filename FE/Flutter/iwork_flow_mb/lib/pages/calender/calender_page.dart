import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/pages/calender/widgets/calender_custom/selected_builder_widget.dart';
import 'package:iwork_flow_mb/pages/calender/widgets/calender_custom/events_marker_widget.dart';
import 'package:iwork_flow_mb/pages/calender/widgets/list_events/list_events_widget.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

final kToday = DateTime.now();
final weekDay = kToday.weekday;
final kFirstDay = kToday.subtract(Duration(days: weekDay - 1));
final kLastDay = kFirstDay.add(const Duration(days: 6));

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage>
    with TickerProviderStateMixin {
  late ValueNotifier<List> _selectedEvents;
  late AnimationController _animationController;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  LinkedHashMap<DateTime, List>? mapDateEvent;

  @override
  void initState() {
    super.initState();
    Map<DateTime, List> events = {};
    _loadEvents(events);
    mapDateEvent = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(events);
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _loadEvents(events) {
    List<Map<String, dynamic>> eventList = [
      {"title": "Duyệt đơn xin nghỉ phép 1", "deadline": "2023-12-12"},
      {"title": "Duyệt đơn xin nghỉ phép 2", "deadline": "2023-11-12"},
    ];

    for (var event in eventList) {
      DateTime deadline = DateTime.parse(event['deadline']);
      if (events.containsKey(deadline)) {
        events[deadline]!.add(event['title']);
      } else {
        events[deadline] = [event['title']];
      }
    }
  }

  List _getEventsForDay(DateTime day) {
    return mapDateEvent?[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            locale: "vi",
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: CalendarFormat.week,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
            ),
            daysOfWeekHeight: 25,
            daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: const TextStyle(fontWeight: FontWeight.bold),
                weekendStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: scheme.error.withOpacity(0.7))),
            headerStyle: const HeaderStyle(
                leftChevronVisible: false,
                rightChevronVisible: false,
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                headerMargin: EdgeInsets.symmetric(vertical: 10.0)),
            calendarBuilders:
                CalendarBuilders(selectedBuilder: (context, date, _) {
              return selectedBuilderWidget(
                  animationController: _animationController,
                  date: date,
                  isToday: false);
            }, todayBuilder: (context, date, _) {
              return selectedBuilderWidget(
                  animationController: _animationController,
                  date: date,
                  isToday: true);
            }, markerBuilder: (context, date, events) {
              Widget? children;
              if (events.isNotEmpty) {
                children = buildEventsMarker(date: date, events: events);
              }
              return children;
            }),
            onDaySelected: _onDaySelected,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const Divider(
            thickness: 0.5,
            color: MyColors.secondaryTextColor,
          ),
          listEventsWidget(context: context, selectedEvents: _selectedEvents)
        ],
      ),
    );
  }
}
