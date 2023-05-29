<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Emmanuel_Kianda_ST10081944_PROG7311_POE_PART_2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">

                body {
            background-image: url("Images/login-img.JPG");
            background-repeat: no-repeat;
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
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
            font-size: 14px;
        }
        .auto-style3 {
            text-align: right;
            width: 606px;
        }
        .auto-style5 {
            text-align: center;
            font-size: xx-large;
        }
        .auto-style6 {
            text-align: center;
            height: 23px;
        }

        .backimg{
            height:110%;
            background-color:#f2f2f2
        }
        .auto-style7 {
            text-align: right;
            width: 606px;
            height: 23px;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style10 {
            height: 1049px;
            background-color:#f2f2f2
        }
        .auto-style12 {
            text-align: right;
            width: 150px;
        }
        .auto-style13 {
            text-align: right;
            width: 150px;
            height: 23px;
        }
        .auto-style14 {
            font-size: 45px;
        }
        .auto-style15 {
            text-align: center;
            height: 27px;
        }
        .auto-style18 {
            width: 1047px;
            height: 526px;
        }
        .auto-style19 {
            font-size: small;
        }
        .auto-style20 {
            text-align: center;
            height: 37px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="auto-style10" style="background-color: transparent; display: flex; justify-content: center; align-items: center; height: 100vh; flex-direction: column;">
         
             <%-- Table 1 --%>
 
             <table>
                     <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:Image ID="Image1" runat="server" Height="104px" ImageUrl="~/Images/fc-logo.PNG" Width="353px" />
                        &nbsp;&nbsp;</td>
                </tr>

 </table>
                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

              <div style="margin-left: 50px;"></div>
            <%-- Table 2 --%>
           <table class="auto-style1" style="background-color: rgba(0, 0, 0, 0.7); width: 600px; height: 570px;">

                <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                                              <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                                              <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style5" colspan="3">
                        <asp:Label ID="Label1" runat="server" Font-Names="orbitronregular" ForeColor="#ffffff" Text="Welcome Back" CssClass="auto-style14"></asp:Label>
                    </td>

                </tr>

                                <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:Label ID="slogan" runat="server" Font-Names="Bahnschrift" ForeColor="#ffffff" Text="Good seeing you again, please login into your account"></asp:Label>
                    </td>
                </tr>


               
                <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                               <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                               <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>


                <tr>
                    <td class="auto-style15" colspan="3">
                        <asp:Label ID="LabelEmail" runat="server" Text="Email : " Font-Names="Bahnschrift" ForeColor="#ffffff"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" Width="260px" Font-Names="Bahnschrift" Height="23px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style20" colspan="3">
                        <asp:Label ID="LabelInspectorNo" runat="server" Text="Password : " Font-Names="Bahnschrift" ForeColor="#ffffff"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="24px" Font-Names="Bahnschrift" Width="233px"></asp:TextBox>
                    </td>
                </tr>
               <%--  Space--%>
                                            <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style6" colspan="3">
                        <asp:Label ID="NotifyLablel" runat="server" Text="Message" Visible="False" ForeColor="Red" CssClass="auto-style19" Font-Names="Bahnschrift" Font-Size="14px"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:ImageButton ID="loginButton" runat="server" Height="135px" ImageUrl="~/Images/login-button.PNG" OnClick="loginButton_Click" Width="500px" />
                    </td>
                </tr>
            </table>

                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                                          <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>

                             <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                </tr>
                   
        </div>

    </form>
</body>
</html>
