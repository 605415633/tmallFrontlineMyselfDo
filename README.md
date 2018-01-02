# SSM_version_imitate_tmall（模仿天猫SSM项目）
# 使用方式 # 
下载好项目后，需要打开Tomcat目录，再打开conf目录，然后打开server.xml。找到最下面的<Host>。在标签其中添加如下内容。
<Context path="/" docBase="G:\\tmallFrontlineMyselfDo\\web" debug="0" reloadable="false" />
其中，Context path代表上下文路径，也就是你的URL。 doBase代表你的项目根目录。reloadable代表自动重载。不要自动重载，这个功能Tomcat本身做的不够完善，会带来意想不到的问题。
然后保存。启动Tomcat，打开浏览器，输入“http://localhost:8080/forehome”
即进入了首页，如果想访问管理员系统。访问“http://localhost:8080/admin_category_list”
