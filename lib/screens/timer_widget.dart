import 'package:flutter/material.dart';
import 'dart:async';

class TimerWidget extends StatefulWidget {
  final int duration; // Add duration parameter
  final Function() startTimerCallback;
  final Function(int duration) stopTimerCallback;
  final Function() resetTimerCallback;

  TimerWidget({
    required this.duration,
    required this.startTimerCallback,
    required this.stopTimerCallback,
    required this.resetTimerCallback,
  });

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  late int _seconds; // Initialize based on widget.duration
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _seconds = widget.duration; // Set initial value from the widget
    if (_seconds > 0) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
    widget.startTimerCallback();
  }

  void _stopTimer() {
    _timer?.cancel();
    widget.stopTimerCallback(_seconds);
  }

  void _resetTimer() {
    _timer?.cancel();
    widget.resetTimerCallback();
    setState(() {
      _seconds = 0;
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
          _formatTime(_seconds),
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: _toggleTimer,
          child: Text(_isRunning ? 'Stop' : 'Start'),
        ),
        if (!_isRunning && _seconds > 0) // Show Reset button if stopped
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
