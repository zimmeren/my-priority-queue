package com.zimmeren.mypriorityqueue;

import android.net.Uri;
import android.os.Bundle;

public class MyQueueActivity extends BaseBottomNavigationActivity
    implements NewItemFragment.OnFragmentInteractionListener

{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_queue);

        if (savedInstanceState == null) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .add(R.id.my_queue_container, NewItemFragment.newInstance("idk", "idk2"), "NewItemFragment")
                    .commit();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        super.setActiveNavBarItem(1);
    }

    @Override
    public void onBackPressed() {
        if (getSupportFragmentManager().getBackStackEntryCount() > 0) {
            super.onBackPressed();
        }
    }

    @Override
    public void onNewItemFragmentInteraction(Uri uri){

    }
}
