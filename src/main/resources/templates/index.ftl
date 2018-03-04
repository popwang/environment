<!DOCTYPE html>
<html class="gwd_" lang="en"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"><style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide:not(.ng-hide-animate){display:none !important;}ng\:form{display:block;}.ng-animate-shim{visibility:hidden;}.ng-anchor{position:absolute;}</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <style>
        body {
            padding-top: 60px;
        }
    </style>
    <title>系统</title>
    <link href="login/bootstrap.css" rel="stylesheet">

    <link href="login/login-register.css" rel="stylesheet">
    <link rel="stylesheet" href="login/font-awesome.css">

    <script src="login/jquery-3.js" type="text/javascript"></script>
    <script src="login/bootstrap.js" type="text/javascript"></script>
    <script src="login/login-register.js" type="text/javascript"></script>
    <script src="login/login.js">

    </script>
    <script src="login/angular.js"></script>
    <script src="login/toaster.js">

    </script><script src="login/angular-animate.js">

</script><link href="login/toaster.css" rel="stylesheet"><style type="text/css">#kf-content-div a,
#kf-content-div p {
    border: 0px !important;
    padding: 0px !important;
    margin: 0px !important;
}

#kf-wiki-div a:hover,
#kf-content-div a:focus {
    text-decoration: none !important;
}

#kf-wiki-div a {
    text-decoration: none !important;
    color: #0645AD !important;
    background: none repeat scroll 0% 0% transparent !important;
}

#kf-wiki-div dt {
    margin-bottom: 0.1em !important;
    font-weight: bold !important;
}

#kf-wiki-div dd {
    margin-left: 1.6em !important;
    margin-bottom: 0.1em !important;
}

/**************/
#kf-my-add-btn {
    display: none;
    height: 18px;
    width: 18px;
    position: fixed;
    z-index: 2147483647;
    line-height: 18px;
    text-decoration: none;
    font: bold 12px/25px Arial;
    color: rgba(62, 87, 6, 0.53);
    background: -moz-linear-gradient(center top, rgba(165, 205, 78, 1) 0%, rgba(107, 143, 26, 1) 100%);
    opacity: 0.55;
    text-shadow: 1px 1px 1px rgba(255, 255, 255, .22);
    border-radius: 18px;
    box-shadow: 1px 1px 1px rgba(0, 0, 0, .29), inset 1px 1px 1px rgba(255, 255, 255, .44);
    transition: all 0.15s ease;
}

#kf-my-add-btn {
    color: rgba(62, 87, 6, 0.53);
    opacity: 0.55;
}

#kf-my-add-btn:hover {
    color: rgba(62, 87, 6, 1);
    opacity: 1;
}

#kf-add-loading-img {
    display: none;
    height: 24px;
    width: 24px;
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 2147483647;
    border-radius: 24px;
    box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.29), 1px 1px 1px rgba(255, 255, 255, 0.24) inset;
}

#kf-content-div {
    opacity: 0;
    display: none;
    width: 320px;
    position: fixed;
    right: 20px;
    bottom: -190px;
    z-index: 2147483647;
    font: normal 12px/25px Arial, sans-serif;
    color: #222;
    background: transparent;
}

#kf-top-div {
    height: 40px;
    width: 320px;
    background: rgba(0, 0, 0, .05);
    border-radius: 20px 20px 0px 0px;
    line-height: 40px;
    text-align: center;
}

#kf-wiki-tab {
    width: 160px;
    color: rgba(255, 255, 255, .88);
    text-decoration: none;
    background: rgba(0, 152, 249, .6);
    float: left;
    font-size: 1em;
    border-radius: 20px 20px 0px 0px;
}

#kf-translator-tab {
    width: 160px;
    color: rgba(0, 0, 0, 0.25);
    text-decoration: none;
    background: transparent;
    font-size: 1em;
    float: left;
    border-radius: 20px 20px 0px 0px;
}

#kf-frame-div {
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.33);
    text-align: left;
}

#kf-trans-div{
    font-weight: bold;width:300px;height:auto;background:rgba(233, 233, 233, 1);opacity:.8;padding:10px;max-height:190px;overflow:auto;
}

#kf-wiki-div {
    width: 300px;
    max-height: 190px;
    padding: 10px;
    background: #E9E9E9;
    opacity: 0.8;
    border: 0px;
    overflow: auto;
}

/*******/
.tipso_bubble,.tipso_bubble>.tipso_arrow{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.tipso_bubble{position:absolute;text-align:center;border-radius:6px;z-index:9999;padding:10px}.tipso_style{cursor:help;border-bottom:1px dotted}.tipso_bubble>.tipso_arrow{position:absolute;width:0;height:0;border:8px solid;pointer-events:none}.tipso_bubble.top>.tipso_arrow{border-color:#000 transparent transparent;top:100%;left:50%;margin-left:-8px}.tipso_bubble.bottom>.tipso_arrow{border-color:transparent transparent #000;bottom:100%;left:50%;margin-left:-8px}.tipso_bubble.left>.tipso_arrow{border-color:transparent transparent transparent #000;top:50%;left:100%;margin-top:-8px}.tipso_bubble.right>.tipso_arrow{border-color:transparent #000 transparent transparent;top:50%;right:100%;margin-top:-8px}</style></head>



<body id="body" ng-app="myApp" ng-controller="myCtrl" style="height: 636px;" class="ng-scope">
<div align="center">
    <div id="toast-container" ng-class="[config.position, config.animation]" class="ng-scope toast-top-right"><!-- ngRepeat: toaster in toasters --></div>
</div>
<nav class="bg-canvas">
    <iframe name="htm" src="img/bg-blue.jpg"></iframe>
</nav>
<section class="cont">
    <section>
        <nav class="cont_left">
            <p style="text-align:right;">
            	<h1>欢迎使用扬尘监测系统</h1>
            </p>
            <p style="text-align:right; font-size: 20px;">绿水青山就是金山银山</p>
            <p></p>
        </nav>
        <nav class="cont_right">
            <h2>平台登陆</h2>
            <div class="form-group">
                <p>
                    <i class="fa fa-user"></i><input class="form-control" id="username" name="login" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" maxlength="20" placeholder="请输入用户名" style="" type="text">
                </p>
                <p>
                    <i class="fa fa-key"></i> <input class="form-control" id="password" name="pwdPrompt" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" maxlength="20" placeholder="请输入密码" style="" type="password"> <input onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" class="form-control" id="exampleInputPassword3" name="pwd" maxlength="20" placeholder="请输入密码" style="display: none;" type="text">
                    <a class="eye"><i class="fa fa-eye-slash"></i></a>
                </p>
            </div>
            <button type="button" class="btn btn-primary btn-lg btn-block" id="login_btn" ng-click="clickk()" style="">登录</button>
            <div class="modal-footer" style="border-top: 1px solid black;">
            </div>

        </nav>
    </section>
</section>

<div class="modal fade login" id="loginModal">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">用户注册</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="social">
                            <div align="left">
                                <select ng-model="juese" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" ng-options="x.roleid as x.rolename for x in roles" ng-change="roleChange()" style="float: left; color: blue; width: 33%;"><option label="高管" value="number:1">高管</option><option label="部门经理" value="number:2">部门经理</option><option label="项目经理" value="number:3">项目经理</option><option label="员工" value="number:4" selected="selected">员工</option></select> <select ng-model="bumen" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-options="x.id as x.name for x in deptInfo" style="float: left; color: blue; width: 33%;" ng-show="isShowbumen"><option value="?" selected="selected"></option></select> <select ng-model="xiangmu" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-options="x.id as x.name for x in projectInfo" ng-show="isShowxiangmu" style="float: left; color: blue; width: 33%;"><option value="?" selected="selected"></option></select>
                            </div>
                        </div>
                        <div class="division">
                            <div class="line l"></div>
                            <span>账号信息</span>
                            <div class="line r"></div>
                        </div>
                        <div class="error"></div>
                    </div>
                </div>
                <div class="box">
                    <div class="content registerBox">
                        <div class="form">
                            <form method="post" html="{:multipart=&gt;true}" data-remote="true" action="/register" accept-charset="UTF-8" class="ng-pristine ng-valid">
                                <input id="usernameRe" class="form-control" placeholder="用户姓名" name="username" type="text"> <input id="loginnameRe" class="form-control" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" placeholder="登录名" name="loginname" type="text"> <input id="passwordRe" class="form-control" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" placeholder="密码" name="password" type="password"> <input id="password_confirmationRe" class="form-control" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" placeholder="重复密码" name="password_confirmation" type="password"> <input class="btn btn-default btn-register" value="注册" name="commit" ng-click="registerClick()" type="button">
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>



<div id="GWDANG_HAS_BUILT"></div><div id="kf-my-tips" style="position: fixed;" class="tipso_style"></div><a id="kf-my-add-btn" name="ke-my-add-btn" href="javascript:void(0);" style="background-image: url(&quot;data:image/gif;base64,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&quot;); background-size: 18px 18px;"></a><div id="kf-add-loading-img" style="background-image: url(&quot;data:image/gif;base64,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&quot;);"></div><div style="display: none; right: 20px; bottom: -90px;" id="kf-content-div"><div id="kf-top-div"><a id="kf-wiki-tab" href="javascript:void(0)" style="color: rgba(0, 0, 0, 0.25); background: transparent none repeat scroll 0% 0%;">WIKIPEDIA</a><a id="kf-translator-tab" href="javascript:void(0)" style="color: rgba(255, 255, 255, 0.88); background: rgba(56, 189, 15, 0.6) none repeat scroll 0% 0%;">	TRANSLATOR</a></div><div id="kf-frame-div"><div id="kf-trans-div" style="font-size: 1em;">So happy</div><div id="kf-wiki-div" name="kf-wiki-div" style="display: none; font-size: 1em;"></div></div></div></body></html>