package com.karen.volume_plugin;

import android.app.Activity;
import android.util.Log;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * VolumePlugin
 */
public class VolumePlugin implements EventChannel.StreamHandler, VolumeChangeObserver.VolumeChangeListener {

  private static final String CHANNEL = "plugins.com.karen/volume";
  static EventChannel channel;
  private Activity activity;

  private VolumePlugin(Activity activity) {
    this.activity = activity;
  }

  public static void registerWith(PluginRegistry.Registrar registrar) {
    channel = new EventChannel(registrar.messenger(), CHANNEL);
    VolumePlugin volumePlugin = new VolumePlugin(registrar.activity());
    channel.setStreamHandler(volumePlugin);
  }

  private VolumeChangeObserver mVolumeChangeObserver;

  EventChannel.EventSink eventSink;

  @Override
  public void onListen(Object o, EventChannel.EventSink eventSink) {
    Log.e("VolumePlugin", "onListen");
    this.eventSink = eventSink;

    //实例化对象并设置监听器
    mVolumeChangeObserver = new VolumeChangeObserver(activity);
    mVolumeChangeObserver.setVolumeChangeListener(this);
    int initVolume = mVolumeChangeObserver.getCurrentMusicVolume();
    Log.e("VolumePlugin", "initVolume = " + initVolume);
    eventSink.success(initVolume);

    mVolumeChangeObserver.registerReceiver();
  }

  @Override
  public void onCancel(Object o) {

  }

  @Override
  public void onVolumeChanged(int volume) {
    Log.e("VolumePlugin", "onVolumeChanged()--->volume = " + volume);
    eventSink.success(volume);
  }
}