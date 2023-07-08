package com.test.example;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class utilActivity extends AppCompatActivity {

    static {
        System.loadLibrary("native-lib");
    }

    public static native void fun1(String obj, int length);

    public native void fun2(String obj);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.second);
        Intent it = getIntent();
        TextView tv = findViewById(R.id.tv1);

        Button button = (Button) findViewById(R.id.button1);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View arg0) {
                String imei = it.getStringExtra("data");
                int length = tv.getText().length();
                fun1(imei, length);
                fun2(imei);
            }
        });
    }
}
