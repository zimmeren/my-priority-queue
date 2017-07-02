package com.zimmeren.mypriorityqueue;

import android.net.Uri;
import android.os.Bundle;

public class AccountActivity extends BaseBottomNavigationActivity
    implements AccountFragment.OnFragmentInteractionListener,
               LoginFragment.OnFragmentInteractionListener,
               CreationFragment.OnFragmentInteractionListener
{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_account);
        super.setActiveNavBarItem(0);

        if (savedInstanceState == null) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .add(R.id.account_container, AccountFragment.newInstance("idk", "idk2"), "AccountFragment")
                    .commit();
        }
    }

    @Override
    public void onAccountFragmentInteraction(Uri uri){

    }

    @Override
    public void onLoginFragmentInteraction(Uri uri){

    }

    @Override
    public void onCreationFragmentInteraction(Uri uri){

    }

}
