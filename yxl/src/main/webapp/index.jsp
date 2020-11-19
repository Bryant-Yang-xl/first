<%--
  Created by IntelliJ IDEA.
  User: 暗夜公爵
  Date: 2020/6/30
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>仓库管理员管理</title>
    <link rel="icon" href="/plugins/lightyear/images/favicon.ico" type="image/ico">
    <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
    <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
    <meta name="author" content="xiaolong">
    <link href="/plugins/lightyear/css/bootstrap.min.css" rel="stylesheet">
    <link href="/plugins/lightyear/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/plugins/lightyear/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
</head>
<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--头部信息-->
        <header class="lyear-layout-header">
        </header>

        <script type="text/javascript" src="/plugins/lightyear/js/jquery.min.js"></script>
        <script type="text/javascript" src="/plugins/lightyear/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/plugins/lightyear/js/perfect-scrollbar.min.js"></script>
        <script type="text/javascript" src="/plugins/lightyear/js/main.min.js"></script>


        <main class="lyear-layout-content">
            <div class="">
                <%--搜索--%>
                <div class="demoTable">
                    用户名：
                    <div class="layui-inline">
                        <input class="layui-input" name="name" id="name" autocomplete="off">
                    </div>
                    <button class="layui-btn" data-type="reload">搜索</button>

                    <button class="layui-btn layui-btn" onclick="add();">新增</button>
                </div>
                <!-- 内容主体区域 -->
                <table class="layui-hide" id="test" lay-filter="test"></table>

                <script type="text/html" id="toolbarDemo">
                    <div class="layui-btn-container">

                    </div>
                </script>
                <script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
            </div>
        </main>
    </div>
</div>

<%--layui--%>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>

<!-- 第二步 引入echarts -->
<%--<script type="text/javascript" src="${pageContext.request.contextPath }/plugins/echarts-4.2.1/echarts.min.js"></script>--%>

<!-- jquery js ajax-->
<script type="text/javascript" src="${pageContext.request.contextPath }/plugins/jquery/jquery.min.js"></script>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });

 /*   layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/use/userPageData'
            ,cols: [
                [
                    {checkbox: true, fixed: true},
                    {field:'user_id', width:80, title: 'ID', sort: true}
                    ,{field:'username', width:80, title: '用户名'}
                    ,{field:'password', width:80, title: '密码', sort: true}
                    ,{field:'name', width:80, title: '昵称'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]
            ]
            ,page: true
            ,id: 'testReload'
        });

        var $ = layui.$, active = {
            reload: function(){
                var name = $('#name');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        name: name.val()
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除么', function(index){
                    /!*obj.del();
                    layer.close(index);*!/
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json",//上传内容格式为json结构
                        async: true,
                        url: "userDel?user_id="+data.user_id,     //请求的url。与后端@Request Mapping注解中的值一致。
                        success: function (data) {          //请求成功的回调函数
                            console.log(data);
                            //提示层
                            if (data.statusCode === 200) {
                                layer.msg('删除成功');
                                window.location.href = 'toUserMain';
                            }

                        }, error: function (e) {           //请求失败的回调函数
                            layer.msg('删除失败');
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                /!*layer.prompt({
                    formType: 2
                    ,value: data.username
                }, function(value, index){
                    obj.update({
                        username: value
                    });
                    layer.close(index);
                });*!/
                layer.open({
                    type: 2,
                    title: '编辑',
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['893px', '600px'],
                    content: '/use/toUserAdd?user_id='+data.user_id
                });
            }
        });
    });
*/
   /*
    function add() {
        //iframe窗
        layer.open({
            type: 2,
            title: '新增',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['600px', '600px'],
            content: '/use/toUserAdd'
        });
    }*/

    var form = layui.form;
    //监听提交
    form.on('submit(login)', function(data){
        // 利用ajax 去提交数据
        $.ajax({
            type: "post",// 请求方法
            url: "/Employee",// 后台的接口地址
            data: data.field, // 传递到后端的数据
            dataType: "json", // 后端返回的数据类型
            success:function (data) {// 成功的回调
                console.log(data);
            }
        });

        return false;
    });

</script>


</body>
</html>
