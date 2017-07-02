package com.zimmeren.mypriorityqueue;

import android.app.ActivityManager;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.LinearLayout;
import android.widget.FrameLayout;

import java.util.List;

public class BaseBottomNavigationActivity extends AppCompatActivity {

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            switch (item.getItemId()) {
                case R.id.navigation_Account:
                    Intent intent1 = new Intent(BaseBottomNavigationActivity.this, AccountActivity.class);
                    intent1.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
                    startActivity(intent1);
                    break;
                case R.id.navigation_MyQueue:
                    Intent intent2 = new Intent(BaseBottomNavigationActivity.this, MyQueueActivity.class);
                    intent2.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
                    startActivity(intent2);
                    break;
                case R.id.navigation_YourQueue:
                    Intent intent3 = new Intent(BaseBottomNavigationActivity.this, YourQueueActivity.class);
                    intent3.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
                    startActivity(intent3);
                    break;
                default:
                    return false;
            }
            return true;
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

    @Override
    public void onBackPressed() {
        //Make back button leave app instead of jumping between sibling bottom nav bar activities
        ActivityManager activityManager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
        List<ActivityManager.AppTask> appTasks = activityManager.getAppTasks();
        for (ActivityManager.AppTask task : appTasks){
            task.finishAndRemoveTask();
        }
    }

    public void setActiveNavBarItem(final int menuItemNum) {
        BottomNavigationView bottomNavigationView = (BottomNavigationView) findViewById(R.id.navigation);
        Menu menu = bottomNavigationView.getMenu();
        MenuItem menuItem = menu.getItem(menuItemNum);
        menuItem.setChecked(true);
    }

}
