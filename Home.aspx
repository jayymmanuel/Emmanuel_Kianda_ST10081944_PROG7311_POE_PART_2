<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Emmanuel_Kianda_ST10081944_PROG7311_POE_PART_2.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <style type="text/css">

                body {

                    background-image:url("Images/home-background.JPG");
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
        color: black;
        background-color: white;
        border: none;
        font-family: orbitronregular;
        height: 40px;
    }

            .auto-style1 {
                border-style: none;
                border-color: inherit;
                border-width: medium;
                color: white;
                background-color: #009d5c;
                font-family: orbitronregular;
            }

                .auto-style2 {
        width: 250px;
        height: 20px;
    }
            .spacer-row {
    height: 35px;
}

                        .big-spacer-row {
    height: 400px;
}

    .table-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .center-content {
        margin: 0 auto;
    }

    </style>
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
            <td class="text-center" style="height: 20px; font-family: orbitronregular; font-size: 40px; color: white;" colspan="6">Welcome to Farm Central</td>
        </tr>
        <%-- Creating space between the labels --%>
                                                     <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
        <tr>
            <td class="text-center" style="height: 20px; font-family: Bahnschrift; font-size: large; color: white;" colspan="6"> your comprehensive solution for efficient inventory management of farm products, Our platform is designed to streamline your argicultural operations, ensuring smooth tracking, procurement, and order processing.</td>
        </tr>
    </table>
</div>

    <br />

    <p>
    </p>
    <table class="nav-justified center-content">

                    <tr>
        <td colspan="7" class="text-center">
            <div class="text-center">
                <img src="Images/home-obj.PNG" height="600" alt="Image description">
            </div>
        </td>
    </tr>

                                                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                                                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

<tr>
    <td colspan="7" class="text-center">
        <div class="text-center" style="display: flex; justify-content: center;">
            <img src="Images/home-info.PNG" height="600" alt="Image description">
        </div>
    </td>
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
