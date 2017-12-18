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
import android.widget.Toast;

import com.hack.network.SQLXSS.XSQL;
import com.igexin.sdk.PushManager;

public class SQLXSS extends AppCompatActivity implements View.OnClickListener {
    private Button button;
    private TextView resultsx;
    private String kind;
    private EditText URL;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        PushManager.getInstance().initialize(this.getApplicationContext(), com.server.getui.DemoPushService.class);
        PushManager.getInstance().registerPushIntentService(this.getApplicationContext(), com.server.getui.DemoIntentService.class);
        //1.获取控件info
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sqlxss);
        Intent intent=getIntent();
        kind=intent.getStringExtra("kind");
        Toast.makeText(this,kind,Toast.LENGTH_SHORT).show();
        button=(Button)findViewById(R.id.checksx);
        resultsx=(TextView)findViewById(R.id.resultsx);
        URL=(EditText)findViewById(R.id.url);
        button.setOnClickListener(this);
    }
    private void check(){
        try{
            String url=URL.getText().toString().trim();
            XSQL s=new XSQL();
            s.getinfo(kind,url,handler);
        }
        catch (Exception e){
            e.printStackTrace();
        }

    }
    Handler handler=new Handler(){
        @Override
        public void handleMessage(Message msg) {
            String data=(String)msg.obj;
            resultsx.setText(data);
        }
    };
    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.checksx:
                check();
                break;
        }

    }
}
