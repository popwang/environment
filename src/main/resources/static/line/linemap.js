var Level_Icon = [ new BMap.Icon("img/gis/0.png", new BMap.Size(32, 32)),
		new BMap.Icon("img/gis/1.png", new BMap.Size(32, 32)),
		new BMap.Icon("img/gis/2.png", new BMap.Size(32, 32)),
		new BMap.Icon("img/gis/3.png", new BMap.Size(32, 32)),
		new BMap.Icon("img/gis/4.png", new BMap.Size(32, 32)),
		new BMap.Icon("img/gis/5.png", new BMap.Size(32, 32)),
		new BMap.Icon("img/gis/6.png", new BMap.Size(32, 32))];

//创建地图函数：  
function createMap(){
    var map = new BMap.Map("allmap");//在百度地图容器中创建一个地图  
    var point = new BMap.Point(113.616114,34.753488);//定义一个中心点坐标  
    map.centerAndZoom(point,15);//设定地图的中心点和坐标并将地图显示在地图容器中  
    window.map = map;//将map变量存储在全局  
}

//地图事件设置函数：  
function setMapEvent(){  
    map.enableDragging();//启用地图拖拽事件，默认启用(可不写)  
    map.enableScrollWheelZoom();//启用地图滚轮放大缩小  
    map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)  
    map.enableKeyboard();//启用键盘上下左右键移动地图  
}

//地图控件添加函数：  
function addMapControl(){
    //向地图中添加缩放控件  
    var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});  
    map.addControl(ctrl_nav);  
    //向地图中添加比例尺控件  
    var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});  
    map.addControl(ctrl_sca);  
}

//标注线数组  
var plPoints = [{weight:2,color:"blue",opacity:0.6,
	points:["113.610005|34.762504",
	"113.609933|34.761673",
	"113.60979|34.759479",
	"113.609861|34.757225",
	"113.609933|34.75414",
	"113.610005|34.753429",
	"113.613383|34.755327",
	"113.616114|34.753488"]}];
//向地图中添加线函数  
function addPolyline(){
    for(var i=0;i<plPoints.length;i++){
        var json = plPoints[i];
        var points = [];
        for(var j=0;j<json.points.length;j++){  
            var p1 = json.points[j].split("|")[0];  
            var p2 = json.points[j].split("|")[1];  
            points.push(new BMap.Point(p1,p2));  
        }
        var line = new BMap.Polyline(points,{strokeWeight:json.weight,strokeColor:json.color,strokeOpacity:json.opacity});  
        map.addOverlay(line);
        addArrow(line);
    }
}
//添加标注线
function addArrow(line){ //绘制标注的函数  
    var linePoint=line.getPath();//线的坐标串  
    var arrowCount=linePoint.length;  
    var myIcon = new BMap.Icon("img/gis/stop_icon.png", new BMap.Size(11,11));//圆点
    for(var i =0;i<arrowCount;i++){ //在拐点处添加标注  
        var marker = new BMap.Marker(linePoint[i],{icon:myIcon});  // 创建标注  
        if(i==arrowCount-1){//最后一个点加上当前位置的标签
        	var label = new BMap.Label("当前位置",{offset:new BMap.Size(20,-10)});  
            label.setStyle({  
                color : "blue",  
                fontSize : "10px",  
                height : "15px",  
                lineHeight : "15px",  
                backgroundColor:"rgba(255, 255, 255, 0.8) none repeat scroll 0 0 !important",//设置背景色透明  
                border:"none"  
            });
            marker.setLabel(label);
        }
        map.addOverlay(marker);// 将标注添加到地图中  
    }
    /**
     * 创建红点标注
     */
    var end = new BMap.Marker(linePoint[linePoint.length-1]);
    end.setTitle("00000888");
    var obj = {};
    obj.name = "00000888";
    obj.status= "11";
    obj.dtm_create = "2018-06-04 17:05:23";
    end.obj = obj;
    addListener(end);
    map.addOverlay(end);
}  
//创建和初始化地图函数
function initMap(){  
    createMap();//创建地图  
    setMapEvent();//设置地图事件  
    addMapControl();//向地图添加控件  
    addPolyline();//向地图中添加线  
}

$(function($) {
    initMap();//创建和初始化地图 
});

// 编写自定义函数,创建标注
function addListener(marker) {
	marker.addEventListener('click', function(e) {// 图标单击
		var p = e.target;
		var markers = map.getOverlays();
		for (var i = 0; i < markers.length; i++) {
			if (markers[i].toString() == "[object Marker]") {
				markers[i].setAnimation(null);
			}
		}
		p.setAnimation(BMAP_ANIMATION_BOUNCE);
		var geoc = new BMap.Geocoder();//地址转中文
		geoc.getLocation(e.point, function(rs) {
			var addComp = rs.addressComponents;
			var addvar = addComp.province + "" + addComp.city + ""
					+ addComp.district + "" + addComp.street + ""
					+ addComp.streetNumber;
			setInfoData(p.obj, addvar);
		});
	});
}

//打开数据详情窗口
function setInfoData(obj, addvar) {
	$("div.data-container").show();
	$(".item-row-txt-name").text(addvar);
	$(".item-row-txt-equipment").text("设备编号："+obj.name);
	$(".item-row-txt-primary").text("雾炮工作状态："+toStr(obj.status));
	$(".item-row-txt-time").text("数据时间："+obj.dtm_create);
}
function toStr(status){
	var tmp = "";
	switch(parseInt(status.charAt(0))){
		case 1 : tmp = "手动模式";break;
		case 2 : tmp = "远程模式";break;
		case 3 : tmp = "定时模式";break;
		default:
	}
	switch(parseInt(status.charAt(1))){
		case 1 : tmp += ",有水";break;
		case 2 : tmp += ",缺水";break;
		case 3 : tmp += ",缺相";break;
		default:
	}
	return tmp;
}