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
    public partial class Product : System.Web.UI.Page
    {
        // Creating a connection to the Database
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmCentralConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["FarmerID"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
            con.Open();
            if (!IsPostBack)
            {

                    cascadingDropDown();
            }

            }

        }

        // <------------- Method to filter and only allow user to view their own products ---------------->
        public void myProducts()
        {
            // Retrieve the current FarmerID from the session
            int currentID = Convert.ToInt32(Session["FarmerID"]);


            // SQL Statement to Lookup values inside the selected table that match the entered ID
            string find = "SELECT [PROD_CODE], [PTYPE_ID], [PROD_NAME], [PROD_PRICE], [PROD_QTY], [DATE_ADDED], [PROD_ID] FROM [PRODUCT] WHERE FRM_ID = @FRM_ID";

            // Create a new SQL command with the SQL statement and connection
            SqlCommand cmd = new SqlCommand(find, con);
            cmd.Parameters.Add("@FRM_ID", SqlDbType.Int).Value = currentID;

            // Create a new SQL data adapter and dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            // Fill the dataset with the data from the database using the data adapter
            da.Fill(ds, "FRM_ID");

            // Check if any rows are returned in the dataset
            if (ds.Tables["FRM_ID"].Rows.Count > 0)
            {
                // If rows are found, display the retrieved data in the GridView
                GridView1.DataSourceID = null;
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                // If no rows are found, display an error message indicating no products are stored
                ErrorMessage0.Visible = Visible;
                ErrorMessage0.Text = "No Products Stored";
            }


        }

        public void AddActivated()
        {
            // Displaying the relevant items for the Create function
            bannerDivider.Visible = Visible;
            promptMessage.Visible = Visible;
            promptMessage2.Visible = Visible;
            promptMessage2.Text = "Add Product";
            promptMessage.Text = "Enter the values of the following fields";
            lblProductID.Visible = false;
            txtProductID.Visible = false;

            // Displaying the labels for the product details
            lblProductrCode.Visible = Visible;
            lblProductName.Visible = Visible;
            lblProductType.Visible = Visible;
            lblProductPrice.Visible = Visible;
            lblProductQuantity.Visible = Visible;
            lblDateAdded.Visible = Visible;

            // Displaying the input fields for the product details
            txtProductrCode.Visible = Visible;
            txtProductName.Visible = Visible;
            ddlProductType.Visible = Visible;
            txtProductPrice.Visible = Visible;
            txtProductQuantity.Visible = Visible;
            txtDateAdded.Visible = Visible;

            // Displaying the calendar and buttons
            CalendarData.Visible = Visible;
            createProduct.Visible = Visible;
            deleteProd.Visible = false;
            updateProduct.Visible = false;

            // Hiding the error message
            ErrorMessage.Visible = false;
        }

        public void AddDeactivated()
        {
            // Displaying the relevant items for the Create function
            bannerDivider.Visible = false;
            promptMessage.Visible = false;
            promptMessage2.Visible = false;
            lblProductID.Visible = false;
            txtProductID.Visible = false;

            // Hidding the labels for the product details
            lblProductrCode.Visible = false;
            lblProductName.Visible = false;
            lblProductType.Visible = false;
            lblProductPrice.Visible = false;
            lblProductQuantity.Visible = false;
            lblDateAdded.Visible = false;

            // Hidding the input fields for the product details
            txtProductrCode.Visible = false;
            txtProductName.Visible = false;
            ddlProductType.Visible = false;
            txtProductPrice.Visible = false;
            txtProductQuantity.Visible = false;
            txtDateAdded.Visible = false;

            // Hidding the calendar and buttons
            CalendarData.Visible = false;
            createProduct.Visible = false;
            deleteProd.Visible = false;
            updateProduct.Visible = false;

            txtProductrCode.Text = ""; // Clear the Product Code text box
            txtProductName.Text = ""; // Clear the Product Name text box
            ddlProductType.ClearSelection(); // Clear the selected value in the Product Type dropdown list
            txtProductPrice.Text = ""; // Clear the Product Price text box
            txtProductQuantity.Text = ""; // Clear the Product Quantity text box
            txtDateAdded.Text = ""; // Clear the Date Added text box
            ErrorMessage.Visible = false; // Hide the error message

        }

        // <------------- Method/Button to enable the 'Create Product' features ---------------->
        protected void btnAddProduct_Click(object sender, ImageClickEventArgs e)
        {
            AddActivated();

            // Call the JavaScript function to scroll to the bottom
            ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);
        }

        // <------------- Method which allows the create button to store the values in the database ---------------->
        protected void createProduct_Click(object sender, EventArgs e)
        {
            // If statement to check if all fields have been answered
            if (txtProductrCode.Text == string.Empty || txtProductName.Text == string.Empty || ddlProductType.Text == string.Empty || txtProductPrice.Text == string.Empty || txtDateAdded.Text == string.Empty)
            {
                // If any field is empty, display an error message
                ErrorMessage.Visible = true;
                ErrorMessage.Text = "Error, Please fill in all fields";
            }
            else
            {
                // If all fields have been answered, proceed with inserting the new values

                // SQL Statement to insert the new values inside the selected table
                SqlCommand cmd = new SqlCommand("INSERT INTO PRODUCT (PROD_CODE, FRM_ID, PROD_NAME, PTYPE_ID, PROD_PRICE, PROD_QTY, DATE_ADDED) " +
                                                "VALUES (@ProductCode, @FarmerNowID, @ProductName, @ProductType, @ProductPrice, @ProductQuantity, @DateAdded)", con);

                // Retrieve the current FarmerID from the session
                int currentID = Convert.ToInt32(Session["FarmerID"]);

                // Set parameter values to prevent SQL injection
                cmd.Parameters.AddWithValue("@ProductCode", txtProductrCode.Text); // Set the value for Product Code parameter
                cmd.Parameters.AddWithValue("@FarmerNowID", currentID); // Set the value for Farmer ID parameter
                cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text); // Set the value for Product Name parameter
                cmd.Parameters.AddWithValue("@ProductType", Convert.ToInt32(ddlProductType.SelectedValue)); // Set the value for Product Type parameter
                cmd.Parameters.AddWithValue("@ProductPrice", txtProductPrice.Text); // Set the value for Product Price parameter
                cmd.Parameters.AddWithValue("@ProductQuantity", txtProductQuantity.Text); // Set the value for Product Quantity parameter
                cmd.Parameters.AddWithValue("@DateAdded", txtDateAdded.Text); // Set the value for Date Added parameter

                cmd.ExecuteNonQuery(); // Execute the SQL command to insert the values into the table

                con.Close(); // Close the database connection
                Label1.Visible = Visible; // Set the visibility of Label1
                Label1.Text = "Data has been stored"; // Display a success message
                GridView1.DataBind(); // Update the GridView with the new data
                AddDeactivated();

            }

        }

        public void UpdatedActivated()
        {
            // Displaying the relevant items for the Update function
            bannerDivider.Visible = Visible; // Set the visibility of bannerDivider
            promptMessage.Visible = Visible; // Set the visibility of promptMessage
            promptMessage2.Visible = Visible; // Set the visibility of promptMessage2
            promptMessage2.Text = "Update Product Details"; // Set the text of promptMessage2
            promptMessage.Text = "Enter the Farmer ID of the account you wish to update"; // Set the text of promptMessage
            lblProductID.Visible = Visible; // Set the visibility of lblProductID
            txtProductID.Visible = Visible; // Set the visibility of txtProductID

            // Set the visibility for the relevant labels
            lblProductrCode.Visible = Visible;
            lblProductName.Visible = Visible;
            lblProductType.Visible = Visible;
            lblProductPrice.Visible = Visible;
            lblProductQuantity.Visible = Visible;
            lblDateAdded.Visible = Visible;

            // Set the visibility for the relevant text boxes
            txtProductrCode.Visible = Visible;
            txtProductName.Visible = Visible;
            ddlProductType.Visible = Visible;
            txtProductPrice.Visible = Visible;
            txtProductQuantity.Visible = Visible;
            txtDateAdded.Visible = Visible;

            CalendarData.Visible = Visible; // Set the visibility of CalendarData

            createProduct.Visible = false; // Set the visibility of createProduct to false
            deleteProd.Visible = false; // Set the visibility of deleteProd to false
            updateProduct.Visible = Visible; // Set the visibility of updateProduct
            ErrorMessage.Visible = false; // Set the visibility of ErrorMessage to false
        }

        public void UpdateDeactivated()
        {
            // Hidding the relevant items for the Update function
            bannerDivider.Visible = false; // Set the visibility of bannerDivider
            promptMessage.Visible = false; // Set the visibility of promptMessage
            promptMessage2.Visible = false; // Set the visibility of promptMessage2
            GridView1.Visible = false; // Set the visibility of GridView1
            lblProductID.Visible = false; // Set the visibility of lblProductID
            txtProductID.Visible = false; // Set the visibility of txtProductID

            // Set the visibility for the relevant labels
            lblProductrCode.Visible = false;
            lblProductName.Visible = false;
            lblProductType.Visible = false;
            lblProductPrice.Visible = false;
            lblProductQuantity.Visible = false;
            lblDateAdded.Visible = false;

            // Set the visibility for the relevant text boxes
            txtProductrCode.Visible = false;
            txtProductName.Visible = false;
            ddlProductType.Visible = false;
            txtProductPrice.Visible = false;
            txtProductQuantity.Visible = false;
            txtDateAdded.Visible = false;
            GridView1.Visible = false; // Set the visibility of GridView1

            CalendarData.Visible = false; // Set the visibility of CalendarData

            createProduct.Visible = false; // Set the visibility of createProduct to false
            deleteProd.Visible = false; // Set the visibility of deleteProd to false
            updateProduct.Visible = false; // Set the visibility of updateProduct
            ErrorMessage.Visible = false; // Set the visibility of ErrorMessage to false

            // Emptying the text boxes
            txtProductrCode.Text = "";
            txtProductName.Text = "";
            ddlProductType.ClearSelection();
            txtProductPrice.Text = "";
            txtProductQuantity.Text = "";
            txtDateAdded.Text = "";
        }

        // <------------- Method/Button to enable the 'Update Product' features ---------------->
        protected void btnUpdateProduct_Click(object sender, ImageClickEventArgs e)
        {
            // Call the JavaScript function to scroll to the bottom
            ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);
            myProducts(); // Filtering the GridView to only display the user's products
            UpdatedActivated();

        }

        // <------------- Method which allows the update button to update the values in the database ---------------->
        protected void updateProduct_Click(object sender, EventArgs e)
        {

            if (txtProductrCode.Text == string.Empty || txtProductName.Text == string.Empty || ddlProductType.Text == string.Empty || txtProductPrice.Text == string.Empty || txtProductQuantity.Text == string.Empty || txtDateAdded.Text == string.Empty)
            {
                ErrorMessage.Visible = true; // Set the visibility of ErrorMessage to true
                ErrorMessage.Text = "Error, Please fill in all fields "; // Set the text of ErrorMessage
            }
            else
            {
                try
                {
                    // SQL Statement to Update values inside the selected table that match the entered ID
                    SqlCommand cmd = new SqlCommand("UPDATE PRODUCT SET PROD_CODE = @ProdCode, PROD_NAME = @ProdName, PTYPE_ID = @ProdTypeId, PROD_PRICE = @ProdPrice, PROD_QTY = @ProdQty, DATE_ADDED = @DateAdded WHERE FRM_ID = @ProductId", con);

                    // Set the parameter values
                    cmd.Parameters.AddWithValue("@ProdCode", txtProductrCode.Text);
                    cmd.Parameters.AddWithValue("@ProdName", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@ProdTypeId", Convert.ToInt32(ddlProductType.SelectedValue));
                    cmd.Parameters.AddWithValue("@ProdPrice", txtProductPrice.Text);
                    cmd.Parameters.AddWithValue("@ProdQty", txtProductQuantity.Text);
                    cmd.Parameters.AddWithValue("@DateAdded", txtDateAdded.Text);
                    cmd.Parameters.AddWithValue("@ProductId", int.Parse(txtProductID.Text));

                    cmd.ExecuteNonQuery(); // Execute the SQL command
                    con.Close(); // Close the database connection
                    Label1.Visible = Visible; // Set the visibility of Label1
                    Label1.Text = "Data has been updated"; // Set the text of Label1 to notify the User
                    GridView1.DataBind(); // Refresh the data in GridView1
                    UpdateDeactivated();
                }
                catch (Exception ex) // Error Handling
                {
                    ErrorMessage.Visible = true; // Set the visibility of ErrorMessage to true
                    ErrorMessage.Text = "Error, your input is invalid " + ex.Message; // Set the text of ErrorMessage with the error message
                }
            }

        }

        // <------------- Method/Button to enable the 'Delete Product' features ---------------->

        public void DeleteActivated()
        {
            // Displaying the relevant items for the Delete function
            bannerDivider.Visible = Visible; // Set the visibility of bannerDivider
            promptMessage.Visible = Visible; // Set the visibility of promptMessage
            promptMessage2.Text = "Delete Product"; // Set the text of promptMessage2 to "Delete Product"
            promptMessage2.Visible = Visible; // Set the visibility of promptMessage2
            promptMessage.Text = "Enter the Farmer ID of the account you wish to delete"; // Set the text of promptMessage
            lblProductID.Visible = Visible; // Set the visibility of lblProductID
            txtProductID.Visible = Visible; // Set the visibility of txtProductID

            // Set the visibility of the relevant labels to false
            lblProductrCode.Visible = false;
            lblProductName.Visible = false;
            lblProductType.Visible = false;
            lblProductPrice.Visible = false;
            lblProductQuantity.Visible = false;
            lblDateAdded.Visible = false;

            // Set the visibility of the relevant text boxes to false
            txtProductrCode.Visible = false;
            txtProductName.Visible = false;
            ddlProductType.Visible = false;
            txtProductPrice.Visible = false;
            txtProductQuantity.Visible = false;
            txtDateAdded.Visible = false;

            CalendarData.Visible = false; // Set the visibility of CalendarData to false

            createProduct.Visible = false; // Set the visibility of createProduct to false
            deleteProd.Visible = Visible; // Set the visibility of deleteProd
            updateProduct.Visible = false; // Set the visibility of updateProduct to false
            ErrorMessage.Visible = false; // Set the visibility of ErrorMessage to false
        }

        public void DeleteDeactivated()
        {
            // Hidding the relevant items for the Delete function
            bannerDivider.Visible = false; // Set the visibility of bannerDivider
            promptMessage.Visible = false; // Set the visibility of promptMessage
            promptMessage2.Text = "Delete Product"; // Set the text of promptMessage2 to "Delete Product"
            promptMessage2.Visible = false; // Set the visibility of promptMessage2
            promptMessage.Text = "Enter the Farmer ID of the account you wish to delete"; // Set the text of promptMessage
            GridView1.Visible = false; // Set the visibility of GridView1
            lblProductID.Visible = false; // Set the visibility of lblProductID
            txtProductID.Visible = false; // Set the visibility of txtProductID

            // Set the visibility of the relevant labels to false
            lblProductrCode.Visible = false;
            lblProductName.Visible = false;
            lblProductType.Visible = false;
            lblProductPrice.Visible = false;
            lblProductQuantity.Visible = false;
            lblDateAdded.Visible = false;

            // Set the visibility of the relevant text boxes to false
            txtProductrCode.Visible = false;
            txtProductName.Visible = false;
            ddlProductType.Visible = false;
            txtProductPrice.Visible = false;
            txtProductQuantity.Visible = false;
            txtDateAdded.Visible = false;

            CalendarData.Visible = false; // Set the visibility of CalendarData to false

            createProduct.Visible = false; // Set the visibility of createProduct to false
            deleteProd.Visible = false; // Set the visibility of deleteProd
            updateProduct.Visible = false; // Set the visibility of updateProduct to false
            ErrorMessage.Visible = false; // Set the visibility of ErrorMessage to false

            // Emptying the text boxes
            txtProductrCode.Text = "";
            txtProductName.Text = "";
            ddlProductType.Text = "";
            txtProductPrice.Text = "";
            txtProductQuantity.Text = "";
            txtDateAdded.Text = "";

        }
        protected void btnDeleteProduct_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);
            myProducts(); // Filtering the GridView to only display the user's products
            DeleteActivated();

        }

        // <------------- Method which allows the delete button to delete the values in the database ---------------->
        protected void deleteProd_Click(object sender, EventArgs e)
        {


            if (txtProductID.Text == string.Empty)
            {
                ErrorMessage.Visible = true;
                ErrorMessage.Text = "Error, Please fill in all fields ";
            }
            else
            {
                try
                {
                    // SQL Statement to Delete values inside the selected table that match the entered ID
                    SqlCommand cmd = new SqlCommand("delete from PRODUCT where PROD_ID='" + int.Parse(txtProductID.Text) + "'", con);
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



        // <------------- Method/Button to display a GridView displaying all of the user's stored products ---------------->

        protected void btnViewProducts_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                // Call the JavaScript function to scroll to the bottom
                ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);

                myProducts(); // Filtering the GridView to only display the user's products
                GridView1.Visible = true; // Set the visibility of GridView1

                con.Close(); // Close the database connection
                Label1.Text = "Data has been selected";  // Display a message to notify the User
                ErrorMessage0.Visible = false; // Set the visibility of ErrorMessage0 to false
                ErrorMessage.Visible = false; // Set the visibility of ErrorMessage to false
            }
            catch (Exception ex) // Error Handling 
            {
                ErrorMessage0.Visible = true; // Set the visibility of ErrorMessage0 to true
                ErrorMessage0.Text = "Error, your input is invalid, " + ex.Message; // Display an error message with the exception details
            }


        }

        protected void cascadingDropDown()
        {


            // SQL query to retrieve PTYPE_ID and PTYPE_NAME values from the PRODUCT_TYPE table
            string query = "SELECT PTYPE_ID, PTYPE_NAME FROM PRODUCT_TYPE";

            // Establish a connection using the connection string from the configuration file
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmCentralConnectionString"].ConnectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open(); // Open the database connection

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

        protected void CalendarData_SelectionChanged(object sender, EventArgs e)
        {
            txtDateAdded.Text = CalendarData.SelectedDate.ToString("dd-MM-yyyy"); // Taking the User input and formatting it
                                                                                  // Call the JavaScript function to scroll to the bottom
            ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);

        }

        protected void ddlProductType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Call the JavaScript function to scroll to the bottom
            ScriptManager.RegisterStartupScript(this, GetType(), "ScrollDownScript", "ScrollToBottom();", true);
        }
    }
}