<!DOCTYPE html>
<html>
<head>
    <base href=" ${basepath}">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title> </title>
	<#include "/public_css.ftl" >
	<link rel="stylesheet" href="new/css/bootstrap-switch.min.css">
    <link rel="stylesheet" href="css/map/map.css">
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
</head>
<body>
<div class="warpper">
    <form role="form" class="select-box border-bottom-style" >
        <table id="data_1">
            <tr>
                <td class="control-label" >设备名称：
                </td>
                <td class="input-group date">
                    <div class="input-group" style="width:300px">
                        <input type="text" class="form-control" id="equipment_id">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                    </div>
                </td>
                <td>
                    <a class="lf-btn blue-btn btn-primary" onclick="locationMap()" >查询</a>
                </td>
            </tr>
        </table>
    </form>
    <!--加载地图  -->
    <div id="allmap"></div>
    <div class="data-container" id="wp-state-panel" style="display: none;">
        <img  src="img/gis/close.jpg" style="z-index:999;width: 25px; height: 25px; line-height: 25px; text-align: center;
         position: absolute; top: 2px; right: 2px; color: rgb(111,111,110);
          font-size: 16px; cursor: pointer;" onclick="$('div.warpper > div.data-container').hide()"></img>
        <div class="top-lay">
            <div class="item-row-name item-row-txt-name"></div>
            <div class="item-row item-row-txt-primary"></div>
            <div class="item-row item-row-txt-time"></div>
        </div>
        <div class="body-lay">
	        <form class="form-inline">
	    		<button type="button" class="btn btn-primary">读数</button>
	    		<button type="button" class="btn btn-success" onclick="openOffonWin();">开关</button>
	    		<button type="button" class="btn btn-info" onclick="openSetTimeWin();">定时</button>
	    		<button type="button" class="btn btn-warning">锁定</button>
	    		<button type="button" class="btn btn-danger">解锁</button>
	        </form>
        </div>
        <div class="bottom-lay">
            <div class="item-row"><span class="item-row-title">电机编号</span><span id="itemp001" class="item-row-txt item-row-txt-pm25">传感器状态</span><span class="item-row-unit">单位</span></div>
            <div class="item-row"><span class="item-row-title">1<sub>#</sub></span><span id="itemp002" class="item-row-txt item-row-txt-pm10">700</span><span class="item-row-unit">r/m</span></div>
            <div class="item-row"><span class="item-row-title">2<sub>#</sub></span><span id="itemp003" class="item-row-txt item-row-txt-so2">750</span><span class="item-row-unit">r/m</span></div>
            <div class="item-row"><span class="item-row-title">3<sub>#</sub></span><span id="itemp009" class="item-row-txt item-row-txt-so2">800</span><span class="item-row-unit">r/m</span></div>
            <div class="item-row"><span class="item-row-title">4<sub>#</sub></span><span id="itemp004" class="item-row-txt item-row-txt-no2">890</span><span class="item-row-unit">r/m</span></div>
            <div class="item-row"><span class="item-row-title">5<sub>#</sub></span><span id="itemp005" class="item-row-txt item-row-txt-co">900</span><span class="item-row-unit">r/m</span></div>
            <div class="item-row"><span class="item-row-title">6<sub>#</sub></span><span id="itemp006" class="item-row-txt item-row-txt-co">670</span><span class="item-row-unit">r/m</span></div>
            <div class="item-row"><span class="item-row-title">7<sub>#</sub></span><span id="itemp007" class="item-row-txt item-row-txt-co">560</span><span class="item-row-unit">r/m</span></div>
            <div class="item-row"><span class="item-row-title">8<sub>#</sub></span><span id="itemp008" class="item-row-txt item-row-txt-o3">768</span><span class="item-row-unit">r/m</span></div>
            <div class="item-row"><span class="item-row-title">9<sub>#</sub></span><span id="itemp008" class="item-row-txt item-row-txt-o3">800</span><span class="item-row-unit">r/m</span></div>
            <div class="item-row"><span class="item-row-title">10<sub>#</sub></span><span id="itemp008" class="item-row-txt item-row-txt-o3">999</span><span class="item-row-unit">r/m</span></div>
        </div>
    </div>
    <div class="panel panel-success data-container2" id="offOnWinId" style="display:none;">
    	<div class="panel-heading">
    		开关面板
    	</div>
    	<div class="panel-body">
			<form class="form-inline">
				<div class="form-group">
					<label class="control-label" for="machine1">1#电机</label>
					<div class="controls">
						<input id="machine1" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="machine2">2#电机</label>
					<div class="controls">
						<input id="machine2" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="machine3">3#电机</label>
					<div class="controls">
						<input id="machine3" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="machine4">4#电机</label>
					<div class="controls">
						<input id="machine4" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="machine5">5#电机</label>
					<div class="controls">
						<input id="machine5" type="checkbox" />
					</div>
				</div>
				<br>
				<div class="form-group">
					<label class="control-label" for="machine6">6#电机</label>
					<div class="controls">
						<input id="machine6" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="machine7">7#电机</label>
					<div class="controls">
						<input id="machine7" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="machine8">8#电机</label>
					<div class="controls">
						<input id="machine8" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="machine9">9#电机</label>
					<div class="controls">
						<input id="machine9" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="machine10">10#电机</label>
					<div class="controls">
						<input id="machine10" type="checkbox" />
					</div>
				</div>
			</form>
		</div>
		<div class="panel-footer">
		<span class="pull-left">
			点击确定后将按设置内容向设备发送远程指令
		</span>
			<button class="btn btn-default" onclick="closeOffonWin()">关闭</button>
			<button class="btn btn-default" onclick="saveOffonData()">确定</button>
		</div>
	</div>
	
	<div class="panel panel-info data-container2" id="setTimeWinId" style="display:none;">
    	<div class="panel-heading">
    		定时设置面板
    	</div>
    	<div class="panel-body">
			<form class="form-inline">
				<div class="form-group">
					<label class="control-label" for="motor1">1#电机</label>
					<div class="controls">
						<input id="motor1" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="motor2">2#电机</label>
					<div class="controls">
						<input id="motor2" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="motor3">3#电机</label>
					<div class="controls">
						<input id="motor3" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="motor4">4#电机</label>
					<div class="controls">
						<input id="motor4" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="motor5">5#电机</label>
					<div class="controls">
						<input id="motor5" type="checkbox" />
					</div>
				</div>
				<br>
				<div class="form-group">
					<label class="control-label" for="motor6">6#电机</label>
					<div class="controls">
						<input id="motor6" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="motor7">7#电机</label>
					<div class="controls">
						<input id="motor7" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="motor8">8#电机</label>
					<div class="controls">
						<input id="motor8" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="motor9">9#电机</label>
					<div class="controls">
						<input id="motor9" type="checkbox" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="motor10">10#电机</label>
					<div class="controls">
						<input id="motor10" type="checkbox" />
					</div>
				</div>
			</form>
		</div>
		<div class="panel-footer">
		<span class="pull-left">
			点击确定后将按设置内容向设备发送远程指令
		</span>
			<button class="btn btn-default" onclick="closeSetTimeWin()">关闭</button>
			<button class="btn btn-default" onclick="saveSetTimeData()">确定</button>
		</div>
	</div>
</div>
</body>
<#include "/public_js.ftl" >
<script type="text/javascript" src="new/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=WzaT655XL9yMmiPr324iGaQHTqmah2cv"></script>
<script type="text/javascript" src="line/linemap.js"></script>
</html>