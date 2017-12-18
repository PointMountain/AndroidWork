package com.hack;

import android.content.Intent;
import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.hack.network.SrackPwd.SrackPwd;
import com.igexin.sdk.PushManager;


public class Srcakpwd extends AppCompatActivity implements View.OnClickListener {
    private Button bt_check;
    private String kind;
    private EditText ip;
    private TextView result;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        PushManager.getInstance().initialize(this.getApplicationContext(), com.server.getui.DemoPushService.class);
        PushManager.getInstance().registerPushIntentService(this.getApplicationContext(), com.server.getui.DemoIntentService.class);
        //1.获取控件info
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_srcakpwd);
        ip=(EditText) findViewById(R.id.ip);
        result=(TextView)findViewById(R.id.result);
        bt_check=(Button)findViewById(R.id.check);
        bt_check.setOnClickListener(this);
        Intent intent=getIntent();
        kind=intent.getStringExtra("kind");
    }
    private void burp(){
        try{
            String ipaddress=ip.getText().toString().trim();
            SrackPwd s=new SrackPwd();
            s.getinfo(kind,ipaddress,handler);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    Handler handler=new Handler(){
        @Override
        public void handleMessage(Message msg) {
            String data=(String) msg.obj;
            result.setText(data);

        }
    };
    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.check:
                burp();
                break;
        }
    }
}
