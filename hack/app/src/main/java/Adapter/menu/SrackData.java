package Adapter.menu;

import android.content.Context;
import android.text.Layout;
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

public class SrackData extends BaseAdapter{
    private Context context;
    private MenuCellData[] SrackDatas=new MenuCellData[]{
            new MenuCellData("FTP检测", R.drawable.ftp),
            new MenuCellData("Mysql检测",R.drawable.mysql),
            new MenuCellData("Mssql检测",R.drawable.mssql),
            //new MenuCellData("Telnet检测",R.drawable.mssql)
    };
    public SrackData(Context context){
        this.context=context;
    }
    public Context getContext(){
        return context;
    }

    @Override
    public int getCount() {
        return SrackDatas.length;
    }

    @Override
    public MenuCellData getItem(int position) {
        return SrackDatas[position];
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LinearLayout ly=null;
        if (convertView!=null){
            ly=(LinearLayout)convertView;
        }
        else {
            ly=(LinearLayout) LayoutInflater.from(getContext()).inflate(R.layout.menu_listview,null);
        }
        MenuCellData data= getItem(position);
        ImageView image=(ImageView) ly.findViewById(R.id.icon_1);
        TextView dec=(TextView) ly.findViewById(R.id.dec);
        image.setImageResource(data.icon_1);
        dec.setText(data.name);
        return ly;
    }
}
