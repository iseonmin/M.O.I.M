package naverd2.moim.com.moim;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.parse.ParseUser;
import com.parse.SignUpCallback;
import com.parse.ParseException;

/**
 * Created by jinWook on 2015-12-24.
 * Sign up to M.O.I.M
 */
public class SigninActivity extends Activity implements View.OnClickListener {

    private Button mBtnnewSignin = null;
    private EditText mTxtnewID = null;
    private EditText mTxtnewPW = null;
    private EditText mTxtnewEmail = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signin);

        mBtnnewSignin = (Button)findViewById(R.id.bNewSignin);
        mBtnnewSignin.setOnClickListener(this);
        mTxtnewID = (EditText)findViewById(R.id.etnewID);
        mTxtnewPW = (EditText)findViewById(R.id.etnewPW);
        mTxtnewEmail = (EditText)findViewById(R.id.etnewEmail);
    }

    @Override
    public void onClick(View v) {

        //sign in button
        if(v.getId() == R.id.bNewSignin) {
            String IDtxt = mTxtnewID.getText().toString();
            String PWtxt = mTxtnewPW.getText().toString();
            String Emailtxt = mTxtnewEmail.getText().toString();

            if(IDtxt.equals("") || PWtxt.equals("") || Emailtxt.equals("")){
                Toast.makeText(getApplicationContext(),
                        "양식을 다 채워주세요!!",Toast.LENGTH_LONG).show();

            }else {

                ParseUser user = new ParseUser();
                user.setUsername(IDtxt);
                user.setPassword(PWtxt);
                user.setEmail(Emailtxt);

                user.signUpInBackground(new SignUpCallback() {
                    public void done(ParseException e) {
                        if (e == null) {
                            // Hooray! Let them use the app now.
                            Toast.makeText(getApplicationContext(),
                                    "축하합니다. MOIM에 가입 하셨습니다.", Toast.LENGTH_SHORT).show();

                            Intent intent = new Intent(SigninActivity.this, LoginActivity.class);
                            startActivity(intent);
                            finish();

                        } else {
                            // Sign up didn't succeed. Look at the ParseException
                            // to figure out what went wrong
                            Toast.makeText(getApplicationContext(),
                                    "회원가입 실패 / ID, email 중복!", Toast.LENGTH_SHORT).show();
                        }
                    }
                });

            }
        }
    }
}
