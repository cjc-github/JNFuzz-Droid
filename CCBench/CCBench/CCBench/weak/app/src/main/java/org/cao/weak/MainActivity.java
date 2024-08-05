package org.cao.weak;

import android.Manifest;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.widget.TextView;

import org.w3c.dom.Text;

public class MainActivity extends Activity {

    static {
        System.loadLibrary("weak");
    }

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
        TextView tv = findViewById(R.id.id1);
        tv.setText("weak:" + imei);
        send(imei);
    }

    private native void send(String data);
}
