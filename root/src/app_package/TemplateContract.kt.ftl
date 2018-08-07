package ${packageName};

import ${packageName}.bean.${beanClassName}

class ${contractClassName} {

    interface View {
        fun show${objectKind}List(${objectKind}List: MutableList<${beanClassName}>, isAppend: Boolean)

        fun setPresenter(presenter: Presenter)
    }

    interface Presenter {
        fun load${objectKind}()        //加载数据

        fun loadMore${objectKind}()    //加载更多

        fun refresh()          //刷新
    }
}
