<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="E_buyOnline.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <table border="1" style="width:500px;height:100px; text-align:center;margin-top:25px;margin-left:400px; ">
            <tr>
                <th>
                    <b>Products</b>                    
                </th>
                <th>
                    <b>Price</b>
                </th>
                <th>
                    <b>Quantity</b>
                </th>
                <th>
                    <b>Total</b>
                </th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            

        </table>
    </div>
    <div>
        <button onsubmit="Submit" style="float:unset;margin-top:25px;margin-left:800px;">CheckOut</button>
        <%--<asp:Button id="Button1" runat="Server" />--%>
    </div>


</asp:Content>
