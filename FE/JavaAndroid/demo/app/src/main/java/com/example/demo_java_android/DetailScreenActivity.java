package com.example.demo_java_android;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class DetailScreenActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        if(getSupportActionBar() != null)
        {
            getSupportActionBar().setTitle("Detail");
        }
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail_screen);
    }
}