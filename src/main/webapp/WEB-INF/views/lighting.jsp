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
    <link href="https://raw.githubusercontent.com/seiyria/bootstrap-slider/master/css/bootstrap-slider.css" rel="stylesheet">
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
            min-width: 200px;
            height: 40px;
        }
        
        td{
           min-width: 100px;
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
        
        #footer{
            position:absolute;
            width:100%;
            bottom:20px; 
        }
        
        #more{
            position: absolute;
            bottom:   20px;
        }
    </style>
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
          <div style="width:100%"><h2 style="text-align:center;">Lighting</h2></div>
          <div class="row" style="padding: 10px;">
              <div class="col-md-3"></div>
              <div class="col-md-3"><table>
                  <tr><td>Main Display</td><td><input type="checkbox" id="toggle-button" checked></td></tr>
                  <tr><td>Start</td><td>
                      <select class="form-control">
                          <option>00:00</option>
                          <option>01:00</option>
                          <option>02:00</option>
                          <option>03:00</option>
                          <option>04:00</option>
                          <option>05:00</option>
                          <option>06:00</option>
                          <option>07:00</option>
                          <option>08:00</option>
                          <option>09:00</option>
                          <option>10:00</option>
                          <option>11:00</option>
                          <option>12:00</option>
                          <option>13:00</option>
                          <option>14:00</option>
                          <option>15:00</option>
                          <option>16:00</option>
                          <option>17:00</option>
                          <option>18:00</option>
                          <option>19:00</option>
                          <option>20:00</option>
                          <option>21:00</option>
                          <option>23:00</option>
                          <option>24:00</option>
                      </select>
                      </td></tr>
                          <tr><td>End</td><td>
                      <select class="form-control">
                          <option>00:00</option>
                          <option>01:00</option>
                          <option>02:00</option>
                          <option>03:00</option>
                          <option>04:00</option>
                          <option>05:00</option>
                          <option>06:00</option>
                          <option>07:00</option>
                          <option>08:00</option>
                          <option>09:00</option>
                          <option>10:00</option>
                          <option>11:00</option>
                          <option>12:00</option>
                          <option>13:00</option>
                          <option>14:00</option>
                          <option>15:00</option>
                          <option>16:00</option>
                          <option>17:00</option>
                          <option>18:00</option>
                          <option>19:00</option>
                          <option>20:00</option>
                          <option>21:00</option>
                          <option>23:00</option>
                          <option>24:00</option>
                      </select>
                      </td></tr>
                          <tr><td></td><td><button type="submit" class="btn btn-default">Apply</button></td></tr>
              </table></div>
	  <div class="col-md-3"><table><tr><td>Sump</td><td><input type="checkbox" id="toggle-button2"></td></tr>
              <tr><td>Start</td><td>
                      <select class="form-control">
                          <option>00:00</option>
                          <option>01:00</option>
                          <option>02:00</option>
                          <option>03:00</option>
                          <option>04:00</option>
                          <option>05:00</option>
                          <option>06:00</option>
                          <option>07:00</option>
                          <option>08:00</option>
                          <option>09:00</option>
                          <option>10:00</option>
                          <option>11:00</option>
                          <option>12:00</option>
                          <option>13:00</option>
                          <option>14:00</option>
                          <option>15:00</option>
                          <option>16:00</option>
                          <option>17:00</option>
                          <option>18:00</option>
                          <option>19:00</option>
                          <option>20:00</option>
                          <option>21:00</option>
                          <option>23:00</option>
                          <option>24:00</option>
                      </select>
                      </td></tr>
                          <tr><td>End</td><td>
                      <select class="form-control">
                          <option>00:00</option>
                          <option>01:00</option>
                          <option>02:00</option>
                          <option>03:00</option>
                          <option>04:00</option>
                          <option>05:00</option>
                          <option>06:00</option>
                          <option>07:00</option>
                          <option>08:00</option>
                          <option>09:00</option>
                          <option>10:00</option>
                          <option>11:00</option>
                          <option>12:00</option>
                          <option>13:00</option>
                          <option>14:00</option>
                          <option>15:00</option>
                          <option>16:00</option>
                          <option>17:00</option>
                          <option>18:00</option>
                          <option>19:00</option>
                          <option>20:00</option>
                          <option>21:00</option>
                          <option>23:00</option>
                          <option>24:00</option>
                      </select>
                      </td></tr>
                          <tr><td></td><td><button type="submit" class="btn btn-default">Apply</button></td></tr></table></div>
              <div class="col-md-3"></div>
          </div>
          <div class="row">
              
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
    <script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript" src="//cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>
    <script src="https://raw.githubusercontent.com/seiyria/bootstrap-slider/master/js/bootstrap-slider.js"></script>
    <script>
      $(function() {
        $("#ex2").slider({});
        $('#toggle-button').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
        $('#toggle-button2').bootstrapToggle({
          onstyle: 'success',
          offstyle: 'danger'
        });
      });
    </script>
</body>
</html>
