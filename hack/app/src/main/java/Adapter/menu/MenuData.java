package Adapter.menu;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.hack.R;

/**
 * Created by Administrator on 2017/12/4.
 */

public class MenuData extends BaseAdapter {
    private Context context;
    private MenuCellData[] menuCellDatas=new MenuCellData[]{
            new MenuCellData("弱口令", R.drawable.epwd),
            new MenuCellData("XSS检测", R.drawable.xssl),
            new MenuCellData("SQL注入", R.drawable.sql),
            new MenuCellData("FQ二维码", R.drawable.qcode),
    };
    public MenuData(Context context){
        this.context=context;
    }
    public Context getContext(){
        return context;
    }

    @Override
    public int getCount() {
        return menuCellDatas.length;
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public MenuCellData getItem(int position) {
        return menuCellDatas[position];
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LinearLayout ly=null;
        if(convertView!=null){
            ly=(LinearLayout) convertView;
        }
        else {
            ly= (LinearLayout) LayoutInflater.from(getContext()).inflate(R.layout.menu_listview,null);
        }
        MenuCellData data= getItem(position);
        ImageView image=(ImageView) ly.findViewById(R.id.icon_1);
        TextView dec=(TextView) ly.findViewById(R.id.dec);
        image.setImageResource(data.icon_1);
        dec.setText(data.name);
        return ly;
    }
}
