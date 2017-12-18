package com.hack.network.SQLXSS;

import android.os.Handler;
import android.os.Message;

import org.json.JSONObject;

import java.io.IOException;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import static com.hack.R.string.pwd;

public class XSQL {
    private String url="http://112.74.204.232:81/";
    public void getinfo(String method, String ip, Handler handler){
        final String m=method;
        final String p=ip;
        final Handler h=handler;
        new Thread(
                new Runnable() {
                    @Override
                    public void run() {
                        try{
                            OkHttpClient okHttpClient=new OkHttpClient();
                            Request.Builder builder=new Request.Builder();
                            FormBody.Builder pdata = new FormBody.Builder();
                            pdata.add("url",p);
                            Request request=builder.url(url+m).post(pdata.build()).build();
                            Call call=okHttpClient.newCall(request);
                            call.enqueue(new Callback() {
                                @Override
                                public void onFailure(Call call, IOException e) {
                                    e.printStackTrace();
                                }

                                @Override
                                public void onResponse(Call call, Response response) throws IOException {
                                    Message message=new Message();
                                    String data="";
                                    try{
                                        JSONObject jsonObject=new JSONObject(response.body().string());
                                        String status=jsonObject.optString("status");
                                        if (status.equals("1")){
                                            String user=jsonObject.getString("url");
                                            //String pwd=jsonObject.getString("pwd");
                                            data=user;
                                        }
                                        else {
                                            data=jsonObject.optString("dec");
                                        }
                                    }
                                    catch (Exception e){
                                        e.printStackTrace();
                                    }
                                    message.obj=data;
                                    h.sendMessage(message);
                                }
                            });

                        }
                        catch (Exception e){
                            e.printStackTrace();
                        }
                    }
                }
        ).start();

    }
}
