package com.hack;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.io.IOException;
import java.util.Map;
import login.until.UserinfoUtil;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import com.igexin.sdk.PushManager;
public class MainActivity extends AppCompatActivity{
    private EditText input_user;
    private EditText input_pwd;
    private Button bt_login;
    private Context context;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // com.getui.demo.DemoPushService 为第三方自定义推送服务
        PushManager.getInstance().initialize(this.getApplicationContext(), com.server.getui.DemoPushService.class);
        PushManager.getInstance().registerPushIntentService(this.getApplicationContext(), com.server.getui.DemoIntentService.class);
        //1.获取控件info
        input_user=(EditText)findViewById(R.id.input_user);
        input_pwd=(EditText)findViewById(R.id.input_pwd);
        bt_login=(Button)findViewById(R.id.bt_login);
        //bt_login.setOnClickListener(this);
        Map<String,String> map=UserinfoUtil.getUserInfo(this);
        if(map!=null){
            input_user.setText(map.get("username"));
            input_pwd.setText(map.get("pwd"));
        }
    }
    public void login(View view){
        final String username=input_user.getText().toString().trim();
        final String pwd=input_pwd.getText().toString().trim();
        context=this;
        if (TextUtils.isEmpty(username)||TextUtils.isEmpty(pwd)){
            Toast.makeText(context,"请输入用户名或密码",Toast.LENGTH_SHORT).show();
            return;
        }
        boolean result= UserinfoUtil.saveUserInfo(username,pwd,context);
        if(result){
            Toast.makeText(context, "用户名密码保存成功！",Toast.LENGTH_SHORT).show();
        }
        else {
            Toast.makeText(context, "用户名密码保存失败！",Toast.LENGTH_SHORT).show();
        }
        OkHttpClient okHttpClient=new OkHttpClient();
        Request.Builder builder=new Request.Builder();
        FormBody.Builder data = new FormBody.Builder();
        data.add("uesr",username);
        data.add("pwd",pwd);
        Request request=builder.url("http://112.74.204.232:81/"+"login").post(data.build()).build();
        okhttp3.Call call=okHttpClient.newCall(request);
        call.enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {

            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
                final String data=response.body().string();
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        if (data.contains("T")){
                            Intent intent=new Intent(context,Menu.class);
                            startActivity(intent);
                        }
                        else {
                            //bt_login.setText(data);
                            Toast.makeText(context,"请输入正确的用户名密码！",Toast.LENGTH_SHORT).show();
                        }
                    }
                });


            }
        });
    }
}
