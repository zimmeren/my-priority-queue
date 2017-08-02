package com.zimmeren.mypriorityqueue;

import android.net.Uri;
import android.os.Bundle;

public class AccountActivity extends BaseBottomNavigationActivity
    implements AccountFragment.OnFragmentInteractionListener,
               LoginFragment.OnFragmentInteractionListener,
               CreationFragment.OnFragmentInteractionListener
{
    private String username = "";
    private Boolean loggedIn = false;
    private AccountFragment accountFragment = null;
    private LoginFragment loginFragment = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_account);
        super.setActiveNavBarItem(0);

        if (savedInstanceState == null) {
            accountFragment = AccountFragment.newInstance();
            getSupportFragmentManager()
                    .beginTransaction()
                    .add(R.id.account_container, accountFragment, "AccountFragment")
                    .commit();
        } else {
            accountFragment = (AccountFragment)getSupportFragmentManager().getFragment(savedInstanceState, "AccountFragment");
        }
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);

        getSupportFragmentManager().putFragment(outState, "AccountFragment", accountFragment);
    }

    @Override
    public void onAccountTransitionFragmentInteraction(String to){
        android.support.v4.app.FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();
        if (to.equals("AccountFragment")){

        } else if (to.equals("LoginFragment")){
            loginFragment = LoginFragment.newInstance("test", "test");
            transaction.replace(R.id.account_container, loginFragment);
            transaction.addToBackStack(null);
            transaction.commit();

        } else if (to.equals("CreationFragment")){

        }
    }

    @Override
    public Boolean onAccountLogoutFragmentInteraction(){
        //insert network logic here
        loggedIn = false;
        return true;
    }

    @Override
    public void onLoginFragmentInteraction(Uri uri){

    }

    @Override
    public void onCreationFragmentInteraction(Uri uri){

    }

}
