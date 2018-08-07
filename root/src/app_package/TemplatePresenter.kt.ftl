package ${packageName};

import ${packageName}.bean.${beanClassName}

import java.util.ArrayList

class ${objectKind}Presenter(private val mView: ${objectKind}Contract.View) : ${contractClassName}.Presenter {

    override fun load${objectKind}() {
        val beanArrayList = ArrayList<${objectKind}Bean>()
        for (i in 0..9) {
            beanArrayList.add(${objectKind}Bean("index: $i"))
        }
        mView.show${objectKind}List(beanArrayList, false)
    }

    override fun loadMore${objectKind}() {
        val beanArrayList = ArrayList<${objectKind}Bean>()
        for (i in 0..9) {
            beanArrayList.add(${objectKind}Bean("more: $i"))
        }
        mView.show${objectKind}List(beanArrayList, true)
    }

    override fun refresh() {
        val beanArrayList = ArrayList<${objectKind}Bean>()
        for (i in 0..9) {
            beanArrayList.add(${objectKind}Bean("refresh: $i"))
        }
        mView.show${objectKind}List(beanArrayList, false)
    }
}
