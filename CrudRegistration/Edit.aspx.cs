using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudRegistration
{
    public partial class Edit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=LAPTOP-CTG4MLB9;Initial Catalog=Crud;Integrated Security=True;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                string name = Request.QueryString["name"];
                string address = Request.QueryString["address"];
                string age = Request.QueryString["age"];
                string contact = Request.QueryString["contact"];
                string middlename = Request.QueryString["MiddleName"];
                string lastname = Request.QueryString["LastName"];
                Sid.Text = id;
                Sname.Text = name;
                Saddress.Text = address;
                Sage.Text = age;
                Scontact.Text = contact;
                Mname.Text = middlename;
                Lname.Text = lastname;

            }

        }


       

        protected void btnedit_Click1(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update StudentInfo_Tab set FirstName='" + Sname.Text + "',Address='" + Saddress.Text + "',Age='" + int.Parse(Sage.Text) + "',Contact='" + Scontact.Text + "',MiddleName='" + Mname.Text+ "',LastName='"+ Lname.Text+"'Where StudentId='" + int.Parse(Sid.Text) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully updated');", true);
        }

        protected void btnshow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }
    }
}