<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="View.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://connect.facebook.net/en_US/all.js"></script>
    <script type="text/javascript">
        window.fbAsyncInit = function() {
          FB.init({
            appId      : '133132700143894',
            status     : true, 
            cookie     : true,
            xfbml      : true,
            oauth      : true,
          });
        };
        FB.Event.subscribe('auth.authResponseChange', function(response) {
        if (response.status === 'connected') {
            // the user is logged in and has authenticated your
            // app, and response.authResponse supplies
            // the user's ID, a valid access token, a signed
            // request, and the time the access token 
            // and signed request each expire
            var uid = response.authResponse.userID;
            var accessToken = response.authResponse.accessToken;

            // TODO: Handle the access token
            // Do a post to the server to finish the logon
            // This is a form post since we don't want to use AJAX
            var form = document.createElement("form");
            form.setAttribute("method", 'post');   
            form.setAttribute("action", '/FacebookLogin.ashx');
    
            var field = document.createElement("input");
            field.setAttribute("type", "hidden");
            field.setAttribute("name", "accessToken");
            field.setAttribute("value", accessToken);
            form.appendChild(field);

            document.body.appendChild(form);
            form.submit();

            } else if (response.status === 'not_authorized') {
                // the user is logged in to Facebook, 
                // but has not authenticated your app
            } else {
                // the user isn't logged in to Facebook.
        }
        });
        (function(d){
           var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/en_US/all.js";
           d.getElementsByTagName('head')[0].appendChild(js);
         }(document));
      </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="fb-login-button">Login with Facebook</div>
    </div>
    </form>
</body>
</html>
