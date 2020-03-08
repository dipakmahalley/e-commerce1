<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="E_buyOnline.ListByCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="jquery/jquery.slim.min.js"></script>

<style type="text/css">
    .auto-style3 {
        width: 101%;
        height: 50%;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form id="form1" runat="server">
  <div class="row">
       
      <%--Content--%>
        <div class="col-lg-9">     
         <div class="row">
         <div style="width:500px; height:700px;margin:0 auto;">
                    <h1 style=""> Post a New AD</h1>
       <table class="auto-style3">
            <tr>
                <td>Select Category</td>
                <td><asp:DropDownList ID="DropDownList1" runat="server" Height="32px" Width="130px" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryCode"></asp:DropDownList></td>                              
            </tr>
            <tr>
                <td>Product Name</td>
                <td>
               <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </td>                 
            </tr>         
            <tr>
                <td>Date</td>
                <td>
               <asp:TextBox ID="TextBox2" runat="server" ReadOnly="true" TextMode="DateTime"></asp:TextBox> </td>                
            </tr>
            <tr>
                <td>Product Price</td>
                <td>
               <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> </td>                 
            </tr>
            <tr>
                <td>Product Description</td>
                <td>
               <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>                
            </tr>
            <tr>
                <td>Product Image</td>
                <td>             
                     <asp:FileUpload ID="FileUpload1" runat="server" />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EbuyOnline_dbConnectionString %>" SelectCommand="SELECT [CategoryName], [CategoryCode] FROM [Category]"></asp:SqlDataSource>               
                </td>     
            </tr>
                         <tr>
                             
                             <td> <asp:Button ID="Button1" runat="server" Text="Post"  Width="135px" OnClick="Button1_Click" Font-Bold="True" Font-Size="Larger" Height="38px" />                               
                             </td>
                             <td>
                                 <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red"></asp:Label>
                                 <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" >View this ad</asp:LinkButton>
                             </td>
                         </tr>
        </table>
         </div>       
        </div>
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->            
   </div>
</form>
</div>

</asp:Content>
