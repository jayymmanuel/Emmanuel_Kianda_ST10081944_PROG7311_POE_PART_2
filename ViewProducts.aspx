<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="Emmanuel_Kianda_ST10081944_PROG7311_POE_PART_2.ViewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                <style type="text/css">

                body {

        background-image:url("Images/hub-background-alt.JPG");
        background-repeat: no-repeat;
        background-size: 100% auto;
        background-position: center;
        background-size: cover;
        }

@font-face {
    font-family: 'orbitronregular';
    src: url('../fonts/orbitronregular.ttf') format('truetype');
}
        .green-button {
        color: white;
        background-color: #009d5c;
        border: none;
        font-family: orbitronregular;
        height: 50px;
    }

        .white-button {
                border-style: none;
                border-color: inherit;
                border-width: medium;
                color: black;
                background-color: white;
                font-family: orbitronregular;
    }

                    .black-button {
                border-style: none;
                border-color: inherit;
                border-width: medium;
                color: white;
                background-color: black;
                font-family: orbitronregular;
            }

            .auto-style1 {
                border-style: none;
                border-color: inherit;
                border-width: medium;
                color: white;
                background-color: #009d5c;
                font-family: orbitronregular;
            }
            .spacer-row {
    height: 35px;
}
                        .spacer-row-big {
    height: 140px;
}

    .table-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }


                .auto-style2 {
                    text-align: center;
                    height: 34px;
                }


                .auto-style4 {
                    width: 856px;
                    height: 34px;
                }
                .auto-style5 {
                    width: 856px;
                }


                .auto-style6 {
                    width: 1177px;
                }

                .text-center {
    text-align: center;
}

.modal-table {
    margin: 0 auto;
}

    .item-container {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .item-container strong {
        margin-right: 10px;
    }

    </style>

            <script type="text/javascript">
        function ScrollToBottom() {
            var windowHeight = window.innerHeight;
            var offset = 350; // Adjust this value to set the desired scroll offset
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
            <td class="text-center" style="height: 20px; font-family: orbitronregular; font-size: 50px; color: white;" colspan="6">VIEW PRODUCTS</td>
        </tr>
        <tr>
            <td class="text-center" style="height: 20px; font-family: Bahnschrift; font-size: large; color: white;" colspan="6"><strong>This task page enables for searching products sold by specific farmers in the database.</strong></td>
        </tr>
    </table>
</div>
    <table class="nav-justified">

        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td style="width: 1255px" class="modal-sm">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="modal-sm">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>


        <%-- Search Button--%>
        <tr>
    <td class="modal-sm" style="height: 46px; text-align: center;" colspan="7">
        <asp:Button ID="SearchButtonn" runat="server" Text="SEARCH" OnClick="SearchButtonn_Click" CssClass="auto-style1" style="margin-left: 10px;" Height="51px" Width="120px" />
       <asp:TextBox ID="txtSearchToolBar" runat="server" ForeColor="Black" Height="51px" Width="338px" 
    style="margin-left: 10px;" Font-Names="Bahnschrift" placeholder="   ENTER THE FARMER ID"></asp:TextBox>
        <asp:Button ID="btnFilterSearch" runat="server" Text="FILTER"  OnClick="btnFilterSearch_Click" CssClass="auto-style1"  style="margin-left: 10px;" Height="51px" Width="120px" />


    </td>


</tr>
<%--------------------------------------------------------------------- -------------------------------------------%>
<%-- Filter Background Object --%>
<tr id="myRow" runat="server">
    <td>
        <div>
            <div style="position: absolute; top: 400px; left: 31%; width: 39%; height: 24%; background-color: rgba(0, 0, 0, 0.6); z-index: -1; border-radius: 25px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);"></div>
        </div>
    </td>
</tr>
<%--  --%>


<tr>
    <td class="auto-style6" style="text-align: center;">
        &nbsp;
    </td>
    <td class="auto-style4" style="text-align: center;">
        &nbsp;
    </td>
    <td style="width: 144px; height: 34px;">
        &nbsp;
    </td>
    <td style="width: 102px; height: 34px;">
        &nbsp;
    </td>
    <td style="height: 34px">
        &nbsp;
    </td>
</tr>
<tr>
    <td class="auto-style6" style="text-align: center;">
        &nbsp;
    </td>
<td class="auto-style4" style="text-align: center;">
    <div class="item-container">
        <strong>
            <asp:Label ID="lblProductType" runat="server" Text="PRODUCT TYPE" Font-Names="Bahnschrift" Visible="False" style="font-size: medium; color:white;"></asp:Label>
        </strong>
        <asp:DropDownList ID="ddlProductType" runat="server" AutoPostBack="true" Font-Names="Bahnschrift" Visible="False" Width="307px" Height="26px" OnSelectedIndexChanged="ddlProductType_SelectedIndexChanged"></asp:DropDownList>
    </div>
</td>
    <td style="width: 144px; height: 34px; margin-right:45px;">
    </td>
    <td style="width: 102px; height: 34px;"></td>
    <td style="height: 34px"></td>
</tr>
<tr>
    <td class="auto-style2" colspan="3">&nbsp;</td>
</tr>

<tr>
    <td class="auto-style6" style="text-align: center;">
        &nbsp;
    </td>
    <td class="auto-style2" colspan="2">
        &nbsp;
    </td>
    <td style="width: 102px; height: 34px;">
        &nbsp;
    </td>
    <td style="height: 34px">
        &nbsp;
    </td>
</tr>
<tr>
    <td class="auto-style6" style="text-align: center;">
        &nbsp;
    </td>

<td class="auto-style4" style="text-align: center;">
    <div class="item-container">
    <asp:Button ID="cancelFilter" runat="server" Text="CANCEL" OnClick="cancelFilter_Click" CssClass="white-button" style="margin-left: 100px; font-size: 12.5px;" Height="51px" Width="120px" Visible="False" />
    <asp:Button ID="applyFilter" runat="server" Text="APPLY FILTER" OnClick="applyFilter_Click" CssClass="auto-style1" style="margin-left: 20px; margin-right: 0px; font-size: 12.5px;" Height="51px" Width="120px" Visible="False" />
    </div>
</td>
    <td style="width: 102px; height: 34px;"></td>
    <td style="height: 34px"></td>
</tr>



        <tr>
            <td class="modal-sm" style="height: 46px; text-align: center;" colspan="7"><strong>
                <asp:Label ID="Label1" runat="server" ForeColor="#009b59" Text="Default Message" Font-Names="Bahnschrift" Visible="False"></asp:Label>
                </strong></td>
        </tr>
        <%-- Grid View - Search Results --%>

        <tr>
    <td class="text-center" colspan="7">
        <table class="modal-table">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PROD_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical" Width="1069px" Visible="False" AllowSorting="True" Font-Bold="True" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="PROD_ID" HeaderText="PRODUCT ID" ReadOnly="True" SortExpression="PROD_ID" InsertVisible="False" />
                        <asp:BoundField DataField="PROD_CODE" HeaderText="PRODUCT CODE" SortExpression="PROD_CODE" />
                        <asp:BoundField DataField="FRM_ID" HeaderText="FARMER ID" SortExpression="FRM_ID" />
                        <asp:BoundField DataField="PTYPE_ID" HeaderText="PRODUCT TYPE ID" SortExpression="PTYPE_ID" />
                        <asp:BoundField DataField="PROD_NAME" HeaderText="PRODUCT NAME" SortExpression="PROD_NAME" />
                        <asp:BoundField DataField="PROD_PRICE" HeaderText="PRODUCT PRICE" SortExpression="PROD_PRICE" />
                        <asp:BoundField DataField="PROD_QTY" HeaderText="QUANTITY" SortExpression="PROD_QTY" />
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
        <%-- Grid View - Search Results --%>

        </table>
    <div class="text-center">
    </div>
    <br />
    <table class="nav-justified">
        <tr>
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
            <td style="height: 20px;" colspan="3">&nbsp;</td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px;" colspan="3">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT]"></asp:SqlDataSource>
            </td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <%-- 2nd Prompt Message to User --%>
        <tr>
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
            <td class="modal-sm" style="width: 250px; height: 20px; text-align: center;">&nbsp;</td>
            <td style="width: 118px; height: 20px;">&nbsp;</td>
            <td style="width: 383px; height: 20px;" class="modal-sm">&nbsp;</td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>



                                     <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
        <tr>
            <td class="modal-sm" style="width: 250px; height: 8px; text-align: center;">
            </td>
            <td style="width: 144px; height: 8px">
            </td>
            <td style="width: 118px; height: 8px"></td>
            <td style="width: 102px; height: 8px"></td>
            <td style="height: 8px"></td>
        </tr>
        <tr>
            <td style="height: 34px; width: 250px" class="text-center">
                &nbsp;</td>

            <td style="height: 34px; width: 118px"></td>
            <td style="height: 34px; width: 102px"></td>
            <td style="height: 34px"></td>
        </tr>
        <tr>
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
            <td class="modal-sm" style="width: 250px; height: 20px;">&nbsp;</td>
            <td style="width: 144px; height: 20px;" class="text-center">
                &nbsp;</td>
            <td style="width: 118px; height: 20px;">&nbsp;</td>
            <td style="width: 102px; height: 20px;">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 250px; height: 20px;"></td>
            <td style="width: 144px; height: 20px;" class="text-center">
                &nbsp;</td>
            <td style="width: 118px; height: 20px;"></td>
            <td style="width: 102px; height: 20px;"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 250px">&nbsp;</td>
            <td style="width: 144px">&nbsp;</td>
            <td style="width: 118px" class="modal-sm">&nbsp;</td>
            <td style="width: 102px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 250px">
                &nbsp;</td>
            <td style="width: 144px">&nbsp;</td>
            <td style="width: 118px" class="modal-sm">&nbsp;</td>
            <td style="width: 102px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
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
