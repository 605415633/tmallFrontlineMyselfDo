package tmalls.util;

/**
 * 这个类专门为分页提供必要的信息。
 * 属性：
 * int start;开始位置
 * int count;每页显示的数量
 * int total;总共有多少条数据
 * String param;参数(这个属性在后续有用到，但是分页的分页查询没有用到，请忽略)
 * @author home-pc
 * @create2017 -08 -06 -11:32
 */
public class Page {
    int start;
    int count;
    int total;
    String param;

    public Page(int start, int count) {
        this.start = start;
        this.count = count;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public boolean isHasPreviouse(){
        if(start==0)
            return false;
        return true;
    }

    public boolean isHasNext(){
//        if(start==ge)
        return true;
    }

    public int getTotalPage(){
        int totalPage;
        //假设总数是50，是能够被5整除的，那么就有10页。
        if(total%count==0)
            totalPage=total/count;
        //假设总数是51，不能被5整除的，那么就有11页。
        else
            totalPage=total/count+1;

        if(totalPage==0)
            totalPage=1;
        return totalPage;

    }

    public int getLast(){
        int last;//最后一页的开始项
        //假设总数是50，是能够被5整除的，那么最后一页的开始就是45.
        if(total%count==0)
            last=total-count;
        //假设总数是51，不能被5整除的，那么最后一页的开始时50.
        else
            last=total-total%count;
        last=last<0?0:last;//用于剔除当总页数为0的情况。
        return last;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }
}
