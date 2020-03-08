<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="E_buyOnline.Users.Profile.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../css/material-design-iconic-font.min.css" rel="stylesheet" />
    <link href="../../css/animate.css" rel="stylesheet" />
    <link href="../../css/hamburgers.min.css" rel="stylesheet" />
    <link href="../../css/animsition.min.css" rel="stylesheet" />
    <link href="../../css/select2.min.css" rel="stylesheet" />
    <link href="../../css/daterangepicker.css" rel="stylesheet" />
    <link href="../../css/util.css" rel="stylesheet" />
    <link href="../../css/main.css" rel="stylesheet" />
    <script src="../../jquery/jquery-3.2.1.min.js"></script>
    <script src="../../js/animsition.min.js"></script>
    <script src="../../js/popper.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/select2.min.js"></script>
    <script src="../../js/daterangepicker.js"></script>
    <script src="../../js/moment.min.js"></script>
    <script src="../../js/countdowntime.js"></script>
    <script src="../../js/main.js"></script>--%>
    <link href="../../css/StyleSheet.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
    <div>
        <%--<asp:Login runat="server" style="width: 100%;" DestinationPageUrl="~/home.aspx"  >
            <LayoutTemplate>                                             
                     <div class="box">
            <div class="content">
                <h1>
                   User Login</h1>
                <asp:textbox class="field" placeholder="UserName" id="UserName" runat="server"></asp:textbox>
                <asp:requiredfieldvalidator id="UserNameRequired" runat="server" controltovalidate="UserName" errormessage="User Name is required." tooltip="User Name is required." validationgroup="Login1">*</asp:requiredfieldvalidator>
                <br>
                <asp:textbox class="field" placeholder="Password" id="Password" runat="server" textmode="Password"></asp:textbox>
                <asp:requiredfieldvalidator id="PasswordRequired" runat="server" controltovalidate="Password" errormessage="Password is required." tooltip="Password is required." validationgroup="Login1">*</asp:requiredfieldvalidator>
                <br>
                <asp:button class="btn" id="LoginButton" runat="server" commandname="Login" text="Log In" validationgroup="Login1"></asp:button>
                <br>
                <asp:literal id="FailureText" runat="server" enableviewstate="False"></asp:literal>--%>
                <asp:Login ID="Login1" runat="server" style="width: 100%;" DestinationPageUrl="~/home.aspx" DisplayRememberMe="False">
                    <LayoutTemplate>                       
                        <div class="box">
                                <div class="content">      
                                        <h1>
                                            User Login</h1>         
                                        <asp:TextBox ID="UserName" class="field" placeholder="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl01$Login1">*</asp:RequiredFieldValidator>
                                        <br>                                                                         
                                        <asp:TextBox ID="Password" class="field" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl01$Login1">*</asp:RequiredFieldValidator>
                                        <br>                
                                        <asp:Button ID="LoginButton" class="btn" runat="server" CommandName="Login" Text="Log In" ValidationGroup="ctl01$Login1" />                
                                        <br> 
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>                                            
                                         
                                    <asp:HyperLink runat="server" NavigateUrl="~/Users/Profile/Registration.aspx">Create Account</asp:HyperLink>
                                                                  
                              </div>
                        </div>  
                    </LayoutTemplate>
                </asp:Login>
                         

           </div>           
                     
   

    </asp:Content>
