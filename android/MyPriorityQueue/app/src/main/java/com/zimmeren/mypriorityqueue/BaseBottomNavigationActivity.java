package com.zimmeren.mypriorityqueue;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.widget.LinearLayout;
import android.widget.FrameLayout;

public class BaseBottomNavigationActivity extends AppCompatActivity {

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            switch (item.getItemId()) {
                case R.id.navigation_Account:
                    Intent intent1 = new Intent(BaseBottomNavigationActivity.this, AccountActivity.class);
                    startActivity(intent1);
                    return true;
                case R.id.navigation_MyQueue:
                    Intent intent2 = new Intent(BaseBottomNavigationActivity.this, MyQueueActivity.class);
                    startActivity(intent2);
                    return true;
                case R.id.navigation_YourQueue:
                    Intent intent3 = new Intent(BaseBottomNavigationActivity.this, YourQueueActivity.class);
                    startActivity(intent3);
                    return true;
            }
            return false;
        }

    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public void setContentView(final int layoutResID) {
        LinearLayout fullLayout= (LinearLayout) getLayoutInflater().inflate(R.layout.activity_base_bottom_navigation, null);
        FrameLayout actContent= (FrameLayout) fullLayout.findViewById(R.id.content);
        getLayoutInflater().inflate(layoutResID, actContent, true);
        super.setContentView(fullLayout);

        BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
    }

}
