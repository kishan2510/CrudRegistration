using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CrudRegistration
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


            }








        }
        SqlConnection con = new SqlConnection("Data Source=LAPTOP-CTG4MLB9;Initial Catalog=Crud;Integrated Security=True;");

       

        protected void btnsave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into StudentInfo_Tab values('" + Sid.Text + "','" + Sname.Text + "','" + Saddress.Text + "','" + int.Parse(Sage.Text) + "','" + Scontact.Text + "','" + Mname.Text + "','" + Lname.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully inserted');", true);
            Response.Redirect("Contact.aspx");
        }

        protected void btnshow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }
    }
}