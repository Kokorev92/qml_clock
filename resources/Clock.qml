import QtQuick 2.12
import QtQuick.Controls 2.12

Canvas {
    id: clock_canvas
    width: Math.min(parent.width, parent.height)
    height: width
    antialiasing: true
    anchors.centerIn: parent
    onPaint: {
        var ctx = clock_canvas.getContext("2d")
        ctx.strokeRect(0,0,width, height);
	
    //Расчет координат центра и радиуса часов
    var radiusClock = width/2 - 10;
    var xCenterClock = width/2;
    var yCenterClock = height/2;
	
    //Очистка экрана. 
    ctx.fillStyle = "#ffffff";
    ctx.fillRect(0,0,width, height)
	
    //Рисуем контур часов
    ctx.strokeStyle =  "#000000";
    ctx.lineWidth = 1;
    ctx.beginPath();
    ctx.arc(xCenterClock, yCenterClock, radiusClock, 0, 2*Math.PI, true);
    ctx.moveTo(xCenterClock, yCenterClock);
    ctx.stroke();
    ctx.closePath();
	
    //Рисуем рисочки часов
    var radiusNum = radiusClock - 10; //Радиус расположения рисочек	
    var radiusPoint;
    for(var tm = 0; tm < 60; tm++){
	  ctx.beginPath();
	  if(tm % 5 == 0){radiusPoint = 5;}else{radiusPoint = 2;} //для выделения часовых рисочек
	  var xPointM = xCenterClock + radiusNum * Math.cos(-6*tm*(Math.PI/180) + Math.PI/2);
	  var yPointM = yCenterClock - radiusNum * Math.sin(-6*tm*(Math.PI/180) + Math.PI/2);
	  ctx.arc(xPointM, yPointM, radiusPoint, 0, 2*Math.PI, true);
	  ctx.stroke();
	  ctx.closePath();
    } 
	
    //Оцифровка циферблата часов
    for(var th = 1; th <= 12; th++){
	ctx.beginPath();
	ctx.font = 'bold 25px sans-serif';
	var xText = xCenterClock + (radiusNum - 30) * Math.cos(-30*th*(Math.PI/180) + Math.PI/2);
	var yText = yCenterClock - (radiusNum - 30) * Math.sin(-30*th*(Math.PI/180) + Math.PI/2);
	if(th <= 9){
		ctx.strokeText(th, xText - 5 , yText + 10);
	}else{
		ctx.strokeText(th, xText - 15 , yText + 10);
	}
     	ctx.stroke();
	ctx.closePath();	
    }

	
    //Рисуем стрелки
    var lengthSeconds = radiusNum - 10;
    var lengthMinutes = radiusNum - 15;
    var lengthHour = lengthMinutes / 1.5;
    var d = new Date();                //Получаем экземпляр даты
    var t_sec = 6*d.getSeconds();                           //Определяем угол для секунд
    var t_min = 6*(d.getMinutes() + (1/60)*d.getSeconds()); //Определяем угол для минут
    var t_hour = 30*(d.getHours() + (1/60)*d.getMinutes()); //Определяем угол для часов
	
    //Рисуем секунды
    ctx.beginPath();
    ctx.strokeStyle =  "#FF0000";
    ctx.moveTo(xCenterClock, yCenterClock);
    ctx.lineTo(xCenterClock + lengthSeconds*Math.cos(Math.PI/2 - t_sec*(Math.PI/180)),
				yCenterClock - lengthSeconds*Math.sin(Math.PI/2 - t_sec*(Math.PI/180)));
    ctx.stroke();
    ctx.closePath();

    //Рисуем минуты
    ctx.beginPath();
    ctx.strokeStyle =  "#000000";
    ctx.lineWidth = 3;
    ctx.moveTo(xCenterClock, yCenterClock);
    ctx.lineTo(xCenterClock + lengthMinutes*Math.cos(Math.PI/2 - t_min*(Math.PI/180)),
				 yCenterClock - lengthMinutes*Math.sin(Math.PI/2 - t_min*(Math.PI/180)));
    ctx.stroke();
    ctx.closePath();

    //Рисуем часы
    ctx.beginPath();
    ctx.lineWidth = 5;
    ctx.moveTo(xCenterClock, yCenterClock);
    ctx.lineTo(xCenterClock + lengthHour*Math.cos(Math.PI/2 - t_hour*(Math.PI/180)),
				 yCenterClock - lengthHour*Math.sin(Math.PI/2 - t_hour*(Math.PI/180)));
    ctx.stroke();
    ctx.closePath();	
	
    //Рисуем центр часов
    ctx.beginPath();
    ctx.strokeStyle =  "#000000";
    ctx.fillStyle = "#ffffff";
    ctx.lineWidth = 3;
    ctx.arc(xCenterClock, yCenterClock, 5, 0, 2*Math.PI, true);
    ctx.stroke();
    ctx.fill();
    ctx.closePath();
	  
    return;
    }

    Timer {
        id: timer
        interval: 100
        running: true
        repeat: true
        onTriggered: clock_canvas.requestPaint()
    }
}

