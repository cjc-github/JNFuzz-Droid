package org.cao.explosion_path2;

import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.Manifest;
import android.content.pm.PackageManager;
import android.telephony.TelephonyManager;
import android.widget.TextView;


public class MainActivity extends Activity {

    static {
        System.loadLibrary("explosion_path2");
    }

    public native void send(String data);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        TelephonyManager tel = (TelephonyManager) getSystemService(TELEPHONY_SERVICE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (checkSelfPermission(Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
                return;
            }
        }
        String imei = tel.getDeviceId(); // source
        TextView tv=findViewById(R.id.id1);
        tv.setText("explosion_path2:"+imei);
        send(imei);
    }
}
