<html>
<head>
<title>hello</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<?
//获得表单提交数据
$username=$_POST['uname'];
$password=$_POST['upass'];
$submit=$_POST['submit'];
//剔除两端的空格
$username=trim($username);
$password=trim($password);
//如果其中任意一个为空，就转到登录页面
if($username=="" || $password=="")
{
    echo("<script>");
    echo("location.href='index.html'");
    echo("</script>");
}
//连接MYSQL
$conn=mysql_connect("127.0.0.1","root","");
if(!$conn)
{
    die("不好意思，好像出错了！");
}
//指定数据库
$result=mysql_select_db("root",$conn);
if(!$result)
{
    mysql_close($conn);
    die("不好意思，好像出错了！");
}
//设定字符集
mysql_query("set names utf8");

if($submit=="login")
{
    //判断用户是否存在
    $sql="select * from t_user where uname='" . $username . "' and upass='" . $password . "'";
    //echo($sql);
    $rs=mysql_query($sql);//运行sql
    $rows=mysql_num_rows($rs);//得到返回的行数
    if($rows>0)//用户已经存在
    {
        echo("<center><font color='red'>登录成功!!</font><br><br>");
    }
    else//不存在
    {
        echo("<center><font color='red'>对不起！登录失败，请检查你的用户名或密码!!</font><br><br>");
        echo("<a href='index.html'>返回</a></center>");
    }

}
else if($submit=="register")
{
    //判断用户是否存在
    $sql="select * from t_user where uname='" . $username . "'";
    echo($sql);
    $rs=mysql_query($sql);//运行sql
    $rows=mysql_num_rows($rs);//得到返回的行数
    if($rows>0)//用户已经存在
    {
        echo("<center><font color='red'>对不起！您要注册的用户已经存在，请更换用户名后再注册!!</font><br><br>");
        echo("<a href='index.html'>返回</a></center>");
    }
    else//不存在
    {
        $sql="insert into t_user(uname,upass) values('" . $username . "','" . $password . "')";
        $result=mysql_query($sql);//运行sql
        if($result)
        {
            echo("<center><font color='red'>恭喜你，注册成功，你可以去登录了!!</font><br><br>");
            echo("<a href='index.html'>返回</a></center>");
        }
        else
        {
            echo("<center><font color='red'>对不起，注册失败，请稍后再做!!</font><br><br>");
            echo("<a href='index.html'>返回</a></center>");
        }
    }
}
mysql_close($conn);
?>
</table>
</body>
</html>
