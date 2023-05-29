using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Emmanuel_Kianda_ST10081944_PROG7311_POE_PART_2
{
    public partial class ViewFarmers : System.Web.UI.Page
    {
        private static string currentLoggedID = "";


        // Creating a connection to the Database
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmCentralConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["EmployeeID"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {

                con.Open();

                // SQL Statement to retrieve the FRM_ID based on the LOGIN_EMAIL
                SqlCommand cmd = new SqlCommand("SELECT FRM_ID FROM FARMER WHERE LOGIN_EMAIL = @LoginEmail", con);
                cmd.Parameters.AddWithValue("@LoginEmail", Session["LoggedUser"]);

                // Execute the SQL statement and retrieve the value
                object result = cmd.ExecuteScalar();

                // Check if the result is not null and convert it to a string
                if (result != null)
                {
                    currentLoggedID = result.ToString();
                }


            }
        }

        // <------------- Method/Button to display a GridView displaying the products that belong to the farmer ID  enetered ---------------->
        protected void SearchButtonn_Click(object sender, EventArgs e)
        {
            try
            {
                // Call the JavaScript function to scroll to the bottom
                ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);




                // SQL Statement to Lookup values inside the selected table that match the entered ID
                string find = "SELECT * FROM [FARMER] WHERE FRM_ID = @FRM_ID";

                SqlCommand cmd = new SqlCommand(find, con);
                cmd.Parameters.AddWithValue("@FRM_ID", int.Parse(txtSearchToolBar.Text));

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "FRM_ID");

                if (ds.Tables["FRM_ID"].Rows.Count > 0)
                {
                    // Data found, bind it to the GridView
                    GridView1.Visible = true;
                    GridView1.DataSourceID = null;
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                    Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#009b59");
                    Label1.Text = "Data has been selected"; // Displaying message to notify the User
                }
                else
                {
                    // No data found, display error message
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "No data found.";
                    GridView1.Visible = false;

                }

                con.Close();

            }
            catch (Exception ex) // Error Handling 
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Error, your input is invalid, " + ex.Message;  // Displaying message to notify the User
            }
        }
    }
}