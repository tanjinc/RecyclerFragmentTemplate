package ${packageName};


import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

import android.widget.TextView
import ${packageName}.R

import ${packageName}.bean.${beanClassName}

class ${adapterClassName} : RecyclerView.Adapter<RecyclerView.ViewHolder>() {
    private val ITEM_TYPE_LOADING = 1000

    private var mDataArray: MutableList<${beanClassName}> = mutableListOf()

    fun setData(items: MutableList<${beanClassName}>) {
        mDataArray = items
        notifyDataSetChanged()
    }

    fun addFootItems(items: MutableList<${beanClassName}>) {
        mDataArray.addAll(items)
        notifyDataSetChanged()
    }

    fun addHeaderItems(items: MutableList<${beanClassName}>) {
        mDataArray.addAll(0, items)
        notifyDataSetChanged()
    }


    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        return if (viewType == ITEM_TYPE_LOADING) {
            val view = LayoutInflater.from(parent.context).inflate(R.layout.${loading_more_layout}, parent, false)
            LoadMoreViewHolder(view)
        } else {
            val view = LayoutInflater.from(parent.context).inflate(R.layout.${fragment_layout}, parent, false)
            ViewHolder(view)
        }
    }

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, position: Int) {
        if (getItemViewType(position) == ITEM_TYPE_LOADING) {
            val loadMoreViewHolder = viewHolder as LoadMoreViewHolder
            loadMoreViewHolder.loadMoreView.visibility = View.VISIBLE
        } else {
            val vh = viewHolder as ViewHolder
            vh.mItemName.text = mDataArray[position].title
        }
    }


    override fun getItemCount(): Int {
        return mDataArray.size + 1 //add Loading View
    }

    override fun getItemViewType(position: Int): Int {
        return if (position == itemCount - 1) {
            ITEM_TYPE_LOADING
        } else super.getItemViewType(position)
    }

    inner class ViewHolder(mView: View) : RecyclerView.ViewHolder(mView) {
         var mItemName: TextView = mView.findViewById(R.id.item_number) as TextView
    }
    
    inner class LoadMoreViewHolder(internal var loadMoreView: View) : RecyclerView.ViewHolder(loadMoreView)

}
