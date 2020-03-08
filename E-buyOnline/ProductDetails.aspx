<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="E_buyOnline.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="jquery/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">

    <div class="row">

      <div class="col-lg-3">
        <h1 class="my-4"></h1>
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
          <div class="list-group">
         
            <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                                         <asp:HyperLink ID="HyperLink1" class="list-group-item" runat="server" Text='<%# Eval("CategoryName")%>' NavigateUrl='<%# Eval("CategoryCode","~/PreviewProducts.aspx?view={0}") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:Repeater>

        </div>
      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
          <asp:Image ID="Image1" class="card-img-top img-fluid" style="width:500px;height:500px;margin-top:25px;" runat="server" />
        <div class="card mt-4">
          <%--<img class="card-img-top img-fluid" src="http://placehold.it/900x400" alt="">--%>
          
            <div class="card-body">
            <h3 class="card-title">Product Name- 
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h3>
            <h4>Price- ₹ <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h4>
             <h4>Posting Date- <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h4>
                <h4>Category- <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></h4>
              <h5>Description- </h5>  
            <p class="card-text"> <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></p>
            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
            4.0 stars
                <div class="card-header">
            <asp:Button ID="Button2" class="btn btn-success" runat="server" Text="Buy Now" OnClick="Button2_Click" />
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                     <asp:Button ID="Button3" class="btn btn-success" runat="server" Text="Add to Cart" OnClick="Button3_Click" />
          </div>
          </div>
        </div>

          <%--<div class="card card-outline-secondary my-4">
          <div class="card-header">
            
          </div>--%>
         <%-- <div class="card-body">
            

            <%--<a href="#" class="btn btn-success">Leave a Review</a>--%>
          </div>
        </div>
        <!-- /.card -->
        <!-- /.card -->

      </div>
      <!-- /.col-lg-9 -->

    

  
  <!-- /.container -->

</asp:Content>
