<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="http://i1352.photobucket.com/albums/q652/KiddoTheGreek/ReefCoral%20Pi%20Project/favicon_zpshnjk3x4e.png" >
    <title>ReefCoral Pi</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.0/css/bootstrap-toggle.min.css" rel="stylesheet">
    <link href="https://raw.githubusercontent.com/seiyria/bootstrap-slider/master/css/bootstrap-slider.css">
    <link href='http://fonts.googleapis.com/css?family=Jura&subset=latin,greek' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Comfortaa&subset=latin,greek' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">

    <!-- Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Quicksand:700' rel='stylesheet' type='text/css'>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
        h1,h2,h3 {
            font-family: 'Quicksand', sans-serif;
        }
        
        tr{
            min-width: 80px;
            height: 40px;
        }
        
        td{
           min-width: 40px;
        }
        
        #comp_box{
            min-height: 300px;
        }
        
        #videocontainer {
            margin: 0px auto;
            width: 500px;
            height: 375px;
            border: 5px #333 solid;
        }
        #videoElement {
            width: 500px;
            height: 375px;
            background-color: #666;
        }
        
        #footer {
                position:absolute;
                width:100%;
                height:60px;   /* Height of the footer */
            }
        
        #more{
            position: absolute;
            bottom:   20px;
        }
    </style>
    
    <script type="text/javascript">
window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
        title: {
            text: "Water Level Analysis"             
        },
        animationEnabled: true,
        axisX:{      
            interval: 1,
            xValueType: "dateTime"
            // labelAngle : 30,
            // valueFormatString: "HHmm'hrs'"

        },
        axisY: {
            title: "Water Level",
            minimum: 15,
            maximum: 30
        },
        legend: {
            verticalAlign: "bottom",
            horizontalAlign: "center"
        },

        data: [{        
            name: "water",
            showInLegend: true,
            legendMarkerType: "square",
            type: "area",
            color: "rgba(40,175,101,0.6)",
            markerSize: 0,
    <c:set var="count" value="0"/>
            dataPoints: [
            <c:forEach var="temp" items="${Levels}" varStatus="loop">
                    <c:set var="count" value="${count+1}"/>
               {x:${temp.getTime()},y:${temp.getLevel()} }<c:if test="${count<Levels.size()}">,</c:if>           
            </c:forEach>
            ]
        }]
    });

chart.render();
}
</script>
    <script>
       function switchRelay(id){
           event.preventDefault();
           $.ajax({
               type: "GET",
               contentType: "html",
               url: "${home}switch/"+id,
               timeout: 50000,
               success: function(data){
                   console.log("SUCCESS",data);
               },
               error: function(e){
                   console.log("ERROR");
               }
           });
       }
    </script>
</head>
<body>

    <div class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
            <a class="navbar-brand" href="/ReefCoralPi"><img style="height: 50px; margin-top: -15px;" src="http://i1352.photobucket.com/albums/q652/KiddoTheGreek/ReefCoral%20Pi%20Project/mainlogo_zpsrfzzkqub.png"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav"><li style="color:white; text-align: center; margin-top: 15px; font-size: 15px;">${serverTime}</li></ul>
		<form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row" >
        <div id="comp_box" class="col-md-12">
           
          <div style="width:100%"><h2 style="text-align:center;">Sump</h2></div>
          <div class="row" style="padding: 10px;">
	<div class="col-md-2"><table><tr><td>Water Level:</td><td>${waterTemp}°C</td></tr></table></div>
        <div class="col-md-2"><table><tr><td>Chaeto Lighting</td><td><input type="checkbox" id="toggle-button" onchange="switchRelay()"  <c:if test="${Pins[3] == 'HIGH'}">checked</c:if>></td></tr></table></div>
        </div>
          <div class="row">
              <c:if test="${not empty Levels}">
              <div id="chartContainer" style="height: 300px; width: 100%;"></div>
              </c:if>
              <c:if test="${empty Levels}">
              THERE ARE NOT LEVELS!!!
              </c:if>
          </div>
          <div class="row">
            <table class="table table-striped">
                <tr>
                    <th>DateTime</th>
                    <th>Water Level</th>
                </tr>
                <c:forEach var="temp" items="${Levels}" varStatus="loop">
                <tr>
                    <td>${temp.getDate()}</td>
                    <td>${temp.getLevel()} cm</td>
                </tr>
                </c:forEach>
                
            </table>
          </div>
        </div>
      </div>
    </div>
        
    <div id="footer" style="text-align: center;" >
            <h5><img src="http://i1352.photobucket.com/albums/q652/KiddoTheGreek/ReefCoral%20Pi%20Project/favicon_zpshnjk3x4e.png" width="25"/> Reef Coral Project - Kiddo Productions &#169; </h5>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/canvasjs/1.7.0/jquery.canvasjs.min.js"></script>
    <script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript" src="//cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>
    <script>
      $(function() {
        $('#toggle-button').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
        $('#toggle-button2').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
        $('#toggle-button3').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
        $('#toggle-button4').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
        $('#toggle-button5').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
        $('#toggle-button6').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
        $('#toggle-button7').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
        $('#toggle-button8').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
        $('#toggle-button9').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
      });
    </script>
</body>
</html>

