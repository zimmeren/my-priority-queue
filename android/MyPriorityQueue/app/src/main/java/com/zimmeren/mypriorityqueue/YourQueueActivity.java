package com.zimmeren.mypriorityqueue;

import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class YourQueueActivity extends BaseBottomNavigationActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_your_queue);
        super.setActiveNavBarItem(2);
    }
}
