package com.zimmeren.mypriorityqueue;

import android.os.Bundle;
import android.os.PersistableBundle;

public class AccountActivity extends BaseBottomNavigationActivity
    implements AccountFragment.OnFragmentInteractionListener,
               LoginFragment.OnFragmentInteractionListener,
               CreationFragment.OnFragmentInteractionListener
{
    private static final String ARG_PARAM1 = "status";
    private static final String ARG_PARAM2 = "user";

    private String account = "";
    private Boolean loggedIn = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_account);

        //TODO get account status from protected storage


        AccountFragment accountFragment = AccountFragment.newInstance(loggedIn, account);
        getSupportFragmentManager()
                .beginTransaction()
                .add(R.id.account_container, accountFragment, "AccountFragment")
                .commit();
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        outState.putBoolean(ARG_PARAM1, loggedIn);
        outState.putString(ARG_PARAM2, account);
        super.onSaveInstanceState(outState);
    }

    @Override
    protected void onRestoreInstanceState(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            loggedIn = savedInstanceState.getBoolean(ARG_PARAM1);
            account = savedInstanceState.getString(ARG_PARAM2);
        }
        super.onRestoreInstanceState(savedInstanceState);
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

    public Boolean getLoggedInStatus() {
        return loggedIn;
    }

    public String getAccount() {
        return account;
    }

    @Override
    public Boolean onAccountFragmentSignOutRequest(){
        //insert network logic here
        loggedIn = false;
        account = "";
        return true;
    }

    @Override
    public Boolean onLoginFragmentSignInRequest(String username, String password){
        //insert network logic here
        loggedIn = true;
        account = username;
        return true;
    }

    @Override
    public Boolean onCreationFragmentSignUpRequest(String username, String password){
        //insert network logic here
        loggedIn = true;
        account = username;
        return true;
    }

}
