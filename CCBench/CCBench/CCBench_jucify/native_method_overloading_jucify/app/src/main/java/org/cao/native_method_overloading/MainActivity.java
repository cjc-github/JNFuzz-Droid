package org.cao.native_method_overloading;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    static {
        System.loadLibrary("native_method_overloading");
    }

    native void send(int data);

    native void send(int[] array, String[] array2, String data, double d);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TelephonyManager tel = (TelephonyManager) getSystemService(TELEPHONY_SERVICE);
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
            return;
        }
        String imei = tel.getDeviceId(); // source
        TextView tv=findViewById(R.id.id1);
        tv.setText("native_method_overloading:"+imei);
        send(new int[1], new String[1], imei, 0D);
    }
}