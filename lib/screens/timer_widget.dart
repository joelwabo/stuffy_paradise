import 'package:flutter/material.dart';
import 'dart:async';

import '../injection.dart';
import '../provider/home_screen_provider.dart';

class TimerWidget extends StatefulWidget {
  final int index;
  final Function() startTimerCallback;
  final Function(int duration) stopTimerCallback;
  final Function() resetTimerCallback;

  TimerWidget({
    required this.index,
    required this.startTimerCallback,
    required this.stopTimerCallback,
    required this.resetTimerCallback,
  });

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  bool _isRunning = false;
  HomeScreenProvider _provider = getIt();

  @override
  void initState() {
    super.initState();// Set initial value from the widget
    if (_provider.rides[widget.index].duration > 0) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _provider.rides[widget.index] = _provider.rides[widget.index].copyWith(duration: _provider.rides[widget.index].duration+1);
        });
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _provider.rides[widget.index] = _provider.rides[widget.index].copyWith(duration: _provider.rides[widget.index].duration+1);
      });
    });
    widget.startTimerCallback();
  }

  void _stopTimer() {
    _timer?.cancel();
    widget.stopTimerCallback(_provider.rides[widget.index].duration);
  }

  void _resetTimer() {
    _timer?.cancel();
    widget.resetTimerCallback();
    setState(() {
      _provider.rides[widget.index] = _provider.rides[widget.index].copyWith(duration: 0);
      _isRunning = false;
    });
  }

  void _toggleTimer() {
    setState(() {
      if (_isRunning) {
        _stopTimer();
      } else {
        _startTimer();
      }
      _isRunning = !_isRunning;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formatTime(_provider.rides[widget.index].duration),
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: _toggleTimer,
          child: Text(_isRunning ? 'Stop' : 'Start'),
        ),
        if (!_isRunning && _provider.rides[widget.index].duration > 0) // Show Reset button if stopped
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              onPressed: _resetTimer,
              child: const Text('Reset'),
            ),
          ),
      ],
    );
  }
}
