<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CrudRegistration.Contact" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" style="width: 100vw; height: 100vh">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- DataTables CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <script type="text/javascript">        
        $(document).ready(function () {
            $('#<%=GV.ClientID%>').DataTable(); 
        });        function myFunction(){            alert("this is alertbox");
        }                  </script>
    <style>
        .Gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>

   

    <main aria-labelledby="title" style="width:1200px">
        <%-----sidebar------%>
        <button class="hamburgur btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample"><span class="glyphicon ">&#9776;</span></button>

        <div class="drawer">
            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasExampleLabel">Students</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body ">
                    <div>List of Student</div>
                    <div class="dropdown mt-3 text-center" runat="server" id="offcanvasBody">

                    </div>
                </div>
            </div>
        </div>

        <h1>LIST OF STUDENTS</h1>

        <%--        <asp:TextBox runat="server" ID="TextBox2" type="text" placeholder="Search..." class="txtSearch" onkeyup="search()"></asp:TextBox>--%>
        
        <asp:Button runat="server" ID="addBtn" Text="Click To Add" OnClick="addBtn_Click" Style="width: 100px; padding: 5px; background-color: #212529; float: right; color: white; margin-bottom: 4px;" />
        <asp:LinkButton runat="server" ID="JQR" OnClick="btnexport_Click" Style="width: 50px; padding: 5px; margin-right: 3px; float: right; color: white;"><i class="fa-solid fa-download fa-lg" style="color: #28772d;"></i></asp:LinkButton><br />

        <br />
        <%----GRIDVIEW----%>
        <asp:GridView ID="GV" runat="server" Width="1200px" CellPadding="3" AutoGenerateColumns="false" ShowFooter="true" OnRowCommand="GV_RowCommand" OnPageIndexChanging="GV_PageIndexChanging" CssClass="Gridview">
            <HeaderStyle BackColor="LightCyan"
                ForeColor="MediumBlue" />

            <Columns>
                <asp:TemplateField HeaderText="StudentID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("StudentID")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FirstName">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("FirstName")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MiddleName">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("MiddleName")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("LastName")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Address")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Age">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("Age")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("Contact")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Modify">
                    <ItemTemplate>
                        <asp:LinkButton ID="Edit" runat="server" Text="Update" CommandName="edit" OnClick="Edit_Click" CommandArgument='<%#Eval("StudentID") +","+Eval("FirstName")+","+Eval("Address")+","+Eval("Age")+","+Eval("Contact")+","+Eval("MiddleName")+","+Eval("LastName")%>' Style="padding: 5px;"><i class="fa-regular fa-pen-to-square fa-lg" style="color: #28772d;"></i></asp:LinkButton>
                        <asp:LinkButton ID="Delete" runat="server" Text="Delete" CommandName="dlt" CommandArgument='<%#Eval("StudentID")%>' Style="width: 100px; padding: 5px;"><i class="fa-solid fa-trash fa-lg" style="color: #e41607"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            <asp:TemplateField>
                <footertemplate>
                </footertemplate>
            </asp:TemplateField>
            </Columns>

        </asp:GridView>
        <br />
        

    </main>
    <script type="text/javascript">      <%--  $(document).ready(function () {            $('a').click(function () {
               
              

                var middleNames = [];
                console.log(data);

                $('#<%= GV.ClientID %> tr').each(function () {
                    var firstName = $(this).find('td:eq(1)').text().trim(); // Column index 0 for First Name
                    var middleName = $(this).find('td:eq(2)').text().trim(); // Column index 1 for Middle Name
                    console.log(firstName);
                    if (firstName.includes(data) && middleName !== "") {
                        // Add the middle name to the array if it matches the specified first name and is not empty
                        if (!middleNames.includes(middleName)) {
                            middleNames.push(middleName);
                        }
                    }
                    middleNames.forEach(function (middleName) {
                    //    console.log(middleName);
                    });
                });

            })
        })--%>        $(document).ready(function () {
            $('.firstName').click(function () {
                var firstName = $(this).attr('id');
                $('.' + firstName + '_middle').toggle();
            });

            $('.middleName').click(function () {
                var middleName = $(this).attr('id');
                $('.' + middleName + '_last').toggle();
            });
        });        function Edit_Clicki() {            alert("this is handled from js")
        }       <%--  function search() {             var input = document.getElementById('<%= TextBox2.ClientID %>').value;         var rows = document.getElementById('<%= GV.ClientID %>').getElementsByTagName('tr');         var rowsPerPage = <%= GV.PageSize %>;

         // Get the total number of pages
         var totalPages = <%= GV.PageCount %>;             var totalRowCount = rowsPerPage * totalPages;             for (var i = 1; i < totalRowCount; i++) {                 var found = false;                 var cells = rows[i].getElementsByTagName('td');                 for (var j = 0; j < cells.length; j++) {                     var cellText = cells[j].textContent || cells[j].innerText;                     if (cellText.toUpperCase().indexOf(input.toUpperCase()) > -1) {                         found = true;                         break;                     }                 }                 if (found) {                     rows[i].style.display = "";                 } else {                     rows[i].style.display = "none";                 }             }         }--%>       

        var footerTemplate = `
            <tfoot>
                <tr>
                    <td><asp:TextBox runat="server" id="F1" Placeholder="Search Terms" style="width:150px"></asp:TextBox></td>
                    <td><asp:TextBox runat="server" id="F2" Placeholder="Search Terms" style="width:150px"></asp:TextBox></td>
                    <td><asp:TextBox runat="server" id="F3" Placeholder="Search Terms" style="width:150px"></asp:TextBox></td>
                    <td><asp:TextBox runat="server" id="F4" Placeholder="Search Terms" style="width:150px"></asp:TextBox></td>
                    <td><asp:TextBox runat="server" id="F5" Placeholder="Search Terms" style="width:150px"></asp:TextBox></td>
                    <!-- Add more footer cells as needed -->
                </tr>
            </tfoot>
        `;
       

        $(document).ready(function () {
            //Adding Footer
            $('#<%=GV.ClientID%>').append(footerTemplate);
            // Search For id
            $('#<%=F1.ClientID%>').keyup(function () {
                var searchTerm = $(this).val().toLowerCase();
                // Iterate through each row in the GridView
                $('#<%=GV.ClientID%> tbody tr').each(function () {
                    var row = $(this);
                    var cellText = row.find('td:nth-child(1)').text().toLowerCase(); // Get text from the first column (change the nth-child(1) as per your requirement)

                    // Check if the cell text contains the search term
                    if (cellText.indexOf(searchTerm) > -1) {
                        row.show(); // Display the row if it matches the search term
                    } else {
                        row.hide(); // Hide the row if it doesn't match the search term
                    }
                });
            })


            //Search for Name
            $('#<%=F2.ClientID%>').keyup(function () {
                var searchTerm = $(this).val().toLowerCase();
                // Iterate through each row in the GridView
                $('#<%=GV.ClientID%> tbody tr').each(function () {
                    var row = $(this);
                    var cellText = row.find('td:nth-child(2)').text().toLowerCase(); // Get text from the first column (change the nth-child(1) as per your requirement)

                    // Check if the cell text contains the search term
                    if (cellText.indexOf(searchTerm) > -1) {
                        row.show(); // Display the row if it matches the search term
                    } else {
                        row.hide(); // Hide the row if it doesn't match the search term
                    }
                });
               
            })

            //fetch for address
            $('#<%=F3.ClientID%>').keyup(function () {
                var searchTerm = $(this).val().toLowerCase();
                // Iterate through each row in the GridView
                $('#<%=GV.ClientID%> tbody tr').each(function () {
                    var row = $(this);
                    var cellText = row.find('td:nth-child(3)').text().toLowerCase(); // Get text from the first column (change the nth-child(1) as per your requirement)

                    // Check if the cell text contains the search term
                    if (cellText.indexOf(searchTerm) > -1) {
                        row.show(); // Display the row if it matches the search term
                    } else {
                        row.hide(); // Hide the row if it doesn't match the search term
                    }
                });
            })

            //fetch for age
            $('#<%=F4.ClientID%>').keyup(function () {
                var searchTerm = $(this).val().toLowerCase();
                // Iterate through each row in the GridView
                $('#<%=GV.ClientID%> tbody tr').each(function () {
                    var row = $(this);
                    var cellText = row.find('td:nth-child(4)').text().toLowerCase(); // Get text from the first column (change the nth-child(1) as per your requirement)

                    // Check if the cell text contains the search term
                    if (cellText.indexOf(searchTerm) > -1) {
                        row.show(); // Display the row if it matches the search term
                    } else {
                        row.hide(); // Hide the row if it doesn't match the search term
                    }
                });
            })

            //fetch for contact
            $('#<%=F5.ClientID%>').keyup(function () {
                var searchTerm = $(this).val().toLowerCase();
                // Iterate through each row in the GridView
                $('#<%=GV.ClientID%> tbody tr').each(function () {
                    var row = $(this);
                    var cellText = row.find('td:nth-child(5)').text().toLowerCase(); // Get text from the first column (change the nth-child(1) as per your requirement)

                    // Check if the cell text contains the search term
                    if (cellText.indexOf(searchTerm) > -1) {
                        row.show(); // Display the row if it matches the search term
                    } else {
                        row.hide(); // Hide the row if it doesn't match the search term
                    }
                });
            })
        })



    </script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

</asp:Content>
