using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Controller
{
    public class FacebookUser
    {
        public int id { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string email { get; set; }

        public FacebookUser()
        {
        }

        public FacebookUser(int id, string firstName, string lastName, string email)
        {
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
            this.email = email;
        }
    }
}
