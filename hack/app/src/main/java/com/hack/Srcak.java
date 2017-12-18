package com.hack;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.LinearLayout;
import android.widget.ListView;

import com.igexin.sdk.PushManager;

import Adapter.menu.MenuCellData;
import Adapter.menu.SrackData;

public class Srcak extends AppCompatActivity implements AdapterView.OnItemClickListener {

    private SrackData srackData;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        PushManager.getInstance().initialize(this.getApplicationContext(), com.server.getui.DemoPushService.class);
        PushManager.getInstance().registerPushIntentService(this.getApplicationContext(), com.server.getui.DemoIntentService.class);
        //1.获取控件info
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_srcak);
        srackData=new SrackData(this);
        ListView root=(ListView)findViewById(R.id.srack);
        root.setAdapter(srackData);
        root.setOnItemClickListener(this);
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        MenuCellData menuCellData=(MenuCellData)srackData.getItem(position);
        Intent intent =new Intent(this,Srcakpwd.class);
        switch (menuCellData.name){
            case "FTP检测":
                intent.putExtra("kind","scrackftp");
                startActivity(intent);
                break;
            case "Mysql检测":
                intent.putExtra("kind","scrackmysql");
                startActivity(intent);
                break;
            case "Mssql检测":
                intent.putExtra("kind","scrackmssql");
                startActivity(intent);
                break;
//            case "Telnet检测":
//                intent.putExtra("kind","scracktelnet");
//                startActivity(intent);
//                break;
        }
    }
}
