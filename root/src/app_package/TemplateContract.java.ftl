package ${packageName};

import ${packageName}.bean.${beanClassName};

import java.util.List;

public class ${contractClassName} {

    public interface View {
        void show${objectKind}List(List<${beanClassName}> ${objectKind}List, boolean isAppend);
        void setPresenter(Presenter presenter);
    }

    public interface Presenter {
        void load${objectKind}();       //加载数据
        void loadMore${objectKind}();   //加载更多
        void refresh();         //刷新
    }
}
