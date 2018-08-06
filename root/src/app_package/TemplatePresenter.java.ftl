package ${packageName};

import ${packageName}.bean.${beanClassName};

import java.util.ArrayList;

public class ${objectKind}Presenter implements ${contractClassName}.Presenter {
    private ${contractClassName}.View mView;

    public ${objectKind}Presenter(${contractClassName}.View view) {
        mView = view;
    }

    @Override
    public void load${objectKind}() {
        ArrayList<${objectKind}Bean> beanArrayList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            beanArrayList.add(new ${objectKind}Bean("index: " + i));
        }
        mView.show${objectKind}List(beanArrayList, false);
    }

    @Override
    public void loadMore${objectKind}() {
        ArrayList<${objectKind}Bean> beanArrayList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            beanArrayList.add(new ${objectKind}Bean("more: " + i));
        }
        mView.show${objectKind}List(beanArrayList, true);
    }

    @Override
    public void refresh() {
        ArrayList<${objectKind}Bean> beanArrayList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            beanArrayList.add(new ${objectKind}Bean("refresh: " + i));
        }
        mView.show${objectKind}List(beanArrayList, false);
    }
}
