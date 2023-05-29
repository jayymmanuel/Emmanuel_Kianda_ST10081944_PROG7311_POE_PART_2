<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FarmerHub.aspx.cs" Inherits="Emmanuel_Kianda_ST10081944_PROG7311_POE_PART_2.FarmerHub" %>
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
            var offset = 200; // Adjust this value to set the desired scroll offset
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
            <td class="text-center" style="height: 20px; font-family: orbitronregular; font-size: 50px; color: white;" colspan="6">MANAGE FARMER</td>
        </tr>
        <tr>
            <td class="text-center" style="height: 20px; font-family: Bahnschrift; font-size: large; color: white;" colspan="6"><strong>This task page enables creating, updating, deleting, and searching farmers in the database.</strong></td>
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

        <%-- Search Button--%>
        <tr>
    <td class="modal-sm" style="height: 46px; text-align: center;" colspan="7">
        <asp:Button ID="SearchButtonn" runat="server" Text="SEARCH" OnClick="SearchBtn_Click" CssClass="green-button" style="margin-left: 10px;" Height="51px" Width="120px" />
       <asp:TextBox ID="txtSearchToolBar" runat="server" ForeColor="Black" Height="51px" Width="338px" 
    style="margin-left: 10px;" Font-Names="Bahnschrift" placeholder="   ENTER THE FARMER ID"></asp:TextBox>

    </td>


</tr>
<%--------------------------------------------------------------------- -------------------------------------------%>
                                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                        <tr>
    <td class="modal-sm" style="height: 46px; text-align: center; position: relative;" colspan="7">
        <div class="buttonContainer">

        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/button-add-farmer.PNG" Height="138px" Width="138px" OnClick="AddFarmerBtn_Click" />
        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/button-update.PNG" Height="138px" Width="138px" OnClick="UpdateBtn_Click"/>
        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/button-delete.PNG" Height="138px" Width="138px" OnClick="DeleteBtn_Click"/>



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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="FRM_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical" Width="1069px" Visible="False" AllowSorting="True" Font-Bold="True" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="FRM_ID" HeaderText="FRM_ID" InsertVisible="False" ReadOnly="True" SortExpression="FRM_ID" />
                        <asp:BoundField DataField="FRM_OWNER" HeaderText="FRM_OWNER" SortExpression="FRM_OWNER" />
                        <asp:BoundField DataField="FRM_CODE" HeaderText="FRM_CODE" SortExpression="FRM_CODE" />
                        <asp:BoundField DataField="FRM_NAME" HeaderText="FRM_NAME" SortExpression="FRM_NAME" />
                        <asp:BoundField DataField="FRM_ZIP_CODE" HeaderText="FRM_ZIP_CODE" SortExpression="FRM_ZIP_CODE" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FarmCentralConnectionString %>" SelectCommand="SELECT [FRM_ID], [FRM_OWNER], [FRM_CODE], [FRM_NAME], [FRM_ZIP_CODE] FROM [FARMER]"></asp:SqlDataSource>
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

                <%-- Farmer ID--%>

                <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblFarmerID" runat="server" Text="FARMER ID" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px">
                <asp:TextBox ID="txtFarmerID" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
            </td>

                                            <td style="width: 118px; height: 34px;">
        <asp:Button ID="deleteNext" runat="server" Text="DELETE" Onclick="updateNext_Click" CssClass="green-button" style="margin-left: 10px;" Height="51px" Width="120px" Visible="False" />

            </td>
            <td style="width: 102px; height: 34px"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>
                                     <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                <%-- Farmer Code--%>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblFarmerCode" runat="server" Text="FARMER CODE" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtFarmerCode" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
            </td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>
                                             <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                        <%-- Farm Owner--%>

        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblFarmOwner" runat="server" Text="FARM OWNER" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtFarmOwner" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
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
                        <%-- Farme Name--%>

        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblFarmName" runat="server" Text="FARM NAME" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtFarmName" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
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
                        <%-- Farmer Email--%>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 480px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblFarmerEmail" runat="server" Text="EMAIL ADDRESS" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtFarmerEmail" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
            </td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>

                                     <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                <%-- Farmer Password--%>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblFarmerPassword" runat="server" Text="PASSWORD" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtFarmerPassword" runat="server" Visible="False" Width="285px" Height="26px"></asp:TextBox>
            </td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>

                                             <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                                <%-- Farmer ZIP CODE--%>
        <tr>
            <td class="auto-style3" style="text-align: center;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 250px; height: 34px; text-align: center;">
                <strong>
                <asp:Label ID="lblZipCode" runat="server" Text="AREA ZIP CODE" Font-Names="Bahnschrift" Visible="False" ForeColor="White" style="font-size: medium"></asp:Label>
                </strong>
            </td>
            <td style="width: 144px; height: 34px;">
                <asp:TextBox ID="txtZipCode" runat="server" Visible="False"  Width="285px" Height="26px"></asp:TextBox>
            </td>
                        <td style="width: 118px; height: 34px;">
        <asp:Button ID="updateNext" runat="server" Text="UPDATE" Onclick="updateNext_Click" CssClass="green-button" style="margin-left: 10px;" Height="51px" Width="120px" Visible="False" />

            </td>
            <td style="width: 102px; height: 34px;"></td>
            <td style="height: 34px"></td>
        </tr>
                        <%--------------------------------------------------------------------------------- --%>



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
        <asp:Button ID="createButton" runat="server" Text="CREATE" Onclick="createButton_Click" CssClass="green-button" style="margin-left: 10px;" Height="51px" Width="120px" Visible="False" />

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
