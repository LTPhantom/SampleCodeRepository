package io.flutter.plugins.fullscreenandroidexample;

import android.content.Intent;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

  @Override
  public void configureFlutterEngine(FlutterEngine flutterEngine) {
    super.configureFlutterEngine(flutterEngine);

    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),
        "mychannel").setMethodCallHandler(
        (call, result) -> {
          if (call.method.equals("mycall")) {
            Intent intent1 = new Intent(MainActivity.this, ExtraActivity.class);
            startActivity(intent1);
            result.success(null);
          } else {
            result.notImplemented();
          }
        });
  }

  @Override
  public void cleanUpFlutterEngine(FlutterEngine flutterEngine) {
  }
}
