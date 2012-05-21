using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace View
{
    /// <summary>
    /// Summary description for FacebookLogin
    /// </summary>
    public class FacebookLogin : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            var accessToken = context.Request["accessToken"];
            context.Session["AccessToken"] = accessToken;

            context.Response.Redirect("http://localhost:28339/home.aspx");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}