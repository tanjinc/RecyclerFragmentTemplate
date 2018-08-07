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

public class ${adapterClassName} extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private final static int ITEM_TYPE_LOADING = 1000;
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
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if (viewType == ITEM_TYPE_LOADING) {
            View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.${loading_more_layout}, parent, false);
            return new LoadMoreViewHolder(view);
        } else {
            View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.${fragment_layout}, parent, false);
            return new ViewHolder(view);
        }
    }

    @Override
    public void onBindViewHolder(final RecyclerView.ViewHolder viewHolder, int position) {
        if (getItemViewType(position) == ITEM_TYPE_LOADING) {
            LoadMoreViewHolder loadMoreViewHolder = (LoadMoreViewHolder) viewHolder;
            loadMoreViewHolder.loadMoreView.setVisibility(View.VISIBLE);
        } else {
            ViewHolder vh = (ViewHolder) viewHolder;
            vh.mItemName.setText(mDataArray.get(position).getTitle());
        }
    }

    @Override
    public int getItemCount() {
        return mDataArray.size() + 1; //add Loading View
    }


    @Override
    public int getItemViewType(int position) {
        if (position == getItemCount()-1) {
            return ITEM_TYPE_LOADING;
        }
        return super.getItemViewType(position);
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

    public class LoadMoreViewHolder extends RecyclerView.ViewHolder {
        View loadMoreView;

        public LoadMoreViewHolder(View itemView) {
            super(itemView);
            loadMoreView = itemView;
        }
    }
}
