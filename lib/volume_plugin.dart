import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Volume extends StatefulWidget {
  final ValueChanged<num> onVolumeChangeListener;

  Volume({Key key, this.onVolumeChangeListener}) : super(key: key);

  @override
  _VolumeState createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  static const volumnPlugin = const EventChannel('plugins.com.karen/volume');
  StreamSubscription _subscription;
  num currentVolume = 0;

  void _onEvent(Object event) {
    print("******音量变化啦==${event}**********");
    if (mounted) {
      if (widget.onVolumeChangeListener != null) {
        widget.onVolumeChangeListener(event);
      }
      setState(() {
        currentVolume = event;
      });
    }
  }

  void setVolume(num volume) {
    if (mounted) {
      setState(() {
        currentVolume = volume;
      });
    }
  }

  @override
  void dispose() {
    if (_subscription != null) {
      _subscription.cancel();
    }
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    if (_subscription != null) {
      _subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    if (_subscription == null) {
      _subscription = volumnPlugin.receiveBroadcastStream().listen(_onEvent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (currentVolume == 0) {
          setVolume(0.5);
        } else {
          setVolume(0);
        }
      },
      child: Container(
        color: Theme.of(context).dialogBackgroundColor,
        padding: const EdgeInsets.only(
          left: 0.0,
          right: 8.0,
        ),
        child: Icon(
          (currentVolume > 0) ? Icons.volume_up : Icons.volume_off,
        ),
      ),
    );
  }
}