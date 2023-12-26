package com.example.demo_java_android;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    Button loginButton;
    String userNameDefault = "Cuongbo28032001@gmail.com";
    String passWordDefault = "123456";
    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        loginButton = findViewById(R.id.login_button);
        routeScreen(loginButton, HomeActivity.class);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_home,menu);
        return true;
    }

    private boolean checkUserPass(@NonNull String userNameInput, String passWordInput){

        if(userNameInput.equals(userNameDefault) && passWordInput.equals(passWordDefault)){
            System.out.println("Done");
            return true;
        }
        else{
            System.out.println("Not correct");
            return false;
        }
    }

    private void routeScreen(@NonNull Button button, Class<?> activity)
    {
        button.setOnClickListener(new OnClickListener(){

            @Override
            public void onClick(View view) {
                EditText userName, passWord;
                userName = findViewById(R.id.email_input);
                passWord = findViewById(R.id.password_input);
                if(checkUserPass(userName.getText().toString(), passWord.getText().toString())){
                    Intent intent = new Intent(MainActivity.this, activity);
                    intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                    startActivity(intent);
                }else{
                    System.out.println("aaaaaaaaaa");
                }
            }
        });
    }
}