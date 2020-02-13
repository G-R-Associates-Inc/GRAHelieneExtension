/**
* Documentation Section
*   GRALE01 - 09/18/19 - Lina El Sadek, G.R. & Associates Inc.
            - Version Tag GRA1.02
*           - Created the XmlPort to export some of the required information into Salesperson Web Portal.
**/

xmlport 58000 ExportSalesHeaderInfo 
{
    UseDefaultNamespace=true;
    UseRequestPage=false;
    Direction=Export;
    Encoding=UTF16;
    XmlVersionNo=V10;
    DefaultFieldsValidation=true;
    InlineSchema=false;
    Format=Xml;

    schema
    {
        textelement(ExportSalesHeader)
        {
            tableelement(SalesHeader; "Sales Info Placeholder 2")
            {
                UseTemporary = true;
                AutoSave = false;                
                            
                fieldelement(No; SalesHeader."Document No."){}
                fieldelement(DocumentType; SalesHeader."Document Type"){}
                fieldelement(SellToCustomerNo; SalesHeader."Sell-to Customer No."){}
                fieldelement(SellToCustomerName; SalesHeader."Sell-to Customer Name"){}
                fieldelement(SalespersonCode; SalesHeader."Salesperson Code"){}
                fieldelement(SalespersonName; SalesHeader."Salesperson Name"){}
                fieldelement(ExternalDocumentNo; SalesHeader."External Document No."){}
                fieldelement(OrderDate; SalesHeader."Order Date"){}
                fieldelement(Status; SalesHeader.Status){}
                fieldelement(CompletelyShipped; SalesHeader."Completely Shipped"){}
                fieldelement(TotalAmountIncludingTax; SalesHeader."Total Amount Incl Tax"){}
                fieldelement(TotalQuantity; SalesHeader."Total Quantity"){}
                fieldelement(TotalOutstandingAmount; SalesHeader."Total Outstanding Amount"){}
                fieldelement(TotalWatts; SalesHeader."Total Watts"){}
                fieldelement(CompanyName; SalesHeader."Company Name"){}

                trigger OnPreXmlItem();
                    var 
                    SalesHeader_lRec:Record "Sales Header";
                    SalesPerson_lRec:Record "Salesperson/Purchaser";
                    SalesPersonCode_lCode:Code[30];                   
                begin
                    //GRALE01 - Add Start

                    //IF the user is not a web portal admin and they dont have an associated Salesperson Code
                    //Associates with them, then do not retreive any records for them
                    SalesPersonCode_lCode := GetSalespersonFromUsrname;
                    IF NOT WebPortalAdmin_gBool THEN
                        IF SalesPersonCode_lCode = '' THEN
                            EXIT;


                    //Add records to the temporary table
                    //SalesHeader.DeleteAll;

                    SalesHeader_lRec.RESET;
                    IF SalesHeader_lRec.CHANGECOMPANY('LIVE HELIENE CANADA') THEN
                    BEGIN
                        SalesHeader_lRec.SETFILTER("Document Type", '%1|%2', SalesHeader_lRec."Document Type"::Order, SalesHeader_lRec."Document Type"::Quote);
                        SalesHeader_lRec.SETFILTER("Salesperson Code", SalesPersonCode_lCode);
                        //Heliene requested not to show Heliene USA Inc. Sell-to Customer
                        SalesHeader_lRec.SETFILTER("Sell-to Customer Name", '<> %1', 'Heliene USA Inc.');
                        IF SalesHeader_lRec.FINDSET THEN
                        REPEAT
                            SalesHeader_lRec.CALCFIELDS("Total Quantity", "Amount Including VAT", "Outstanding Amount ($)");
                            //Because the tables are not the same, we have to assign the fields individually.
                            SalesHeader."Document No." := SalesHeader_lRec."No.";
                            SalesHeader."Document Type" := SalesHeader_lRec."Document Type";
                            SalesHeader."Sell-to Customer Name" := SalesHeader_lRec."Sell-to Customer Name";
                            SalesHeader."Sell-to Customer No." := SalesHeader_lRec."Sell-to Customer No.";
                            SalesHeader."Salesperson Code" := SalesHeader_lRec."Salesperson Code";
                            SalesHeader."External Document No." := SalesHeader_lRec."External Document No.";
                            SalesHeader."Order Date" := SalesHeader_lRec."Order Date";
                            SalesHeader.Status := SalesHeader_lRec.Status;
                            SalesHeader."Completely Shipped" := SalesHeader_lRec."Completely Shipped";
                            SalesHeader."Total Amount Incl Tax" := SalesHeader_lRec."Amount Including VAT";
                            SalesHeader."Total Quantity" := SalesHeader_lRec."Total Quantity";
                            SalesHeader."Total Outstanding Amount" := SalesHeader_lRec."Outstanding Amount ($)";
                            SalesHeader."Total Watts" := SalesHeader_lRec.TotalWattage;
                            SalesHeader."Company Name" := SalesHeader_lRec.CurrentCompany;

                            //Get the Salesperson Name
                            if SalesHeader_lRec."Salesperson Code" <> '' then
                            begin
                                SalesPerson_lRec.Reset;
                                SalesPerson_lRec.SetRange(Code, SalesHeader_lRec."Salesperson Code");
                                if SalesPerson_lRec.FindFirst then
                                    SalesHeader."Salesperson Name" := SalesPerson_lRec.Name
                                else
                                    SalesHeader."Salesperson Name" := '';
                            end else
                                SalesHeader."Salesperson Name" := '';

                            //SalesHeader.Insert;
                            IF NOT SalesHeader.Insert THEN ;
                        UNTIL SalesHeader_lRec.NEXT = 0;
                    END;

                    //Heliene requested to show the records of Heliene USA in the web portal in addition to Heliene Canada.
                    SalesHeader_lRec.RESET;
                    IF SalesHeader_lRec.CHANGECOMPANY('LIVE HELIENE USA INC') THEN
                    BEGIN
                        SalesHeader_lRec.SETFILTER("Document Type", '%1|%2', SalesHeader_lRec."Document Type"::Order, SalesHeader_lRec."Document Type"::Quote);
                        SalesHeader_lRec.SETFILTER("Salesperson Code", SalesPersonCode_lCode);
                        SalesHeader_lRec.SETFILTER("Sell-to Customer Name", '<> %1', 'Heliene USA Inc.');
                        IF SalesHeader_lRec.FINDSET THEN
                        REPEAT
                            SalesHeader_lRec.CALCFIELDS("Total Quantity", "Amount Including VAT", "Outstanding Amount ($)");
                            //Because the tables are not the same, we have to assign the fields individually.
                            SalesHeader."Document No." := SalesHeader_lRec."No.";
                            SalesHeader."Document Type" := SalesHeader_lRec."Document Type";
                            SalesHeader."Sell-to Customer Name" := SalesHeader_lRec."Sell-to Customer Name";
                            SalesHeader."Sell-to Customer No." := SalesHeader_lRec."Sell-to Customer No.";
                            SalesHeader."Salesperson Code" := SalesHeader_lRec."Salesperson Code";
                            SalesHeader."External Document No." := SalesHeader_lRec."External Document No.";
                            SalesHeader."Order Date" := SalesHeader_lRec."Order Date";
                            SalesHeader.Status := SalesHeader_lRec.Status;
                            SalesHeader."Completely Shipped" := SalesHeader_lRec."Completely Shipped";
                            SalesHeader."Total Amount Incl Tax" := SalesHeader_lRec."Amount Including VAT";
                            SalesHeader."Total Quantity" := SalesHeader_lRec."Total Quantity";
                            SalesHeader."Total Outstanding Amount" := SalesHeader_lRec."Outstanding Amount ($)";
                            SalesHeader."Total Watts" := SalesHeader_lRec.TotalWattage;
                            SalesHeader."Company Name" := SalesHeader_lRec.CurrentCompany;

                            //Get the Salesperson Name
                            if SalesHeader_lRec."Salesperson Code" <> '' then
                            begin
                                SalesPerson_lRec.Reset;
                                SalesPerson_lRec.SetRange(Code, SalesHeader_lRec."Salesperson Code");
                                if SalesPerson_lRec.FindFirst then
                                    SalesHeader."Salesperson Name" := SalesPerson_lRec.Name
                                else
                                    SalesHeader."Salesperson Name" := '';
                            end else
                                SalesHeader."Salesperson Name" := '';
                            
                            //SalesHeader.Insert;
                            IF NOT SalesHeader.Insert THEN ;
                        UNTIL SalesHeader_lRec.NEXT = 0;
                    END;

                    //GRALE01 - Add End
                end;
                
            }

        }

    }

    VAR      
        Salesperson_gRec:Record "Salesperson/Purchaser";
        Users_gRec:Record User;
        UserSetup_gRec:Record "User Setup";
        UserName_gTxt:Text;
        SellToCustomerName_gInt:Integer;
        WebPortalAdmin_gBool:Boolean;
    
    procedure SetUserName(Username_lParam:Text);
    begin
        //GRALE01 - Add Start
        UserName_gTxt := Username_lParam;
        //GRALE01 - Add End
    end;

    local procedure GetSalespersonFromUsrname() : Code[30];
    begin
        //GRALE01 - Add Start
        IF UserName_gTxt <> '' THEN
        BEGIN
            //Get the user associates with the username entered in the webportal
            //We set it to be not case sensitive because we shouldnt limit the user to specific way of entering their credentials.  
            Users_gRec.RESET;
            Users_gRec.SETFILTER("User Name", '%1', '@*' + UserName_gTxt + '*');
            IF Users_gRec.FINDFIRST THEN
            BEGIN  
            UserSetup_gRec.RESET;
            UserSetup_gRec.SETRANGE("User ID", Users_gRec."User Name");
                IF UserSetup_gRec.FINDFIRST THEN
                BEGIN
                    //If the user is a web portal admin, then we dont limit the records to the Salesperson Code  
                    WebPortalAdmin_gBool := UserSetup_gRec."Web Portal Admin";
                    IF WebPortalAdmin_gBool THEN
                        EXIT(FORMAT(''))
                    ELSE
                        //If the user is not a web portal admin, then they should only see their relevant records. 
                        EXIT(UserSetup_gRec."Salespers./Purch. Code");
                END;
            END;

        END;
        EXIT(FORMAT(''));
        //GRALE01 - Add End 
    end;

}