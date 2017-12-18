package com.hack;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.igexin.sdk.PushManager;

import Adapter.menu.MenuCellData;
import Adapter.menu.MenuData;

public class Menu extends AppCompatActivity implements AdapterView.OnItemClickListener {

    private MenuData menuData;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        PushManager.getInstance().initialize(this.getApplicationContext(), com.server.getui.DemoPushService.class);
        PushManager.getInstance().registerPushIntentService(this.getApplicationContext(), com.server.getui.DemoIntentService.class);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);
        menuData=new MenuData(this);
        ListView root=(ListView)findViewById(R.id.menu_listview);
        root.setAdapter(menuData);
        root.setOnItemClickListener(this);
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        MenuCellData menuCellData =(MenuCellData) menuData.getItem(position);
        switch (menuCellData.name){
            case "弱口令":
                Intent intent1=new Intent(this,Srcak.class);
                startActivity(intent1);
                break;
            case "XSS检测":
                Intent intent2=new Intent(this,SQLXSS.class);
                intent2.putExtra("kind","xss");
                startActivity(intent2);
                break;
            case "SQL注入":
                Intent intent3=new Intent(this,SQLXSS.class);
                intent3.putExtra("kind","sqlmap");
                startActivity(intent3);
                break;
            case "FQ二维码":
                Intent intent=new Intent(this,Qcode.class);
                intent.putExtra("url","http://112.74.204.232:81");
                startActivity(intent);
        }
    }
}
