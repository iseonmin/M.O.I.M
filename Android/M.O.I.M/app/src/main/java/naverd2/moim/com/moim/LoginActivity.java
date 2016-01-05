package naverd2.moim.com.moim;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.parse.LogInCallback;
import com.parse.ParseException;
import com.parse.ParseUser;

/**
 * Created by jinWook on 2015-12-24.
 *
 * get User Parse ID & PW
 * or sign up!!
 */
public class LoginActivity extends Activity implements View.OnClickListener {

    private Button mBtnLogin = null;
    private Button mBtnSignIn = null;
    private EditText mTxtID = null;
    private EditText mTxtPW = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        mTxtID = (EditText)findViewById(R.id.etID);
        mTxtPW = (EditText)findViewById(R.id.etPW);
        mBtnLogin = (Button)findViewById(R.id.bLogin);
        mBtnLogin.setOnClickListener(this);
        mBtnSignIn = (Button)findViewById(R.id.bSignIn);
        mBtnSignIn.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {

        //Login button
        if(v.getId() == R.id.bLogin) {

            ParseUser.logInInBackground(mTxtID.getText().toString(), mTxtPW.getText().toString()
                    , new LogInCallback() {

                @Override
                public void done(ParseUser user, ParseException e) {
                    if (user != null) {
                        Intent intent = new Intent(LoginActivity.this, MainActivity.class);
                        startActivity(intent);
                        finish();
                    } else {
                        Toast.makeText(getApplicationContext(), "로그인 실패",
                                Toast.LENGTH_SHORT).show();
                    }
                }
            });

        //Sign In Button
        }else if(v.getId() == R.id.bSignIn) {
            Intent intent = new Intent(LoginActivity.this, SigninActivity.class);
            startActivity(intent);
        }
    }
}
