using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Emmanuel_Kianda_ST10081944_PROG7311_POE_PART_2
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmCentralConnectionString"].ConnectionString);
        private static string currentLoggedUser = "";
        int employeeID;
        int farmerID;


        public static string CurrentLoggedUser { get => currentLoggedUser; set => currentLoggedUser = value; }
        public int EmployeeID { get => employeeID; set => employeeID = value; }
        public int FarmerID { get => farmerID; set => farmerID = value; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string uid = txtEmail.Text;
                string pass = txtPassword.Text;
                con.Open();
                string qry = "SELECT ROLE_ID FROM TBL_LOGIN WHERE LOGIN_EMAIL = @LoginEmail AND LOGIN_PASSWORD = @LoginPassword";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@LoginEmail", uid);
                cmd.Parameters.AddWithValue("@LoginPassword", pass);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    currentLoggedUser = txtEmail.Text;
                    Session["LoggedUser"] = currentLoggedUser; // Store the value in Session

                    int roleId = Convert.ToInt32(sdr["ROLE_ID"]);
                    sdr.Close(); // Close the SqlDataReader
                    con.Close();


                    if (roleId == 1)
                    {
                        con.Open();

                        string currentLoggedUser = txtEmail.Text;
                        SqlCommand command3rd = new SqlCommand("SELECT EMP_ID FROM EMPLOYEE WHERE LOGIN_EMAIL = @LoginEmail", con);
                        command3rd.Parameters.AddWithValue("@LoginEmail", currentLoggedUser);
                        SqlDataReader sdrx = command3rd.ExecuteReader();
                        if (sdrx.Read())
                        {
                            int employeeID = sdrx.GetInt32(0); // Retrieve the EMP_ID value from the reader
                            Session["EmployeeID"] = employeeID; // Store the value in Session
                            NotifyLablel.Visible = true;
                            NotifyLablel.Text = "Login Success......!!";
                            Response.Redirect("Home.aspx");
                        }



                    }
                    else if (roleId == 2)
                    {
                        con.Open();

                        string currentLoggedUser = txtEmail.Text;
                        SqlCommand command4th = new SqlCommand("SELECT FRM_ID FROM FARMER WHERE LOGIN_EMAIL = @LoginEmail", con);
                        command4th.Parameters.AddWithValue("@LoginEmail", currentLoggedUser);
                        SqlDataReader sdrx = command4th.ExecuteReader();
                        if (sdrx.Read())
                        {
                            int farmerID = sdrx.GetInt32(0); // Retrieve the FRM_ID value from the reader
                            Session["FarmerID"] = farmerID; // Store the value in Session
                            NotifyLablel.Visible = true;
                            NotifyLablel.Text = "Login Success (Farmer)......!!";
                            Response.Redirect("Home.aspx");
                        }

                    }
                }
                else
                {
                    sdr.Close(); // Close the SqlDataReader
                    NotifyLablel.Visible = true;
                    NotifyLablel.Text = "Email or Password is incorrect. Please try again.";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


        }
    }
}