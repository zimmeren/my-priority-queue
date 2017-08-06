package com.zimmeren.mypriorityqueue;

import android.os.Bundle;

public class AccountActivity extends BaseBottomNavigationActivity
    implements AccountFragment.OnFragmentInteractionListener,
               LoginFragment.OnFragmentInteractionListener,
               CreationFragment.OnFragmentInteractionListener
{
    private String username = "";
    private Boolean loggedIn = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_account);

        //TODO get account status from protected storage


        AccountFragment accountFragment = AccountFragment.newInstance(loggedIn, username);
        getSupportFragmentManager()
                .beginTransaction()
                .add(R.id.account_container, accountFragment, "AccountFragment")
                .commit();
    }

    @Override
    protected void onResume() {
        super.onResume();
        super.setActiveNavBarItem(0);
    }

    @Override
    public void onBackPressed() {
        if (getSupportFragmentManager().getBackStackEntryCount() > 0) {
            super.onBackPressed();
        }
    }

    @Override
    public Boolean onAccountLogoutFragmentSignOutRequest(){
        //insert network logic here
        loggedIn = false;
        return true;
    }

    @Override
    public void onLoginFragmentSignInRequest(String username, String password){

    }

    @Override
    public void onCreationFragmentSignUpRequest(String username, String password){

    }

}
