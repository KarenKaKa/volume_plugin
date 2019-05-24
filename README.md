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
> 提示：本人对ios一窍不通，获取音量方法全是现学现卖，如有不如意的地方，还请自行修改。  
如果不想使用示例中的音量控件，可以在StatefulWidget中自定义控件，并监听数据返回。
