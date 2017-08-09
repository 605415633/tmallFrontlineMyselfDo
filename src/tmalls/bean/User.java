package tmalls.bean;

/**
 * 用户信息
 *
 * @author home-pc
 * @create2017 -08 -02 -11:16
 */
public class User {
    private String password;
    private String name;
    private int id;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    /**
     * 该方法是用来获取本用户的匿名名称，在评价的时候显示用户名使用。
     * @return
     */
    public String getAnonymousName(){
        if(name==null)
            return null;
        if(name.length()<=1)
            return "*";
    if(name.length()==2)
        return name.substring(0,1)+"*";
    char[] cs=name.toCharArray();//将名字转换为字符数组
        for(int i=1;i<cs.length-1;i++)
            cs[i]='*';
        return new String(cs);

    }

}
