<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PreviewProducts.aspx.cs" Inherits="E_buyOnline.PreviewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/slider.css" rel="stylesheet" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/move-top.js"></script>
    <script src="js/easing.js"></script>
    <script src="js/startstop-slider.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
                            <asp:HyperLink ID="HyperLink1" class="list-group-item" runat="server" Text='<%# Eval("category_name")%>' NavigateUrl='<%# Eval("category_id","~/PreviewProducts.aspx?view={0}") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:Repeater>
             </div>

      </div>

            <div class="col-lg-9">
                    <div class="row">
                        <asp:Repeater ID="Repeater2" runat="server" >
                            <ItemTemplate>
                                <div  style="float:left;width:22%;margin-left:25px;">
                                    <asp:Image ID="Image1" runat="server" style="width:250px;height:250px" ImageUrl='<%# Eval("product_image")%>' />
                                             <h4><b><p><span class="rupeees"><asp:Label ID="Label2" runat="server"  Text='<%# Eval("product_name")%>'></asp:Label></span></p></b> </h4>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">₹<asp:Label ID="Label1" runat="server"  Text='<%# Eval("price")%>'></asp:Label></span></p>
					    </div>
					       		<div class="add-cart">								
									<%--<h4><a href="preview.html">Add to Cart</a></h4>--%>
                                       <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("product_id","~/ProductDetails.aspx?view={0}") %>'>View Details</asp:HyperLink>
							     </div>
							 <div class="clear"></div>
					</div> 
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>   
            </div>

  </div>
</div>
    <asp:Repeater ID="rptPager" runat="server">
    <ItemTemplate>
        <ul class="pagination">
  <li>
     <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
            CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
            OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
 
           </li>
</ul>
        
   </ItemTemplate>
</asp:Repeater>

</asp:Content>
