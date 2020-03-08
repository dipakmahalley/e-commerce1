<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ad-home.aspx.cs" Inherits="E_buyOnline.Admin.ad_home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="main-panel" style="width:auto; height:auto;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="content-wrapper" style="width:auto;height:auto;">
            <div class="row" style="width:auto;height:auto;">
                 <div class="row purchace-popup">
              <div class="col-12 stretch-card grid-margin">
                <div class="card card-secondary">
                  <span class="card-body d-lg-flex align-items-center">
                   <%-- <p class="mb-lg-0">  </p>--%>
                           <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>           
                  </span>
                </div>
              </div>
            </div>

              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Products Graph</h4>
                    <div class="aligner-wrapper">
                      <%--<canvas id="sessionsDoughnutChart" height="210"></canvas>--%>
                        <ajaxToolkit:PieChart ID="PieChart1" runat="server" ChartHeight="300" ChartType="Column" ChartTitleColor="#0E426C" ChartWidth="300" ChartTitle="Products" Visible = "false"></ajaxToolkit:PieChart>
                    </div>
                    <div class="wrapper mt-4 d-flex flex-wrap align-items-cente">
                      
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body performane-indicator-card">
                    <div class="d-sm-flex">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>

                      <%--<h4 class="card-title flex-shrink-1">Graphical Representation of Products Category-wise</h4>--%>
                        
                        <br />
                        <br />
                        <ajaxToolkit:BarChart ID="BarChart1" runat="server" ChartHeight="300px" ChartWidth="450px" Visible="false"></ajaxToolkit:BarChart>                          

                    </div>
                    <div class="d-sm-flex flex-wrap">
                      
                      
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    
  
    
</asp:Content>
