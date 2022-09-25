<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/AdminMaster.Master"  CodeBehind ="PurchaseHistory.aspx.cs" Inherits="WebApp.PurchaseHistory" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h1>Purchase History</h1>
            <hr />
            <div class="panel panel-default">
                <!-- default panel content -->
                <div class="panel-heading">All Purchases</div>


           <asp:Repeater ID="rptrCategory" runat="server">
                    <HeaderTemplate>
                         <table class="table">
                         <thead>
                        <tr>
                            <th>PurchaseID</th>
                            <th>UserID</th>
                            <th>SizeID</th>
                            <th>Total Sum</th>
                            <th>Discount</th>
                            <th>Total Payed</th>
                            <th>Payment Type</th>
                            <th>Payment Status</th>
                            <th>Data of Purchase</th>
                            <th>Name</th>
                            <th>Adrress</th>
                            <th>Pin Code</th>
                            <th>Mobile Number</th>
                          
                        </tr>
                    </thead>
                    <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <th><%# Eval("PurchaseID") %></th>
                            <td><%# Eval("UserID") %></td>
                            <td><%# Eval("PIDSizeID") %></td>
                            <td><%# Eval("CartAmount") %></td>
                            <td><%# Eval("CartDiscount") %></td>
                            <td><%# Eval("TotalPayed") %></td>
                            <td><%# Eval("PaymentType") %></td>
                            <td><%# Eval("PaymentStatus") %></td>
                            <td><%# Eval("DateOfPurchase") %></td>
                            <td><%# Eval("Name") %></td>
                            <td><%# Eval("Address") %></td>
                            <td><%# Eval("PinCode") %></td>
                            <td><%# Eval("MobileNumber") %></td>                      
                            <td>Edit</td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                         </tbody>
                </table>
                    </FooterTemplate>
                </asp:Repeater>     
            </div>
        </div>
    </asp:Content>
