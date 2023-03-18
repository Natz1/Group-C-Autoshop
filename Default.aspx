<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Group_C_Autoshop._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <h1>Welcome to D&R's Autoshop</h1>
    

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <img src="/Images/driving.jpg" width="300" height="250" />
            <p>
                At D&R Autoshop, all it takes is just a few steps to complete your purchase and you can be on the road,
                on your way.
            </p>
        </div>
        <div class="col-md-4">
            <h2>Browse our varied cars</h2>
            <img src="/Images/cars.jpg" width="300" height="250" />
            <p>
                Here at D&R, we have a wide array of car selection from you to choose from. 
                Click here to start browsing them today:
            </p>
            <br />
            <p>
                <a class="btn btn-default" href="/UserRoles/EndUser/VehicleList">Click Here! &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Request special additions</h2>
            <img src="/Images/fix.jpg" width="300" height="250" />
            <p>
                When completing a purchase, you can also request one of our special additions such as tracking devices,
                car alarms, and radio installations. Click here to start browsing them today:
            </p>
            <p>
                <a class="btn btn-default" href="/UserRoles/EndUser/Additions">Click Here! &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
