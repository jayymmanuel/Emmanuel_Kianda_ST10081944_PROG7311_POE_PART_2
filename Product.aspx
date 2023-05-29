<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Emmanuel_Kianda_ST10081944_PROG7311_POE_PART_2.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <style type="text/css">

                body {

        background-image:url("Images/hub-background-main.JPG");
        background-repeat: no-repeat;
        background-size: 100% auto;
        background-position: center;
        background-size: cover;
        }

@font-face {
    font-family: 'orbitronregular';
    src: url('../fonts/orbitronregular.ttf') format('truetype');
}

@font-face {
    font-family: 'Bahnschrift';
    src: url('../fonts/Bahnschrift.ttf') format('truetype');

}

.green-button {
    color: white;
    background-color: #009d5c;
    border: none;
    font-family: orbitronregular;
    height: 50px;
}

            .auto-style1 {
                border-style: none;
                border-color: inherit;
                border-width: medium;
                color: white;
                background-color: #009d5c;
            }
            .spacer-row {
    height: 35px;
}

    .table-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }

               .button-container {
            display: inline-block;
            margin: 0;
            padding: 0;
        }

               .buttonContainer {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .buttonContainer > * {
        margin-right: 0px;
    }


    .auto-style2 {
        width: 250px;
        height: 20px;
    }
    .auto-style3 {
        width: 663px;
        height: 34px;
    }
    .auto-style4 {
        width: 663px;
        height: 8px;
    }
    .auto-style5 {
        text-align: center;
        height: 34px;
        width: 663px;
    }
    .auto-style6 {
        width: 663px;
    }
    .auto-style7 {
        width: 663px;
        height: 20px;
    }

    .text-center {
    text-align: center;
}

.modal-table {
    margin: 0 auto;
}



    </style>
    <script type="text/javascript">
        function ScrollToBottom() {
            var windowHeight = window.innerHeight;
            var offset = 400; // Adjust this value to set the desired scroll offset
            window.scrollTo(50, document.body.scrollHeight - windowHeight - offset);
        }
    </script>

<div class="table-container">
    <table class="nav-justified" style="width: 610px">
        <tr>
            <td class="modal-sm" style="width: 4964px">&nbsp;</td>
            <td style="width: 127px">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="modal-sm">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr class="spacer-row">
            <td class="auto-style2" colspan="3"></td>
        </tr>
        <tr>
            <td class="text-center" style="height: 20px; font-family: orbitronregular; font-size: 50px; color: white;" colspan="6">PRODUCT HUB</td>
        </tr>
        <tr>
            <td class="text-center" style="height: 20px; font-family: Bahnschrift; font-size: large; color: white;" colspan="6"><strong>This task page enables creating, updating, deleting, and searching products in the database.</strong></td>
        </tr>
    </table>
</div>
    <table class="nav-justified">

        <tr>
            <td class="modal-sm" style="width: 1309px">&nbsp;</td>
            <td style="width: 875px" class="modal-lg">&nbsp;</td>
            <td style="width: 1255px" class="modal-sm">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="modal-sm">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 1309px">&nbsp;</td>
            <td style="width: 875px" class="modal-lg">&nbsp;</td>
            <td style="width: 1255px" class="modal-sm"><strong>
                <asp:Label ID="ErrorMessage0" runat="server" ForeColor="Red" Text="Default Error Message" Font-Names="Bahnschrift" Visible="False"></asp:Label>
                </strong></td>
            <td>&nbsp;</td>
            <td class="modal-sm">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

                                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                        <tr>
    <td class="modal-sm" style="height: 46px; text-align: center; position: relative;" colspan="7">
        <div class="buttonContainer">

        <asp:ImageButton ID="btnAddProduct" runat="server" ImageUrl="~/Images/button-add.PNG" Height="138px" Width="138px" OnClick="btnAddProduct_Click" />
        <asp:ImageButton ID="btnUpdateProduct" runat="server" ImageUrl="~/Images/button-update.PNG" Height="138px" Width="138px" OnClick="btnUpdateProduct_Click"/>
        <asp:ImageButton ID="btnDeleteProduct" runat="server" ImageUrl="~/Images/button-delete.PNG" Height="138px" Width="138px" OnClick="btnDeleteProduct_Click"/>
        <asp:ImageButton ID="btnViewProducts" runat="server" ImageUrl="~/Images/button-myproducts.PNG" Height="138px" Width="138px" OnClick="btnViewProducts_Click"/>

    <script type="text/javascript">
        // Register the client-side function to be called after the button click event
        function btnAddProduct_Click() {
            ScrollDown();
        }

        function btnUpdateProduct_Click() {
            ScrollDown();
        }

        function btnDeleteProduct_Click() {
            ScrollDown();
        }

    </script>
        </div>
    
            </td>
</tr>
      


        <tr>
            <td class="modal-sm" style="height: 46px; text-align: center;" colspan="7"><strong>
                <asp:Label ID="Label1" runat="server" ForeColor="#009b59" Text="Default Message" Font-Names="Bahnschrift" Visible="False"></asp:Label>
                </strong></td>
        </tr>
<tr>
    <td class="text-center" colspan="7">
        <table class="modal-table">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PROD_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical" Width="1069px" Visible="False" AllowSorting="True" Font-Bold="True" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="PROD_ID" HeaderText="PRODUCT ID" InsertVisible="False" SortExpression="PROD_ID" ReadOnly="True" />
                        <asp:BoundField DataField="PROD_CODE" HeaderText="PRODUCT CODE" SortExpression="PROD_CODE" />
                        <asp:BoundField DataField="PTYPE_ID" HeaderText="PRODUCT TYPE ID" SortExpression="PTYPE_ID" />
                        <asp:BoundField DataField="PROD_NAME" HeaderText="PRODUCT NAME" SortExpression="PROD_NAME" />
                        <asp:BoundField DataField="PROD_PRICE" HeaderText="PRODUCT PRICE" SortExpression="PROD_PRICE"></asp:BoundField>
                        <asp:BoundField DataField="PROD_QTY" HeaderText="QUANTITY" SortExpression="PROD_QTY"></asp:BoundField>
                        <asp:BoundField DataField="DATE_ADDED" HeaderText="DATE ADDED" SortExpression="DATE_ADDED" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
               </td>
            </tr>
        </table>
    </td>
</tr>
        </table>
    <div class="text-center">
    </div>
    <br />
    <table class="nav-justified">
        <tr>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: left;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: left;">
                &nbsp;</td>
            <td style="width: 127px; height: 20px;">&nbsp;</td>
            <td style="width: 127px; height: 20px;">&nbsp;</td>
            <td style="width: 383px; height: 20px;" class="modal-sm">&nbsp;</td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: left;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: left;">
                &nbsp;</td>
            <td style="height: 20px;" colspan="3">&nbsp;</td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: center;">
                <asp:Image ID="bannerDivider" runat="server" Height="35px" ImageUrl="~/Images/banner-divide.PNG" Visible="False" Width="239px" />
            </td>
            <td style="height: 20px;" colspan="3">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT [PROD_ID], [PROD_CODE], [PTYPE_ID], [PROD_NAME], [PROD_PRICE], [PROD_QTY], [DATE_ADDED] FROM [PRODUCT] WHERE FRM_ID = @FarmerID">
    <SelectParameters>
        <asp:SessionParameter Name="FarmerID" SessionField="FarmerID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

            </td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <%-- 2nd Prompt Message to User --%>
        <tr>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: center;">&nbsp;</td>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: center;"><strong>
                <asp:Label ID="promptMessage2" runat="server" Text="Default Message" Font-Names="Bahnschrift" style="font-size: xx-large; color: white;" Visible="False"></asp:Label>
                </strong></td>
            <td style="height: 20px;" colspan="3">
                &nbsp;</td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: center;">&nbsp;</td>
            <td class="modal-sm" style="width: 1268px; height: 20px; text-align: center;"><strong>
                <asp:Label ID="promptMessage" runat="server" Text="Default Message" Font-Names="Bahnschrift" style="font-size: x-large" Visible="False" ForeColor="#009b59"></asp:Label>
                </strong></td>
            <td style="width: 127px; height: 20px;"></td>
            <td style="width: 127px; height: 20px;"></td>
            <td style="width: 383px; height: 20px;" class="modal-sm"></td>
            <td style="width: 102px; height: 20px;"></td>
            <td style="height: 20px"></td>
        </tr>
        </table>
    <p>
    </p>
    <table class="nav-justified">
        <tr>
            <td class="auto-style7" style="text-align: center;">&nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 20px; text-align: center;">&nbsp;</td>
            <td style="width: 144px; height: 20px;"><strong>
                <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red" Text="Default Error Message" Font-Names="Bahnschrift" Visible="False"></asp:Label>
                </strong></td>
            <td style="width: 118px; height: 20px;">&nbsp;</td>
            <td style="width: 383px; height: 20px;" class="modal-sm">&nbsp;</td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>


        <%-- Start of 'Add Farmer Fields'--%>

                <%-- Product ID--%>

                <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblProductID" runat="server" Text="PRODUCT ID" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px">
                <asp:TextBox ID="txtProductID" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
            </td>

                                            <td style="width: 118px; height: 34px;">
        <asp:Button ID="deleteProd" runat="server" Text="DELETE" Onclick="deleteProd_Click" CssClass="green-button" style="margin-left: 10px;" Height="51px" Width="120px" Visible="False" />

            </td>
            <td style="width: 102px; height: 34px"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>
                                     <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                <%-- Product Code--%>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 480px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblProductrCode" runat="server" Text="PRODUCT CODE" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtProductrCode" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
            </td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>
                                             <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                        <%-- Product Name--%>

        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblProductName" runat="server" Text="PRODUCT NAME" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtProductName" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
            </td>
            <td style="width: 118px; height: 34px;">&nbsp;</td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>
                                     <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                        <%-- Product Type--%>

        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblProductType" runat="server" Text="TYPE" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:DropDownList ID="ddlProductType" runat="server" AutoPostBack="true" Visible="False"  Width="285px" Height="26px" OnSelectedIndexChanged="ddlProductType_SelectedIndexChanged" ></asp:DropDownList>
            </td>
            <td style="width: 118px; height: 34px;">&nbsp;</td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>

                                     <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                        <%-- Product Price--%>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblProductPrice" runat="server" Text="PRICE" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtProductPrice" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
            </td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>

                                     <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                <%-- Product Quantity--%>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblProductQuantity" runat="server" Text="QUANTITY" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtProductQuantity" runat="server" Visible="False" Width="285px" Height="26px"></asp:TextBox>
            </td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>

                                             <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                <%-- Product Date Added--%>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblDateAdded" runat="server" Font-Names="Bahnschrift" Text="ENTER DATE" Visible="False" style="font-size: medium; color:white"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtDateAdded" runat="server" Visible="False" Width="285px" Height="26px" Font-Names="Bahnschrift" ReadOnly="True" style="margin-left: 0px;" placeholder="Select Date from calendar"></asp:TextBox>
            </td>
                                    <td style="width: 118px; height: 34px;">
        <asp:Button ID="updateProduct" runat="server" Text="UPDATE" OnClick="updateProduct_Click" CssClass="auto-style1" style="margin-left: 10px;" Height="51px" Width="120px" Visible="False" />

            </td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>

                        <%-- Product Date Added--%>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                &nbsp;</td>
<td class="auto-style2" colspan="3" style="text-align: center; margin-left: 100px;">
    &nbsp;</td>

            <td style="width: 102px; height: 34px;">&nbsp;</td>
            <td style="height: 34px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="Label2" runat="server" Text="         " Visible="False" style="font-size: medium; color:white"></asp:Label>
                </strong>
            </td>
<td class="auto-style2" colspan="3" style="text-align: center; margin-left: 100px;"><asp:Calendar ID="CalendarData" runat="server" BackColor="#406c51"  BorderWidth="0px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#aaedcc" Height="254px" Width="276px" OnSelectionChanged="CalendarData_SelectionChanged" Visible="False">
        <DayHeaderStyle BackColor="#406c51" ForeColor="#ffffff" Height="1px" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
        <TitleStyle BackColor="#009b59" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#ffffff" Height="25px" />
        <TodayDayStyle BackColor="#406c51" ForeColor="White" />
        <WeekendDayStyle BackColor="#406c51" />
    </asp:Calendar>
    
</td>

            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%-------------------------------------------End of Fields-------------------------------------- --%>



                                     <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
        <tr>
            <td class="auto-style4" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 8px; text-align: center;">
            </td>
            <td style="width: 144px; height: 8px">
            </td>
            <td style="width: 118px; height: 8px"></td>
            <td style="width: 102px; height: 8px"></td>
            <td style="height: 8px"></td>
        </tr>
        <tr>
            <td class="auto-style5">
                &nbsp;</td>
            <td style="height: 34px; width: 250px" class="text-center">
                &nbsp;</td>
            <td style="height: 34px; width: 144px" class="text-center">
        <asp:Button ID="createProduct" runat="server" Text="CREATE" Onclick="createProduct_Click" CssClass="green-button" style="margin-left: 10px;" Height="51px" Width="120px" Visible="False" />

            </td>
            <td style="height: 34px; width: 118px"></td>
            <td style="height: 34px; width: 102px"></td>
            <td style="height: 34px"></td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                &nbsp;</td>
            <td style="width: 144px; height: 34px;">
                &nbsp;</td>
            <td style="width: 118px; height: 34px;" class="text-center">
                &nbsp;</td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 20px;">&nbsp;</td>
            <td style="width: 144px; height: 20px;" class="text-center">
                &nbsp;</td>
            <td style="width: 118px; height: 20px;">&nbsp;</td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 20px;"></td>
            <td style="width: 144px; height: 20px;" class="text-center">
                &nbsp;</td>
            <td style="width: 118px; height: 20px;"></td>
            <td style="width: 102px; height: 20px;"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="modal-sm" style="width: 250px">&nbsp;</td>
            <td style="width: 144px">&nbsp;</td>
            <td style="width: 118px" class="modal-sm">&nbsp;</td>
            <td style="width: 102px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px">
                &nbsp;</td>
            <td style="width: 144px">&nbsp;</td>
            <td style="width: 118px" class="modal-sm">&nbsp;</td>
            <td style="width: 102px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                &nbsp;</td>
            <td colspan="6">
                <table class="nav-justified">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    </table>
            </td>
        </tr>
    </table>
</asp:Content>
