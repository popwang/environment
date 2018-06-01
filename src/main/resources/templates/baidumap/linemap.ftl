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
     <link rel="stylesheet" href="css/model/rygj.css">
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <style>
        *, p, ul, li { font-family: 'Helvetica Neue', 'Luxi Sans', 'DejaVu Sans', Tahoma, 'Hiragino Sans GB', STHeiti, 'Microsoft YaHei'; margin: 0px; padding: 0px; }
        html, body { background-color: whitesmoke; width: 100%; height: 100%; }
        div.warpper { width: 100%; height: 100%; }
        div.warpper > div.map-container { width: 100%; height: 100%; }
        div.warpper > div.legend-color { width: auto; height: 20px; position: fixed; bottom: 0px; left: 0px; z-index: 9999; background-color: #d4d9d4; padding: 0px; }
        div.warpper > div.legend-color > p.item-title { width: 100%; height: 30px; line-height: 30px; text-align: center; font-size: 14px; color: rgb(0,0,0); }
        div.warpper > div.legend-color > p.item-row { width: 60px; height: 20px; line-height: 20px; display: block; float: left; }
        div.warpper > div.legend-color > p.item-row > span.color { width: 60px; height: 20px; line-height: 20px; display: block; float: left;color: rgb(0,0,0);text-align:center; }
        div.warpper > div.data-container { width: 280px; height: auto; position: fixed; left: 0px; top: 50px; background-color: rgb(255,255,255); border: 2px solid #808080; }
        div.warpper > div.data-container2 { width: 280px; height: 350px; position: fixed; right: 0px; top: 50px; background-color: rgb(255,255,255); border: 2px solid #808080; }
        div.warpper > div.data-container > div.close-icon { width: 25px; height: 25px; line-height: 25px; text-align: center; position: absolute; top: 2px; right: 2px; color: rgb(0,0,0); font-size: 16px; cursor: pointer; }
        div.warpper > div.data-container > div.close-icon:hover { font-weight: bold; }
        div.warpper > div.data-container > div.top-lay { width: 100%; height: 100px; }
        div.warpper > div.data-container > div.top-lay > div.item-row-aqi { width: 100%; height: 120px; padding-top: 10px; }
        div.warpper > div.data-container > div.top-lay > div.item-row-aqi > div.item-row-txt-aqi { width: 120px; height: 120px; margin: 0px auto 0px auto; box-sizing: border-box; border-radius: 60px; border: 10px solid rgb(126,0,35); line-height: 100px; text-align: center; font-size: 40px; font-weight: bold; }
        div.warpper > div.data-container > div.top-lay > div.item-row-name { width: 100%; height: 40px; line-height: 40px; text-align: center; font-weight: bold; }
        div.warpper > div.data-container2 > div.top-lay > div.item-row-name { width: 100%; height: 40px; line-height: 40px; text-align: center; font-weight: bold; }
        div.warpper > div.data-container > div.top-lay > div.item-row { width: 100%; height: 25px; line-height: 25px; text-align: center; font-size: 12px; }
        div.warpper > div.data-container > div.bottom-lay { width: 100%; height: auto; }
        div.warpper > div.data-container > div.bottom-lay > div.item-row { width: 100%; height: 30px; line-height: 30px; border: 1px solid #808080; border-width: 0px 0px 1px 0px; box-sizing: border-box; }
        div.warpper > div.data-container > div.bottom-lay > div.item-row:first-of-type { border-top-width: 1px; }
        div.warpper > div.data-container > div.bottom-lay > div.item-row:last-of-type { border-bottom-width: 0px; }
        div.warpper > div.data-container > div.bottom-lay > div.item-row:nth-of-type(2n+1) { background-color: rgba(0,0,0,0.1); }
        div.warpper > div.data-container > div.bottom-lay > div.item-row > span.item-row-title { width: 100%; height: 29px; line-height: 29px; box-sizing: border-box; display: block; width: 33%; text-align: center; float: left; border-right: 1px solid #808080; }
        div.warpper > div.data-container > div.bottom-lay > div.item-row > span.item-row-txt { width: 100%; height: 29px; line-height: 29px; box-sizing: border-box; display: block; width: 34%; text-align: center; float: left; border-right: 1px solid #808080; }
        div.warpper > div.data-container > div.bottom-lay > div.item-row > span.item-row-unit { width: 100%; height: 29px; line-height: 29px; box-sizing: border-box; display: block; width: 33%; text-align: center; float: left; }
        .BMapLabel span { background: #84BFE2; padding: 2px; }
        .anchorBL, .anchorTL { display: none; }
        .BMapLabel { padding: 0px; }
        .marker-tips { width: auto; height: 20px; line-height: 20px; font-size: 14px; border: none; cursor: pointer; border-radius: 4px; display: block; background-color: #FFFFFF; }
        .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}  
        .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}  
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
    <div class="legend-color" >
        <p class="item-row" ><span class="color" style="background-color: rgb(0,228,0);">优</span></p>
        <p class="item-row"><span class="color" style="background-color: rgb(255,255,0);">良</span></p>
        <p class="item-row"><span class="color" style="background-color: rgb(255,126,0);">轻度污染</span></p>
        <p class="item-row"><span class="color" style="background-color: rgb(255,0,0);">中度污染</span></p>
        <p class="item-row"><span class="color" style="background-color: rgb(153,0,76);">重度污染</span></p>
        <p class="item-row"><span class="color" style="background-color: rgb(126,0,35);">严重污染</span></p>
    </div>
    <div class="data-container" style="display: none;">
        <img  src="img/gis/close.jpg" style="z-index:999;width: 25px; height: 25px; line-height: 25px; text-align: center;
         position: absolute; top: 2px; right: 2px; color: rgb(111,111,110);
          font-size: 16px; cursor: pointer;" onclick="$('div.warpper > div.data-container').hide()"></img>
        <div class="top-lay">
            <div class="item-row-name item-row-txt-name"></div>
            <div class="item-row item-row-txt-primary"></div>
            <div class="item-row item-row-txt-time"></div>
        </div>
        <div class="bottom-lay">
            <div class="item-row"><span class="item-row-title">传感器状态</sub></span><span id="itemp001" class="item-row-txt item-row-txt-pm25"></span><span class="item-row-unit"></span></div>
            <div class="item-row"><span class="item-row-title">PM<sub>2.5</sub></span><span id="itemp002" class="item-row-txt item-row-txt-pm10"></span><span class="item-row-unit">μg/m<sup>3</sup></span></div>
            <div class="item-row"><span class="item-row-title">PM<sub>10</sub></span><span id="itemp003" class="item-row-txt item-row-txt-so2"></span><span class="item-row-unit">μg/m<sup>3</sup></span></div>
            <div class="item-row"><span class="item-row-title">PM<sub>100</sub></span><span id="itemp009" class="item-row-txt item-row-txt-so2"></span><span class="item-row-unit">μg/m<sup>3</sup></span></div>
            <div class="item-row"><span class="item-row-title">风速</span><span id="itemp004" class="item-row-txt item-row-txt-no2"></span><span class="item-row-unit">M/S</span></div>
            <div class="item-row"><span class="item-row-title">风向</span><span id="itemp005" class="item-row-txt item-row-txt-co"></span><span class="item-row-unit">方向</span></div>
            <div class="item-row"><span class="item-row-title">温度</span><span id="itemp006" class="item-row-txt item-row-txt-co"></span><span class="item-row-unit">摄氏度</span></div>
            <div class="item-row"><span class="item-row-title">湿度</span><span id="itemp007" class="item-row-txt item-row-txt-co"></span><span class="item-row-unit">RH%</span></div>
            <div class="item-row"><span class="item-row-title">噪音</span><span id="itemp008" class="item-row-txt item-row-txt-o3"></span><span class="item-row-unit">分贝</span></div>
        </div>
    </div>
</div>
</body>
<#include "/public_js.ftl" >
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=WzaT655XL9yMmiPr324iGaQHTqmah2cv"></script>
<script type="text/javascript" src="line/linemap.js"></script>
</html>