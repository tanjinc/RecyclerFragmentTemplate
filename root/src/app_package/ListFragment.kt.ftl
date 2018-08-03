package ${packageName};
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v4.widget.SwipeRefreshLayout
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import ${packageName}.bean.${beanClassName}

import java.util.*

class ${className} : Fragment() {

    private var mRecyclerView: RecyclerView? = null
    private var mSwipeRefreshLayout: SwipeRefreshLayout? = null
    private var mAdapter: ${adapterClassName}? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.${fragment_layout_list}, container, false)
        mAdapter = ${adapterClassName}()
        mRecyclerView = view.findViewById<View>(R.id.recycler_view) as RecyclerView
        mRecyclerView?.layoutManager = LinearLayoutManager(context, LinearLayoutManager.VERTICAL, false)
        mRecyclerView?.adapter = mAdapter
        mRecyclerView?.addOnScrollListener(object : RecyclerView.OnScrollListener() {
            internal var lastVisibleItem: Int = 0

            override fun onScrollStateChanged(recyclerView: RecyclerView, newState: Int) {
                super.onScrollStateChanged(recyclerView, newState)
                //判断RecyclerView的状态 是空闲时，且是最后一个可见的item时才加载
                if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisibleItem + 1 == mAdapter?.itemCount) {
                    loadMore()
                }
            }

            override fun onScrolled(recyclerView: RecyclerView, dx: Int, dy: Int) {
                super.onScrolled(recyclerView, dx, dy)
                val layoutManager = recyclerView.layoutManager as LinearLayoutManager?
                //The last visible item
                if (layoutManager != null) {
                    lastVisibleItem = layoutManager.findLastVisibleItemPosition()
                }
            }
        })
        mSwipeRefreshLayout = view.findViewById<View>(R.id.refreshLayout) as SwipeRefreshLayout
        mSwipeRefreshLayout?.setOnRefreshListener { refresh() }
        loadData()
        return view
    }

    private fun loadData() {
        val beanArrayList = ArrayList<${beanClassName}>()
        for (i in 0..9) {
            beanArrayList.add(${beanClassName}("index: $i"))
        }
        mAdapter?.setData(beanArrayList)
    }

    private fun loadMore() {
        val beanArrayList = ArrayList<${beanClassName}>()
        for (i in 0..9) {
            beanArrayList.add(${beanClassName}("more $i"))
        }
        mAdapter?.addFootItems(beanArrayList)
    }

    private fun refresh() {
        val beanArrayList = ArrayList<${beanClassName}>()
        for (i in 0..9) {
            beanArrayList.add(${beanClassName}("refresh: $i"))
        }
        mAdapter?.setData(beanArrayList)
        mSwipeRefreshLayout?.isRefreshing = false
    }
}
