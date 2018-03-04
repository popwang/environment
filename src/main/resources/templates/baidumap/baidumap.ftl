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
        /*div.warpper > div.legend-color > p.item-row > span.level { width: 20px; height: 20px; line-height: 20px; display: block; float: left; text-align: center; font-size: 10px; color: rgb(0,0,0); }*/
        div.warpper > div.data-container { width: 280px; height: auto; position: fixed; left: 0px; top: 50px; background-color: rgb(255,255,255); border: 2px solid #808080; }
        div.warpper > div.data-container > div.close-icon { width: 25px; height: 25px; line-height: 25px; text-align: center; position: absolute; top: 2px; right: 2px; color: rgb(0,0,0); font-size: 16px; cursor: pointer; }
        div.warpper > div.data-container > div.close-icon:hover { font-weight: bold; }
        div.warpper > div.data-container > div.top-lay { width: 100%; height: 100px; }
        div.warpper > div.data-container > div.top-lay > div.item-row-aqi { width: 100%; height: 120px; padding-top: 10px; }
        div.warpper > div.data-container > div.top-lay > div.item-row-aqi > div.item-row-txt-aqi { width: 120px; height: 120px; margin: 0px auto 0px auto; box-sizing: border-box; border-radius: 60px; border: 10px solid rgb(126,0,35); line-height: 100px; text-align: center; font-size: 40px; font-weight: bold; }
        div.warpper > div.data-container > div.top-lay > div.item-row-name { width: 100%; height: 40px; line-height: 40px; text-align: center; font-weight: bold; }
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
        /*background-color: #84bfe2;*/
        .marker-tips { width: auto; height: 20px; line-height: 20px; font-size: 14px; border: none; cursor: pointer; border-radius: 4px; display: block; background-color: #FFFFFF; }
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
<script>
    var map = new BMap.Map("allmap");    // 创建Map实例
    var Level_Icon = [
        new BMap.Icon("img/gis/0.png", new BMap.Size(32, 32)),
        new BMap.Icon("img/gis/1.png", new BMap.Size(32, 32)),
        new BMap.Icon("img/gis/2.png", new BMap.Size(32, 32)),
        new BMap.Icon("img/gis/3.png", new BMap.Size(32, 32)),
        new BMap.Icon("img/gis/4.png", new BMap.Size(32, 32)),
        new BMap.Icon("img/gis/5.png", new BMap.Size(32, 32)),
        new BMap.Icon("img/gis/6.png", new BMap.Size(32, 32))
    ];
    $(function ($) {
        //  百度地图API功能
		//113.662497,34.763231 郑州
		var x=34.76323,y = 113.66249;
        map.centerAndZoom(new BMap.Point(y, x), 11);  // 初始化地图,设置中心点坐标和地图级别
        map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        //   map.setCurrentCity("河南");          // 设置地图显示的城市 此项是必须设置的
        map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
        var aj = $.ajax({
            url: 'Equipment_info2/Equipmentinfo2List.htm',// 跳转到 action
            data: {},
            type: 'post',
            cache: false,
            dataType: 'json',
            success: function (data) {
                if (data.msg == "true") {
                 	var dataList = {value: []};
                 	var na,nb;
                    for (var i = 0; i < data.list.length; i++) {
                        var obj = data.list[i];
                        if(obj.nLatitudeBd==null||obj.nLongitudeBd==null) {
                            continue;
                        }
                        na=obj.nLatitudeBd;
                        nb=obj.nLongitudeBd;
                        addMarker(obj, i);
                        dataList.value.push({
                            iEquipmentId:obj.iEquipmentId,
                            vEquipmentName: obj.vEquipmentName
                        });
                     }
                    //移动地图位置
                    if(dataList.value.length<20){
                    	map.panTo(new BMap.Point(nb,na))
                    }else{
                    	map.centerAndZoom(new BMap.Point(y, x), 5);
                    }

                    $("#equipment_id").bsSuggest({
                        idField: "iEquipmentId",
                        keyField: "vEquipmentName",
                        searchFields: [ "vEquipmentName"],  //有效搜索字段
                        effectiveFields: ["iEquipmentId","vEquipmentName"],
                        effectiveFieldsAlias:{iEquipmentId:"设备ID",vEquipmentName: "设备名称"}, //有效字段的别名对象，用于 header 的显示
                        clearable: true,
                        data: dataList
                    }).on('onDataRequestSuccess', function (e, result) {
                        console.log('从 json.data 参数中获取，不会触发 onDataRequestSuccess 事件', result);
                    }).on('onSetSelectValue', function (e, keyword, data) {
                        console.log('onSetSelectValue: ', keyword, data);
                    }).on('onUnsetSelectValue', function () {
                        console.log("onUnsetSelectValue");
                    });

                } else {
                    alert("读取失败");
                }
            }, error: function () {
                alert("异常！");
            }
        });
    });

   //    // 编写自定义函数,创建标注
   function addMarker(obj,i){
	   if(obj.nLatitudeBd==null||obj.nLongitudeBd==null){
	       return;
	   }
       var point = new BMap.Point(obj.nLongitudeBd,obj.nLatitudeBd);
       var marker =null;
       if (obj.p002 == 0) {
           marker = new BMap.Marker(point, { icon: Level_Icon[0] });
       } else {
           marker = new BMap.Marker(point, { icon: Level_Icon[getAirLevel_PM25(obj.p002).index] });
       }
       marker.enableDragging() ;// 开启拖拽功能
       marker.setTitle(obj.vEquipmentName);//添加标题
       var label = new BMap.Label("",//"设备号:"+obj.vEquipmentName
       				{offset:new BMap.Size(-14,-5)});
        label.setStyle({
            border:"none"
       	});
       marker.setLabel(label);
       marker.objdate=obj;

       marker.addEventListener('mouseover', function (e) {// 鼠标移动上图标标识上// 变颜色
           var p = e.target;
           p.setTop(true) ;
       });
       marker.addEventListener('mouseout', function (e) {// 鼠标移动上图标标识上// 变颜色
           var p = e.target;
           p.setTop(false) ;
       });
       marker.addEventListener('click', function (e) {// 图标单击
           var p = e.target;
           var markers = map.getOverlays();
            for (var i = 0; i < markers.length; i++) {
               if (markers[i].toString() == "[object Marker]") {
                   markers[i].setAnimation(null);
                }
           }
           p.setAnimation(BMAP_ANIMATION_BOUNCE);
           var geoc = new BMap.Geocoder();//地址转中文
           geoc.getLocation(e.point, function(rs){
               var addComp = rs.addressComponents;
               var addvar=addComp.province + "" + addComp.city + "" + addComp.district + "" + addComp.street + "" + addComp.streetNumber;
               setInfoData(p.objdate,addvar);
            });
       });
       map.addOverlay(marker);

   }
    function getAirLevel_PM25(airIndex) {
        if (0 <= airIndex && airIndex <= 35) {
            return { index: 1, level: "Ⅰ", color: "rgb(0,228,0)", desc: "优" };
        }
        else if (36 <= airIndex && airIndex <= 75) {
            return { index: 2, level: "Ⅱ", color: "rgb(255,255,0)", desc: "良" };
        }
        else if (76 <= airIndex && airIndex <= 115) {
            return { index: 3, level: "Ⅲ", color: "rgb(255,126,0)", desc: "轻度污染" };
        }
        else if (116 <= airIndex && airIndex <= 150) {
            return { index: 4, level: "Ⅳ", color: "rgb(255,0,0)", desc: "中度污染" };
        }
        else if (151 <= airIndex && airIndex <= 250) {
            return { index: 5, level: "Ⅴ", color: "rgb(153,0,76)", desc: "重度污染" };
        }
        else {
            return { index: 6, level: "Ⅵ", color: "rgb(126,0,35)", desc: "严重污染" };
        }
    }
    function getAirLevel_PM25(airIndex) {
        if (0 <= airIndex && airIndex <= 50) {
            return { index: 1, level: "Ⅰ", color: "rgb(0,228,0)", desc: "优" };
        }
        else if (51 <= airIndex && airIndex <= 100) {
            return { index: 2, level: "Ⅱ", color: "rgb(255,255,0)", desc: "良" };
        }
        else if (101 <= airIndex && airIndex <= 150) {
            return { index: 3, level: "Ⅲ", color: "rgb(255,126,0)", desc: "轻度污染" };
        }
        else if (151 <= airIndex && airIndex <= 200) {
            return { index: 4, level: "Ⅳ", color: "rgb(255,0,0)", desc: "中度污染" };
        }
        else if (201 <= airIndex && airIndex <= 300) {
            return { index: 5, level: "Ⅴ", color: "rgb(153,0,76)", desc: "重度污染" };
        }
        else {
            return { index: 6, level: "Ⅵ", color: "rgb(126,0,35)", desc: "严重污染" };
        }
    }
        function setInfoData(obj,addvar) {
            $("div.data-container").show();
            $(".item-row-txt-name").text(addvar);
            $(".item-row-txt-primary").text("污染物级别监控指标：PM2.5");
            if(!obj.dtmCreate){
            	$(".item-row-txt-time").text("已离线");
            }else{
            	$(".item-row-txt-time").text("发布时间："+obj.dtmCreate);
            }
            $("#itemp001").text(obj.p001);
            $("#itemp002").text(obj.p002);
            $("#itemp003").text(obj.p003);
            $("#itemp004").text(obj.p004);
            $("#itemp005").text(obj.p005name);
            $("#itemp006").text(obj.p006);
            $("#itemp007").text(obj.p007);
            $("#itemp008").text(obj.p008);
            $("#itemp009").text(obj.p009);


            $("div.warpper > div.data-container > div.top-lay > div.item-row-aqi > div.item-row-txt-aqi").css("border-color", getAirLevel_PM25(obj.p002).color);
            $("div.warpper > div.data-container").css("border-color", getAirLevel_PM25(obj.p002).color);
            $("div.warpper > div.data-container > div.close-icon").css("color", getAirLevel_PM25(obj.p002).color);
    }

function  locationMap(){
    var eid=$("#equipment_id").val();

    var markers = map.getOverlays();
    var ifbo=false;
    for (var i = 0; i < markers.length; i++) {
         if (markers[i].toString() == "[object Marker]") {
            markers[i].setAnimation(null);
           if(eid==markers[i].getTitle()){
               map.panTo(markers[i].getPosition());
               markers[i].setAnimation(BMAP_ANIMATION_BOUNCE);
               ifbo=true;
           }
        }
    }
    if(!ifbo){
        alert("没有找到这个设备!");
    }
}
</script>

</html>