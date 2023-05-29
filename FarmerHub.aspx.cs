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
    public partial class FarmerHub : System.Web.UI.Page
    {
        // Creating a connection to the Database
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmCentralConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["EmployeeID"] == null)
            {
                Response.Redirect("Home.aspx");
            }

            con.Open();
        }

        public void AddActivated()
        {
            // Displayin the relevant items for the Create Farmer function
            bannerDivider.Visible = Visible;
            promptMessage.Visible = Visible;
            promptMessage2.Visible = Visible;
            promptMessage2.Text = "ADD FARMER";
            promptMessage.Text = "Enter the values of the following fields";
            GridView1.Visible = false;
            lblFarmerID.Visible = false;
            txtFarmerID.Visible = false;




            lblFarmerCode.Visible = Visible;
            lblFarmOwner.Visible = Visible;
            lblFarmName.Visible = Visible;
            lblZipCode.Visible = Visible;
            lblFarmerPassword.Visible = Visible;
            lblFarmerEmail.Visible = Visible;



            txtFarmerCode.Visible = Visible;
            txtFarmOwner.Visible = Visible;
            txtFarmName.Visible = Visible;
            txtZipCode.Visible = Visible;
            txtFarmerPassword.Visible = Visible;
            txtFarmerEmail.Visible = Visible;



            createButton.Visible = Visible;
            deleteNext.Visible = false;
            updateNext.Visible = false;
            ErrorMessage.Visible = false;
        }

        public void AddDeactivated()
        {
            // Hidding the relevant items for the Create Farmer function
            bannerDivider.Visible = false;
            promptMessage.Visible = false;
            promptMessage2.Visible = false;
            GridView1.Visible = false;
            lblFarmerID.Visible = false;
            txtFarmerID.Visible = false;




            lblFarmerCode.Visible = false;
            lblFarmOwner.Visible = false;
            lblFarmName.Visible = false;
            lblZipCode.Visible = false;
            lblFarmerPassword.Visible = false;
            lblFarmerEmail.Visible = false;



            txtFarmerCode.Visible = false;
            txtFarmOwner.Visible = false;
            txtFarmName.Visible = false;
            txtZipCode.Visible = false;
            txtFarmerPassword.Visible = false;
            txtFarmerEmail.Visible = false;

            txtFarmerCode.Text = "";
            txtFarmOwner.Text = "";
            txtFarmName.Text = "";
            txtZipCode.Text = "";
            txtFarmerPassword.Text = "";
            txtFarmerEmail.Text = "";


            createButton.Visible = false;
            deleteNext.Visible = false;
            updateNext.Visible = false;
            ErrorMessage.Visible = false;
        }

        public void UpdateActivated()
        {
            // Displayin the relevant items for the Update Farmer function
            bannerDivider.Visible = Visible;
            promptMessage.Visible = Visible;
            promptMessage2.Visible = Visible;
            promptMessage2.Text = "UPDATE FARMER DETAILS";
            promptMessage.Text = "Enter the Farmer ID of the account you wish to update";
            lblFarmerID.Visible = Visible;
            txtFarmerID.Visible = Visible;



            lblFarmerCode.Visible = Visible;
            lblFarmOwner.Visible = Visible;
            lblFarmName.Visible = Visible;
            lblZipCode.Visible = Visible;
            lblFarmerPassword.Visible = Visible;
            lblFarmerEmail.Visible = Visible;



            txtFarmerCode.Visible = Visible;
            txtFarmOwner.Visible = Visible;
            txtFarmName.Visible = Visible;
            txtZipCode.Visible = Visible;
            txtFarmerPassword.Visible = Visible;
            txtFarmerEmail.Visible = Visible;



            createButton.Visible = false;
            deleteNext.Visible = false;
            updateNext.Visible = Visible;
            ErrorMessage.Visible = false;
        }

        public void UpdateDeactivated()
        {
            // Hidding the relevant items for the Update Farmer function
            bannerDivider.Visible = false;
            promptMessage.Visible = false;
            promptMessage2.Visible = false;
            promptMessage2.Text = "Update Farmer Details";
            promptMessage.Text = "Enter the Farmer ID of the account you wish to update";
            GridView1.Visible = false;
            lblFarmerID.Visible = false;
            txtFarmerID.Visible = false;



            lblFarmerCode.Visible = false;
            lblFarmOwner.Visible = false;
            lblFarmName.Visible = false;
            lblZipCode.Visible = false;
            lblFarmerPassword.Visible = false;
            lblFarmerEmail.Visible = false;



            txtFarmerCode.Visible = false;
            txtFarmOwner.Visible = false;
            txtFarmName.Visible = false;
            txtZipCode.Visible = false;
            txtFarmerPassword.Visible = false;
            txtFarmerEmail.Visible = false;
            // Emptying the text boxes
            txtFarmerCode.Text = "";
            txtFarmOwner.Text = "";
            txtFarmName.Text = "";
            txtFarmerEmail.Text = "";
            txtZipCode.Text = "";
            txtFarmerPassword.Text = "";
 


            createButton.Visible = false;
            deleteNext.Visible = false;
            updateNext.Visible = false;
            ErrorMessage.Visible = false;
        }

        public void DeleteActivated()
        {
            // Displayin the relevant items for the Delete Farmer function
            bannerDivider.Visible = Visible;
            promptMessage.Visible = Visible;
            promptMessage2.Text = "DELETE FARMER DETAILS";
            promptMessage2.Visible = Visible;
            promptMessage.Text = "Enter the Farmer ID of the account you wish to delete";
            lblFarmerID.Visible = Visible;
            txtFarmerID.Visible = Visible;



            lblFarmerCode.Visible = false;
            lblFarmOwner.Visible = false;
            lblFarmName.Visible = false;
            lblZipCode.Visible = false;
            lblFarmerPassword.Visible = false;
            lblFarmerEmail.Visible = false;




            txtFarmerCode.Visible = false;
            txtFarmOwner.Visible = false;
            txtFarmName.Visible = false;
            txtZipCode.Visible = false;
            txtFarmerPassword.Visible = false;
            txtFarmerEmail.Visible = false;




            createButton.Visible = false;
            deleteNext.Visible = Visible;
            updateNext.Visible = false;
            ErrorMessage.Visible = false;
        }

        public void DeleteDeactivated()
        {
            // Hiiding the relevant items for the Delete Farmer function
            bannerDivider.Visible = false;
            promptMessage.Visible = false;
            promptMessage2.Text = "Delete Farmer";
            promptMessage2.Visible = false;
            promptMessage.Text = "Enter the Farmer ID of the account you wish to delete";
            GridView1.Visible = false;
            lblFarmerID.Visible = false;
            txtFarmerID.Visible = false;



            lblFarmerCode.Visible = false;
            lblFarmOwner.Visible = false;
            lblFarmName.Visible = false;
            lblZipCode.Visible = false;
            lblFarmerPassword.Visible = false;
            lblFarmerEmail.Visible = false;




            txtFarmerCode.Visible = false;
            txtFarmOwner.Visible = false;
            txtFarmName.Visible = false;
            txtZipCode.Visible = false;
            txtFarmerPassword.Visible = false;
            txtFarmerEmail.Visible = false;
            // Emptying the text boxes
            txtFarmerCode.Text = "";
            txtFarmOwner.Text = "";
            txtFarmName.Text = "";
            txtFarmerEmail.Text = "";
            txtZipCode.Text = "";
            txtFarmerPassword.Text = "";




            createButton.Visible = false;
            deleteNext.Visible = false;
            updateNext.Visible = false;
            ErrorMessage.Visible = false;
        }

        // <------------- Method/Button to enable the 'Create Farmer' features ---------------->
        protected void AddFarmerBtn_Click(object sender, EventArgs e)
        {
            AddActivated();

            // Call the JavaScript function to scroll to the bottom
            ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);
        }

        // <------------- Method which allows the create button to store the values in the database ---------------->
        protected void createButton_Click(object sender, EventArgs e)
        {
            // if statement to check if all fields have been answered

            if (txtFarmerCode.Text == string.Empty || txtFarmOwner.Text == string.Empty || txtFarmName.Text == string.Empty || txtFarmerEmail.Text == string.Empty || txtZipCode.Text == string.Empty || txtFarmerPassword.Text == string.Empty)
            {
                ErrorMessage.Visible = true;
                ErrorMessage.Text = "Error, Please fill in all fields ";
            }
            else
            {
                try
                {
                    // SQL Statement to insert the new values inside the selected table 
                    SqlCommand command2nd = new SqlCommand("INSERT INTO TBL_LOGIN (LOGIN_EMAIL, LOGIN_PASSWORD, ROLE_ID) " +
                                                    "VALUES (@FarmerEmail, @FarmerPassword ,@RoleID)", con);
                    command2nd.Parameters.AddWithValue("@FarmerEmail", txtFarmerEmail.Text);
                    command2nd.Parameters.AddWithValue("@FarmerPassword", txtFarmerPassword.Text);
                    command2nd.Parameters.AddWithValue("@RoleID", 2);

                    command2nd.ExecuteNonQuery();

                    // SQL Statement to insert the new values inside the selected table 
                    SqlCommand command1st = new SqlCommand("INSERT INTO FARMER (FRM_CODE, LOGIN_EMAIL, FRM_OWNER, FRM_NAME, FRM_ZIP_CODE, ROLE_ID) " +
                                                    "VALUES (@FarmerCode, @FarmerEmail, @FarmOwner ,@FarmerName, @ZipCode, @RoleID)", con);

                    // Set parameters
                    command1st.Parameters.AddWithValue("@FarmerCode", txtFarmerCode.Text);
                    command1st.Parameters.AddWithValue("@FarmerEmail", txtFarmerEmail.Text);
                    command1st.Parameters.AddWithValue("@FarmOwner", txtFarmOwner.Text);
                    command1st.Parameters.AddWithValue("@FarmerName", txtFarmName.Text);
                    command1st.Parameters.AddWithValue("@ZipCode", txtZipCode.Text);
                    command1st.Parameters.AddWithValue("@RoleID", 2);


                    //-------------------------------------------------------------

                    command1st.ExecuteNonQuery();



                    con.Close();
                    Label1.Visible = Visible;
                    Label1.Text = "Data has been stored";  // Displaying message to notify the User
                    GridView1.DataBind(); // Sending the information to the table
                                          // Emptying the text boxes
                    AddDeactivated();

                }

                catch (Exception ex)
                {
                    ErrorMessage.Visible = true;
                    ErrorMessage.Text = "Error, your input is invalid " + ex.Message;
                }


            }
        }

        // <------------- Method/Button to enable the 'Update Farmer' features ---------------->
        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            UpdateActivated();

            // Call the JavaScript function to scroll to the bottom
            ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);
        }


        // <------------- Method which allows the update button to update the values in the database ---------------->
        protected void updateNext_Click(object sender, EventArgs e)
        {
            if (txtFarmOwner.Text == string.Empty || txtFarmName.Text == string.Empty || txtFarmerEmail.Text == string.Empty || txtFarmerPassword.Text == string.Empty || txtFarmerCode.Text == string.Empty || txtFarmerID.Text == string.Empty)
            {
                ErrorMessage.Visible = true;
                ErrorMessage.Text = "Error, Please fill in all fields ";
            }
            else
            {
                try
                {
                    // SQL statement to update values inside the selected table that match the entered ID
                    string sql = "UPDATE FARMER SET FRM_OWNER = @Owner, FRM_NAME = @Name, FRM_CODE = @Code, FRM_ZIP_CODE = @ZipCode, LOGIN_EMAIL = @Email WHERE FRM_ID = @ID";
                    SqlCommand cmd = new SqlCommand(sql, con);

                    // Set the parameter values
                    cmd.Parameters.AddWithValue("@Owner", txtFarmOwner.Text);
                    cmd.Parameters.AddWithValue("@Name", txtFarmName.Text);
                    cmd.Parameters.AddWithValue("@Code", txtFarmerCode.Text);
                    cmd.Parameters.AddWithValue("@ZipCode", txtZipCode.Text);
                    cmd.Parameters.AddWithValue("@Email", txtFarmerEmail.Text);
                    cmd.Parameters.AddWithValue("@ID", int.Parse(txtFarmerID.Text));

                    cmd.ExecuteNonQuery();
                    // ---------------------------------------------------------------------------------------------//

                    // SQL statement to update values inside the selected table that match the entered ID
                    string sql2nd = "UPDATE TBL_LOGIN SET LOGIN_EMAIL = @Email, LOGIN_PASSWORD = @Password WHERE LOGIN_EMAIL = @Email";
                    SqlCommand command2nd = new SqlCommand(sql2nd, con);

                    // Set the parameter values
                    command2nd.Parameters.AddWithValue("@Email", txtFarmerEmail.Text);
                    command2nd.Parameters.AddWithValue("@Password", txtFarmerPassword.Text);

                    int rowsAffected = command2nd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Update was successful
                        con.Close();
                        Label1.Visible = Visible;
                        Label1.Text = "Data has been updated";  // Displaying message to notify the User
                        GridView1.DataBind(); // Sending the information to the table
                        UpdateDeactivated();
                    }
                    else
                    {
                        // No rows were affected
                        ErrorMessage.Visible = true;
                        ErrorMessage.Text = "The Email entered is incorrect and does not match any data stored in the database";
                    }



                }
                catch (Exception ex) // Error Handling 
                {
                    ErrorMessage.Visible = true;
                    ErrorMessage.Text = "Error, your input is invalid " + ex.Message;
                }
            }
        }

        // <------------- Method/Button to enable the 'Update Farmer' features ---------------->

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            DeleteActivated();

            // Call the JavaScript function to scroll to the bottom
            ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);
        }
        // <------------- Method which allows the delete button to delete the values in the database ---------------->
        protected void deleteButtonn_Click(object sender, ImageClickEventArgs e)
        {
            if (txtFarmerID.Text == string.Empty)
            {
                ErrorMessage.Visible = true;
                ErrorMessage.Text = "Error, Please fill in all fields ";
            }
            else
            {
                try
                {
                    // SQL Statement to Delete values inside the selected table that match the entered ID
                    SqlCommand cmd = new SqlCommand("delete from FARMER where FRM_ID='" + int.Parse(txtFarmerID.Text) + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Visible = Visible;
                    Label1.Text = "Data has been deleted";  // Displaying message to notify the User
                    GridView1.DataBind(); // Sending the information to the table
                    DeleteDeactivated();

                }
                catch (Exception ex) // Error Handling 
                {
                    ErrorMessage.Visible = true;
                    ErrorMessage.Text = "Error, your input is invalid " + ex.Message;
                }
            }

        }





        // <------------- Method/Button to display a GridView displaying the farmer that matches the farmer id entered ---------------->
        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            try
            {
                // Deactivating the fields
                AddDeactivated();
                UpdateDeactivated();
                DeleteDeactivated();

                // SQL Statement to Lookup values inside the selected table that match the entered ID
                string find = "select * from Farmer where FRM_ID =" + int.Parse(txtSearchToolBar.Text);

                SqlCommand cmd = new SqlCommand(find, con);
                cmd.Parameters.Add("@FRM_ID", SqlDbType.NVarChar).Value = int.Parse(txtSearchToolBar.Text);
                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "FRM_ID");

                GridView1.Visible = true;
                GridView1.DataSourceID = null;
                GridView1.DataSource = ds;
                GridView1.DataBind();

                con.Close();
                Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#009b59");

                Label1.Text = "Data has been selected";  // Displaying message to notify the User
                GridView1.Visible = Visible;
                ErrorMessage.Visible = false;


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