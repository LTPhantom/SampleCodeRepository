package io.flutter.plugins.fullscreenandroidexample;

import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import java.util.Arrays;

/**
 * Main Activity. Inflates main activity xml and child fragments.
 */
public class ExtraActivity extends Activity {

    private static final String TAG = "ExtraActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
          WindowManager.LayoutParams.FLAG_FULLSCREEN);
      getWindow().requestFeature(Window.FEATURE_NO_TITLE);
      //getActionBar().hide();
      setContentView(R.layout.activity_my);
    }

}
