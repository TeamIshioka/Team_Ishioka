﻿<%@ Page Title="Forgot password" Language="C#" MasterPageFile="~/Master_Main.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="VirtualCollege.Account.ForgotPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="Master_Main_Content">
    
    <h2><%: Title %></h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Forgot your password?</h4>
                    <hr />
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 105px">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email:</asp:Label>
                                </td>
                                <td style="width: 172px">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" Width="135px" />
                                </td>
                                <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="*The email field is required." ForeColor="Red" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div class="col-md-10">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="Forgot" Text="Submit" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
