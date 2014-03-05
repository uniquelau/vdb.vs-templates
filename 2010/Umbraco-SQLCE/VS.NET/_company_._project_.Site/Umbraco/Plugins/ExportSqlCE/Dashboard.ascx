<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.ascx.cs" Inherits="Our.Umbraco.Dashboard.ExportSqlCE.Web.Dashboard" %>

<div class="dashboardWrapper">
	<h2>Export SQL Server Compact</h2>
	<img src="plugins/ExportSqlCE/data_out.png" alt="data_out" class="dashboardIcon" />

	<asp:PlaceHolder runat="server" ID="phError" Visible="false">
		<p>Unable to locate the Sql Server Compact database file for your Umbraco install.</p>
	</asp:PlaceHolder>

	<asp:PlaceHolder runat="server" ID="phForm" Visible="false">
		<p>
			<span>Sql Server Compact database file located at: </span>
			<strong>
				"<asp:Literal runat="server" ID="ltrlFileName" Text="[FileName]" />"
			</strong>
		</p>
		<p>
			<span>Select from the options, then press the <strong>"Export Script"</strong> button to generate and download.</span>
		</p>
		<p>
			<div>
				<asp:RadioButtonList runat="server" ID="rblScope">
					<asp:ListItem Text="Generate schema only" Value="schema" />
					<asp:ListItem Text="Generate schema and data" Value="data" Selected="True" />
				</asp:RadioButtonList>
			</div>
			<div>
				<asp:CheckBox runat="server" ID="cbZip" Text="Zip compress export script" Checked="true" />
			</div>
		</p>
		<p>
			<asp:Button runat="server" ID="btnExport" OnClick="btnExport_Click" Text="Export Script" />
		</p>
	</asp:PlaceHolder>

</div>
