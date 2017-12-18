package login.until;
import android.content.Context;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import static android.R.attr.path;

public class UserinfoUtil {
    public static boolean saveUserInfo(String username, String pwd, Context context){
        try {
            String userinfo = username + "##" + pwd;
            //String path =context.getFilesDir().getPath();
            File file = new File(context.getFilesDir(), "userinfo.txt");
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            fileOutputStream.write(userinfo.getBytes());
            fileOutputStream.close();
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }


    }
    public static Map<String,String> getUserInfo(Context context){
        try {
            //String path = context.getFilesDir().getPath();
            File file = new File(context.getFilesDir(), "userinfo.txt");
            FileInputStream fileOutputStream = new FileInputStream(file);
            BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(fileOutputStream));
            String readline=bufferedReader.readLine();
            String[] split=readline.split("##");
            HashMap<String,String> hashMap= new HashMap<String,String>();
            hashMap.put("username",split[0]);
            hashMap.put("pwd",split[1]);
            bufferedReader.close();
            fileOutputStream.close();
            return hashMap;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
