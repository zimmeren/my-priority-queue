package com.zimmeren.mypriorityqueue;

import android.net.Uri;
import android.os.Bundle;

public class YourQueueActivity extends BaseBottomNavigationActivity
    implements SearchUsersFragment.OnFragmentInteractionListener
{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_your_queue);
        super.setActiveNavBarItem(2);

        if (savedInstanceState == null) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .add(R.id.your_queue_container, SearchUsersFragment.newInstance("idk", "idk2"), "SearchUsersFragment")
                    .commit();
        }
    }

    @Override
    public void onSearchUsersFragmentInteraction(Uri uri){

    }
}
