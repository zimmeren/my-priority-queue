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

public class CreationFragment extends Fragment
    implements View.OnClickListener
{

    private OnFragmentInteractionListener mListener;
    private TextView titleTextView;
    private TextView usernameTextView;
    private TextView passwordTextView;
    private EditText usernameEditText;
    private EditText passwordEditText;
    private Button createBtn;

    public CreationFragment() {
        // Required empty public constructor
    }

    public static CreationFragment newInstance() {
        CreationFragment fragment = new CreationFragment();
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
        View view = inflater.inflate(R.layout.fragment_creation, container, false);

        // Get UI items
        titleTextView = (TextView)view.findViewById(R.id.account_creation_text);
        usernameTextView = (TextView)view.findViewById(R.id.username_text);
        passwordTextView = (TextView)view.findViewById(R.id.password_text);
        usernameEditText = (EditText)view.findViewById(R.id.username_edit);
        passwordEditText = (EditText)view.findViewById(R.id.password_edit);
        createBtn = (Button)view.findViewById(R.id.create_btn);

        // Scale Font of UI items based on screen density
        titleTextView.setTextSize(16 * getResources().getDisplayMetrics().density);
        usernameTextView.setTextSize(16 * getResources().getDisplayMetrics().density);
        passwordTextView.setTextSize(16 * getResources().getDisplayMetrics().density);
        usernameEditText.setTextSize(16 * getResources().getDisplayMetrics().density);
        passwordEditText.setTextSize(16 * getResources().getDisplayMetrics().density);
        createBtn.setTextSize(16 * getResources().getDisplayMetrics().density);

        // Attach Button Actions
        createBtn.setOnClickListener(this);

        return view;
    }

    @Override
    public void onClick(View v){
        switch (v.getId()){
            case R.id.create_btn:
                //perform action
                createBtnPressed();
                break;
        }
    }

    private void createBtnPressed(){
        if (mListener.onCreationFragmentSignUpRequest(usernameEditText.getText().toString(), passwordEditText.getText().toString())) {
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
        Boolean onCreationFragmentSignUpRequest(String username, String password);
    }
}
