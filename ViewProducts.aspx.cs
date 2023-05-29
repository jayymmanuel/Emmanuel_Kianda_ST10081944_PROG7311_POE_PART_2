using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Emmanuel_Kianda_ST10081944_PROG7311_POE_PART_2
{
    public partial class ViewProducts : System.Web.UI.Page
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
            myRow.Visible = false;

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

            if (!IsPostBack)
            {

                    cascadingDropDown();
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


                lblProductType.Visible = false;
                cancelFilter.Visible = false;
                applyFilter.Visible = false;
                ddlProductType.Visible = false;
                myRow.Visible = false;


                // SQL Statement to Lookup values inside the selected table that match the entered ID
                string find = "SELECT * FROM [PRODUCT] WHERE FRM_ID = @FRM_ID";

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


        protected void cancelFilter_Click(object sender, EventArgs e)
        {
            lblProductType.Visible = false;
            cancelFilter.Visible = false;
            applyFilter.Visible = false;
            ddlProductType.Visible = false;
            myRow.Visible = false;

        }

        protected void applyFilter_Click(object sender, EventArgs e)
        {
            lblProductType.Visible = false;
            cancelFilter.Visible = false;
            applyFilter.Visible = false;
            ddlProductType.Visible = false;
            myRow.Visible = false;


            try
            {
                // Call the JavaScript function to scroll to the bottom
                ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);

                // SQL Statement to Lookup values inside the selected table that match the entered ID
                string find = "SELECT * FROM PRODUCT WHERE FRM_ID = @FRM_ID AND PTYPE_ID =@PTYPE_ID";

                SqlCommand cmd = new SqlCommand(find, con);
                cmd.Parameters.AddWithValue("@FRM_ID", int.Parse(txtSearchToolBar.Text));
                cmd.Parameters.AddWithValue("@PTYPE_ID", Convert.ToInt32(ddlProductType.SelectedValue));


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

        protected void btnFilterSearch_Click(object sender, EventArgs e)
        {
            myRow.Visible = true;
            lblProductType.Visible = true;
            cancelFilter.Visible = true;
            applyFilter.Visible = true;
            ddlProductType.Visible = true;


        }

        protected void cascadingDropDown()
        {

            // SQL query to retrieve PTYPE_ID and PTYPE_NAME values from the PRODUCT_TYPE table
            string query = "SELECT PTYPE_ID, PTYPE_NAME FROM PRODUCT_TYPE";

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmCentralConnectionString"].ConnectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    // Clear existing items in the dropdown list
                    ddlProductType.Items.Clear();

                    // Iterate through the reader and add PTYPE_NAME values to the dropdown list
                    while (reader.Read())
                    {
                        int pTypeID = Convert.ToInt32(reader["PTYPE_ID"]);
                        string pTypeName = reader["PTYPE_NAME"].ToString();

                        ListItem item = new ListItem(pTypeName, pTypeID.ToString());
                        ddlProductType.Items.Add(item);
                    }
                }
            }


        }

        protected void ddlProductType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Call the JavaScript function to scroll to the bottom
            ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);
            myRow.Visible = true;

        }
    }
}