package com.zimmeren.mypriorityqueue;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import org.w3c.dom.Text;

public class LoginFragment extends Fragment
    implements View.OnClickListener
{

    private OnFragmentInteractionListener mListener;
    private TextView titleTextView;
    private TextView usernameTextView;
    private TextView passwordTextView;
    private EditText usernameEditText;
    private EditText passwordEditText;
    private Button signInBtn;
    private Button createBtn;

    public LoginFragment() {
        // Required empty public constructor
    }

    public static LoginFragment newInstance() {
        LoginFragment fragment = new LoginFragment();
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
        View view = inflater.inflate(R.layout.fragment_login, container, false);

        // Get UI items
        titleTextView = (TextView)view.findViewById(R.id.account_login_text);
        usernameTextView = (TextView)view.findViewById(R.id.username_text);
        passwordTextView = (TextView)view.findViewById(R.id.password_text);
        usernameEditText = (EditText)view.findViewById(R.id.username_edit);
        passwordEditText = (EditText)view.findViewById(R.id.password_edit);
        signInBtn = (Button)view.findViewById(R.id.signin_btn);
        createBtn = (Button)view.findViewById(R.id.create_btn);

        // Scale Font of UI items based on screen density
        titleTextView.setTextSize(16 * getResources().getDisplayMetrics().density);
        usernameTextView.setTextSize(16 * getResources().getDisplayMetrics().density);
        passwordTextView.setTextSize(16 * getResources().getDisplayMetrics().density);
        usernameEditText.setTextSize(16 * getResources().getDisplayMetrics().density);
        passwordEditText.setTextSize(16 * getResources().getDisplayMetrics().density);
        signInBtn.setTextSize(16 * getResources().getDisplayMetrics().density);
        createBtn.setTextSize(16 * getResources().getDisplayMetrics().density);

        // Attach Button Actions
        signInBtn.setOnClickListener(this);
        createBtn.setOnClickListener(this);

        return view;
    }

    @Override
    public void onClick(View v){
        switch (v.getId()){
            case R.id.signin_btn:
                //perform action
                signInBtnPressed();
                break;
            case R.id.create_btn:
                //perform action
                createBtnPressed();
                break;
        }
    }

    private void signInBtnPressed(){
        if (mListener.onLoginFragmentSignInRequest(usernameEditText.getText().toString(), passwordEditText.getText().toString())) {
            //go back to account screen
            FragmentManager fragmentManager = getFragmentManager();
            if (fragmentManager.getBackStackEntryCount() > 0) {
                FragmentManager.BackStackEntry first = fragmentManager.getBackStackEntryAt(0);
                fragmentManager.popBackStack(first.getId(), FragmentManager.POP_BACK_STACK_INCLUSIVE);
            }
        } else {
            //display error
        }
    }

    private void createBtnPressed(){
        android.support.v4.app.FragmentTransaction transaction = getFragmentManager().beginTransaction();
        CreationFragment creationFragment = CreationFragment.newInstance();
        transaction.replace(R.id.account_container, creationFragment);
        transaction.addToBackStack(null);
        transaction.commit();
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
        Boolean onLoginFragmentSignInRequest(String username, String password);
    }
}
