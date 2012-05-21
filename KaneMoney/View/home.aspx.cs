using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using Facebook;

namespace View
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            autenticarUsuario();
        }

        
        private void autenticarUsuario()
        {
            var accessToken = Session["AccessToken"].ToString();
            var client = new FacebookClient(accessToken);
            dynamic result = client.Get("me", new { fields = "name,id" });
            string name = result.name;
            string id = result.id;

            Label1.Text = id;
            Label2.Text = name;
        }
    }
}