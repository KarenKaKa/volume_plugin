# volume_plugin

A new Flutter plugin for acquiring volume change of physical volume keys.

效果图：


![image](https://github.com/KarenKaKa/volume_plugin/blob/master/demo.gif)
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
