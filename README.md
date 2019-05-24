# volume_plugin

A new Flutter plugin for acquiring volume change of physical volume keys.

## Getting Started
```java
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Volume(
                onVolumeChangeListener: (num volume) {
                  setState(() {
                    currentVolume = volume;
                  });
                },
              ),
              Text("当前音量=${currentVolume}")
            ]),
      ),
    );
  }
```
