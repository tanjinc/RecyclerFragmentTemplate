package ${packageName};

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;
import android.widget.TextView;

<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>
import ${packageName}.bean.${beanClassName};

public class ${adapterClassName} extends RecyclerView.Adapter<${adapterClassName}.ViewHolder> {

    private List<${beanClassName}> mDataArray = new ArrayList<>();

    public ${adapterClassName}() {
    }

    public void setData(List<${beanClassName}> items) {
        mDataArray = items;
        notifyDataSetChanged();
    }

    public void addFootItems(List<${beanClassName}> items) {
        mDataArray.addAll(items);
        notifyDataSetChanged();
    }

    public void addHeaderItems(List<${beanClassName}> items) {
        mDataArray.addAll(0, items);
        notifyDataSetChanged();
    }


    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.${fragment_layout}, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(final ViewHolder holder, int position) {
        holder.mItemName.setText(mDataArray.get(position).getTitle());
    }

    @Override
    public int getItemCount() {
        return mDataArray.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        public final View mView;
        TextView mItemName;

        public ViewHolder(View view) {
            super(view);
            mView = view;
            mItemName = (TextView)view.findViewById(R.id.item_number);
        }
    }
}
