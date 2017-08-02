package com.zimmeren.mypriorityqueue;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

public class AccountFragment extends Fragment
    implements View.OnClickListener
{

    private OnFragmentInteractionListener mListener;
    private TextView titleTextView;
    private TextView usernameTextView;
    private Button signinsignoutBtn;
    private String username = "";
    private Boolean loggedIn = false;

    public AccountFragment() {
        // Required empty public constructor
    }

    public static AccountFragment newInstance() {
        AccountFragment fragment = new AccountFragment();
        Bundle args = new Bundle();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view =  inflater.inflate(R.layout.fragment_account, container, false);

        // Get UI items
        usernameTextView = (TextView)view.findViewById(R.id.account_username_text);
        titleTextView = (TextView)view.findViewById(R.id.account_title_text);
        signinsignoutBtn = (Button)view.findViewById(R.id.signinandout_btn);

        // Scale Font of UI items based on screen density
        usernameTextView.setTextSize(16 * getResources().getDisplayMetrics().density);
        titleTextView.setTextSize(16 * getResources().getDisplayMetrics().density);
        signinsignoutBtn.setTextSize(16 * getResources().getDisplayMetrics().density);

        // Attach Button Actions
        signinsignoutBtn.setOnClickListener(this);

        // setup
        if (loggedIn){
            setLoggedInState();
        } else {
            setLoggedOutState();
        }

        return view;
    }

    @Override
    public void onClick(View v){
        switch (v.getId()){
            case R.id.signinandout_btn:
                //perform action
                signInSignOutBtnPressed();
                break;
        }
    }

    private void setLoggedInState() {
        loggedIn = true;
        username = "";
        usernameTextView.setText(username);
        usernameTextView.setVisibility(View.VISIBLE);
        signinsignoutBtn.setText(getString(R.string.signout));
    }

    private void setLoggedOutState() {
        loggedIn = false;
        username = "";
        usernameTextView.setText(username);
        usernameTextView.setVisibility(View.INVISIBLE);
        signinsignoutBtn.setText(getString(R.string.signin));
    }

    public void signInSignOutBtnPressed() {
        if (loggedIn) {
            if (mListener.onAccountLogoutFragmentInteraction()) {
                setLoggedOutState();
            } else {
                //alert user of failure
            }
        } else {
            mListener.onAccountTransitionFragmentInteraction("LoginFragment");
        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    public interface OnFragmentInteractionListener {
        Boolean onAccountLogoutFragmentInteraction();
        void onAccountTransitionFragmentInteraction(String to);
    }
}
