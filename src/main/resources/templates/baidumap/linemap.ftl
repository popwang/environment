<!DOCTYPE html>
<html>
<head>
    <base href=" ${basepath}">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>轨迹图</title>
	<#include "/public_css.ftl" >
	<link rel="stylesheet"	href="js/plugins/bootstrap-switch-master/bootstrap-switch.min2.css" />
    <link rel="stylesheet" href="css/model/rygj.css" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    
    <link rel="stylesheet" href="css/map/map.css" />
    <#include "/public_js.ftl" >
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=WzaT655XL9yMmiPr324iGaQHTqmah2cv"></script>
	<script type="text/javascript" src="js/plugins/bootstrap-switch-master/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="mapjs/linemap.js"></script>
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
    <div class="data-container" style="display: none;">
        <img  src="img/gis/close.jpg" class="map-img" onclick="$('div.warpper > div.data-container').hide()"></img>
        <div class="top-lay">
            <div class="item-row-name item-row-txt-name"></div>
            <div class="item-row item-row-txt-primary text-danger"></div>
            <div class="item-row item-row-txt-time text-primary"></div>
        </div>
        <div class="body-lay">
        	<div class="btn-group">
			  <button type="button" class="btn btn-info">读数</button>
			  <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#offOnWin">开关</button>
			  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#setTimeWin">定时</button>
			  <button type="button" class="btn btn-danger">锁定</button>
			  <button type="button" class="btn btn-success">解锁</button>
			</div>
        </div>
        <div class="bottom-lay">
        	<div class="item-row"><span class="item-row-title">编号</span><span id="itemp000" class="item-row-txt item-row-txt-pm25">当前温度</span><span class="item-row-unit">当前转速</span></div>
            <div class="item-row"><span class="item-row-title">1#电机</span><span id="itemp001" class="item-row-txt item-row-txt-pm25">55℃</span><span class="item-row-unit">3400r/s</span></div>
            <div class="item-row"><span class="item-row-title">2#电机</span><span id="itemp001" class="item-row-txt item-row-txt-pm25">55℃</span><span class="item-row-unit">800r/s</span></div>
            <div class="item-row"><span class="item-row-title">3#电机</span><span id="itemp002" class="item-row-txt item-row-txt-pm10">55℃</span><span class="item-row-unit">340r/s</span></div>
            <div class="item-row"><span class="item-row-title">4#电机</span><span id="itemp003" class="item-row-txt item-row-txt-so2">55℃</span><span class="item-row-unit">300r/s</span></div>
            <div class="item-row"><span class="item-row-title">5#电机</span><span id="itemp009" class="item-row-txt item-row-txt-so2">55℃</span><span class="item-row-unit">400r/s</span></div>
            <div class="item-row"><span class="item-row-title">6#电机</span><span id="itemp004" class="item-row-txt item-row-txt-no2">55℃</span><span class="item-row-unit">500r/s</span></div>
            <div class="item-row"><span class="item-row-title">7#电机</span><span id="itemp005" class="item-row-txt item-row-txt-co">55℃</span><span class="item-row-unit">600r/s</span></div>
            <div class="item-row"><span class="item-row-title">8#电机</span><span id="itemp006" class="item-row-txt item-row-txt-co">55℃</span><span class="item-row-unit">700r/s</span></div>
            <div class="item-row"><span class="item-row-title">9#电机</span><span id="itemp007" class="item-row-txt item-row-txt-co">55℃</span><span class="item-row-unit">400r/s</span></div>
            <div class="item-row"><span class="item-row-title">10#电机</span><span id="itemp008" class="item-row-txt item-row-txt-o3">55℃</span><span class="item-row-unit">390r/s</span></div>
        </div>
    </div>
    <div class="modal fade" id="offOnWin" tabindex="-1" role="dialog">
        	<div class="modal-dialog" role="document">
        		<div class="modal-content">
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        					<span aria-hidden="true">&times;</span>
        				</button>
        				<h4 class="modal-title">开关面板</h4>
        			</div>
        			<div class="modal-body">
        				<form class="form-inline">
						    <div class="form-group">
						        <label class="control-label" for="machine1">1#电机</label>
						        <div class="controls">
						            <div id="switch1" class="switch switch-small"  tabindex="1" 
						            	data-on-label="开" data-off-label="关" data-on="primary" data-off="danger" >
						                <input id="machine1" type="checkbox" checked="checked" />
						            </div>
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="control-label" for="machine2">2#电机</label>
						        <div class="controls">
						            <div id="switch2" class="switch switch-small" tabindex="2" 
						            	data-on-label="开" data-off-label="关" data-on="primary" data-off="danger" >
						                <input id="machine2" type="checkbox" checked="checked" />
						            </div>
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="control-label" for="machine3">3#电机</label>
						        <div class="controls">
						            <div class="switch switch-small" tabindex="3">
						                <input id="machine3" type="checkbox" />
						            </div>
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="control-label" for="machine4">4#电机</label>
						        <div class="controls">
						            <div class="switch switch-small" tabindex="4">
						                <input id="machine4" type="checkbox" />
						            </div>
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="control-label" for="machine5">5#电机</label>
						        <div class="controls">
						            <div class="switch switch-small" tabindex="5">
						                <input id="machine5" type="checkbox" />
						            </div>
						        </div>
						    </div>
						    <br>
						    <div class="form-group">
						        <label class="control-label" for="machine6">6#电机</label>
						        <div class="controls">
						            <div class="switch switch-small" tabindex="6">
						                <input id="machine6" type="checkbox"  />
						            </div>
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="control-label" for="machine7">7#电机</label>
						        <div class="controls">
						            <div class="switch switch-small" tabindex="7">
						                <input id="machine7" type="checkbox" />
						            </div>
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="control-label" for="machine8">8#电机</label>
						        <div class="controls">
						            <div class="switch switch-small" tabindex="8" >
						                <input id="machine8" type="checkbox" />
						            </div>
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="control-label" for="machine9">9#电机</label>
						        <div class="controls">
						            <div class="switch switch-small" tabindex="9">
						                <input id="machine9" type="checkbox" />
						            </div>
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="control-label" for="machine10">10#电机</label>
						        <div class="controls">
						            <div class="switch switch-small" tabindex="10">
						                <input id="machine10" type="checkbox" />
						            </div>
						        </div>
						    </div>
						</form>
        			</div>
        			<div class="modal-footer">
        				<span class="pull-left" style="line-height:30px;">
        					<text class="text-warning">根据需要打开或关闭电机，点击确定后会发送操作指令到设备。</text>
        				</span>
        				<button id="submit-offonwin-btn" onclick="javascript:saveOffonData();" type="button" class="btn btn-primary btn-sm" data-dismiss="modal">保存</button>
        				<button id="cancel-offonwin-btn" type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
        			</div>
        		</div>
        	</div>
     </div>
     
     <div class="modal fade" id="setTimeWin" tabindex="-1" role="dialog">
        	<div class="modal-dialog" role="document">
        		<div class="modal-content">
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        					<span aria-hidden="true">&times;</span>
        				</button>
        				<h4 class="modal-title">定时面板</h4>
        			</div>
        			<div class="modal-body">
        				<form class="form-inline" role="form">
						    <fieldset>
						    	<legend>电机设置</legend>
						    	<div class="form-group">
							        <label class="control-label" for="motor1">1#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="1" >
							                <input id="motor1" type="checkbox" />
							            </div>
							        </div>
							    </div>
							    <div class="form-group">
							        <label class="control-label" for="motor2">2#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="2">
							                <input id="motor2" type="checkbox" />
							            </div>
							        </div>
							    </div>
							    <div class="form-group">
							        <label class="control-label" for="motor3">3#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="3">
							                <input id="motor3" type="checkbox" />
							            </div>
							        </div>
							    </div>
							    <div class="form-group">
							        <label class="control-label" for="motor4">4#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="4">
							                <input id="motor4" type="checkbox" />
							            </div>
							        </div>
							    </div>
							    <div class="form-group">
							        <label class="control-label" for="motor5">5#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="5">
							                <input id="motor5" type="checkbox" />
							            </div>
							        </div>
							    </div>
							    <br>
							    <div class="form-group">
							        <label class="control-label" for="motor6">6#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="6">
							                <input id="motor6" type="checkbox"  />
							            </div>
							        </div>
							    </div>
							    <div class="form-group">
							        <label class="control-label" for="motor7">7#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="7">
							                <input id="motor7" type="checkbox" />
							            </div>
							        </div>
							    </div>
							    <div class="form-group">
							        <label class="control-label" for="motor8">8#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="8" >
							                <input id="motor8" type="checkbox" />
							            </div>
							        </div>
							    </div>
							    <div class="form-group">
							        <label class="control-label" for="motor9">9#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="9">
							                <input id="motor9" type="checkbox" />
							            </div>
							        </div>
							    </div>
							    <div class="form-group">
							        <label class="control-label" for="motor10">10#电机</label>
							        <div class="controls">
							            <div class="switch switch-small" tabindex="10">
							                <input id="motor10" type="checkbox" />
							            </div>
							        </div>
							    </div>
						    </fieldset>
						    <br>
						    <fieldset>
						    	<legend>定时设置</legend>
						    	<div class="control-group">      
						    		<label class="control-label" for="stime">开始时间     </label>  
							    	<select  class="input-xlarge" id="stime">
							    		<option value="8">8:00</option> 
							    		<option value="8:30">8:30</option> 
							    		<option value="9:30">9:00</option>    
									</select>    
						    	</div>
						    	<br>
						    	<div class="control-group">      
						    		<label class="control-label" for="etime">结束时间</label>      
							    	<select class="input-xlarge" id="etime">
							    		<option value="8">8:00</option> 
							    		<option value="8:30">8:30</option> 
							    		<option value="9:30">9:00</option> 
							    	</select>   
						    	</div>
						    	<br>
						    	<div class="control-group">      
						    		<label class="control-label " for="resttime">工作间隔</label>      
							    	<select class="input-xlarge" id="resttime"> 
							    		<option value="30">30</option> 
							    		<option value="60">60</option> 
							    		<option value="120">120</option> 
							    	</select>   
						    	</div>
						    	<br>
						    	<div class="control-group">    
						    		<label class="control-label" for="worktime">工作时长</label>      
							    	<select  class="input-xlarge" id="worktime">
							    		<option value="5">5</option> 
							    		<option value="10">10</option> 
							    		<option value="15">15</option> 
							    		<option value="20">30</option> 
							    		<option value="45">45</option> 
							    	</select>
						    	</div>
						    </fieldset>
						</form>
        			</div>
        			<div class="modal-footer">
        				<span class="pull-left" style="line-height:30px;">
        					说明文字
        				</span>
        				<button id="submit-settimewin-btn" type="button" class="btn btn-primary btn-sm" data-dismiss="modal">保存</button>
        				<button id="cancel-settimewin-btn" type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
        			</div>
        		</div>
        	</div>
     </div>
</div>
</body>
</html>