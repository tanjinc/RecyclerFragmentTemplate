package ${packageName};

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import ${packageName}.bean.${beanClassName};

import java.util.ArrayList;

public class ${className} extends Fragment {

    private RecyclerView mRecyclerView;
    private SwipeRefreshLayout mSwipeRefreshLayout;
    private ${adapterClassName} mAdapter;

    public ${className}() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.${fragment_layout_list}, container, false);
        mAdapter = new ${adapterClassName}();
        mRecyclerView = view.findViewById(R.id.recycler_view);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(getContext(), LinearLayoutManager.VERTICAL, false));
        mRecyclerView.setAdapter(mAdapter);
        mRecyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            int lastVisibleItem;
            @Override
            public void onScrollStateChanged(@NonNull RecyclerView recyclerView, int newState) {
                super.onScrollStateChanged(recyclerView, newState);
                //判断RecyclerView的状态 是空闲时，且是最后一个可见的item时才加载
                if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisibleItem+1 == mAdapter.getItemCount()) {
                    loadMore();
                }
            }

            @Override
            public void onScrolled(@NonNull RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
                LinearLayoutManager layoutManager = (LinearLayoutManager) recyclerView.getLayoutManager();
                //The last visible item
                if (layoutManager != null) {
                    lastVisibleItem=layoutManager.findLastVisibleItemPosition();
                }
            }
        });
        mSwipeRefreshLayout = view.findViewById(R.id.refreshLayout);
        mSwipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                refresh();
            }
        });
        loadData();
        return view;
    }

    private void loadData() {
        ArrayList<${beanClassName}> beanArrayList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            beanArrayList.add(new ${beanClassName}("index: " + i));
        }
        mAdapter.setData(beanArrayList);
    }

    private void loadMore() {
        ArrayList<${beanClassName}> beanArrayList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            beanArrayList.add(new ${beanClassName}("more " + i));
        }
        mAdapter.addFootItems(beanArrayList);
    }

    public void refresh() {
        ArrayList<${beanClassName}> beanArrayList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            beanArrayList.add(new ${beanClassName}("refresh: " + i));
        }
        mAdapter.setData(beanArrayList);
        mSwipeRefreshLayout.setRefreshing(false);
    }
}
