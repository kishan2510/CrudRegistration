using System;
using System.IO;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;
using Newtonsoft.Json.Linq;

namespace CrudRegistration
{
    public partial class Contact : Page
    {
        SqlConnection con = new SqlConnection("Data Source=LAPTOP-CTG4MLB9;Initial Catalog=Crud;Integrated Security=True;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Show();
               
                LoadNames();


            }
        }
        
        public void Show()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from StudentInfo_Tab", con);
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GV.DataSource = dt;
            GV.DataBind();
            con.Close();

            GV.UseAccessibleHeader = true;
            GV.HeaderRow.TableSection = TableRowSection.TableHeader;


        }
        protected DataTable GridViewToDataTable(GridView gridView)
        {
            DataTable dt = new DataTable();

            // Add columns to the DataTable
            foreach (DataControlField column in gridView.Columns)
            {
                dt.Columns.Add(column.HeaderText);
            }

            // Add rows to the DataTable
            foreach (GridViewRow row in gridView.Rows)
            {
                DataRow dr = dt.NewRow();
                for (int i = 0; i < gridView.Columns.Count; i++)
                {
                    dr[i] = row.Cells[i].Text;
                }
                dt.Rows.Add(dr);
            }

            return dt;
        }



        protected void GV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "dlt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete StudentInfo_Tab Where StudentId='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully deleted');", true);
                Show();

            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string commandArgument = btn.CommandArgument;
            string[] arguments = commandArgument.Split(',');

            string id = arguments[0];
            string name = arguments[1];
            string address = arguments[2];
            string age = arguments[3];
            string contact = arguments[4];
            string middlename = arguments[5];
            string lastname = arguments[6];


            Response.Redirect("Edit.aspx?id=" + id + "&name=" + name + "&address=" + address + "&age=" + age + "&contact=" + contact + "&MiddleName=" + middlename + "&LastName=" + lastname);
        }
        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    string searchQuery = txtSearch.Text.Trim();
        //    ApplySearch(searchQuery);
        //}
//        protected void ApplySearch(string searchQuery)

//        {
//            con.Open();
//            SqlCommand cmd = new SqlCommand(" SELECT * FROM StudentInfo_Tab WHERE StudentId LIKE '%' + searchQuery + '%' OR StudentName LIKE '%' + searchQuery + '%'"
//, con);
//            cmd.ExecuteNonQuery();
//            con.Close();
//            SqlDataAdapter d = new SqlDataAdapter(cmd);
//            DataTable dt = new DataTable();
//            d.Fill(dt);
//            GV.DataSource = dt;
//            GV.DataBind();



//        }

        protected void GV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GV.PageIndex = e.NewPageIndex;
            this.Show();

        }



        protected void btnexport_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AppendHeader("content-disposition", "attachment;filename=Student.xls");
            Response.Charset = "";
            Response.ContentType = "application/ms-excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter writer = new HtmlTextWriter(stringWriter);
            GV.RenderControl(writer);
            Response.Write(stringWriter.ToString());
            Response.End();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }

        public void LoadNames()
        {
            try
            {
                con.Open();
                string query = "SELECT  distinct FirstName FROM StudentInfo_Tab;";

                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader reader = cmd.ExecuteReader();

                offcanvasBody.InnerHtml = "";

                while (reader.Read())
                {
                    string name = reader["FirstName"].ToString();

                    offcanvasBody.InnerHtml += $"<a id=\"{name}\" onclick=\"{name}\" href=\"#\" style=\"display:inline-block;\">{name}</a><br/>";
                    string[] value = loadnames(name);

                    foreach (string middleName in value)
                    {
                        //string mname = value[i];
                        // offcanvasBody.InnerHtml += $"<a id=\"{name + mname}\" onclick=\"{name+mname}\" href=\"#\" style=\"display:inline-block;\">{mname}</a><br/>";
                        offcanvasBody.InnerHtml += $"<a class='{name}_middle' id='{name + middleName}' href='javascript:void(0)' onclick='toggleLastNames(\"{middleName}\")' style='display:none; margin-left:20px;'>{middleName}</a><br/>";

                        string[] lastNames = loadlname(middleName);
                        foreach (string lastName in lastNames)
                        {
                            offcanvasBody.InnerHtml += $"<a class='{middleName}_last' href='#' style='display:none; margin-left:40px;'>{lastName}</a><br/>";

                        }
                    }


                }
                con.Close();




            }
            catch (Exception ex)
            {
                // Handle any exceptions
                Console.WriteLine(ex);
            }
        }

        public string[] loadnames(string value)
        {
            con.Open();
            List<string> middleNamesList = new List<string>();
            string query = "select distinct  MiddleName FROM StudentInfo_Tab where firstName=@Value";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            cmd.Parameters.AddWithValue("@Value", value);
            con.Close();
            while (reader.Read())
            {
                
                string middleName = reader["MiddleName"].ToString();
                middleNamesList.Add(middleName);
            }
            return middleNamesList.ToArray();


        }

        public string[] loadlname(string mname)
        {
            con.Open();
            List<string> lastNamesList = new List<string>();
            string query = "select lastName FROM StudentInfo_Tab where MiddleName=@mname";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            cmd.Parameters.AddWithValue("@mname", mname);
            con.Close();
            while (reader.Read())
            {
                string middleName = reader["lastName"].ToString();
                lastNamesList.Add(middleName);
            }
            return lastNamesList.ToArray();

        }







    }

}