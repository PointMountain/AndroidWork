package com.hack;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.TextView;

import com.igexin.sdk.PushManager;

public class Qcode extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        PushManager.getInstance().initialize(this.getApplicationContext(), com.server.getui.DemoPushService.class);
        PushManager.getInstance().registerPushIntentService(this.getApplicationContext(), com.server.getui.DemoIntentService.class);
        //1.获取控件info
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_qcode);
        Intent intent=getIntent();
        String url=intent.getStringExtra("url");
        WebView webView;
        webView=(WebView)findViewById(R.id.webView1);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.setWebViewClient(new WebViewClient());
        webView.loadUrl(url);
    }

}
