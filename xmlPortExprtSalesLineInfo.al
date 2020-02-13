/**
* Documentation Section
*   GRALE01 - 09/18/19 - Lina El Sadek, G.R. & Associates Inc.
            - Version Tag GRA1.02
*           - Created the XmlPort to export some of the required information into Salesperson Web Portal.
**/

xmlport 58002 ExportSalesLineInfo 
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
        textelement(ExportSalesLine)
        {
            tableelement(SalesLine; "Sales Info Placeholder 2")
            {
                UseTemporary = true;
                AutoSave = false;   
                            
                fieldelement(DocumentNo; SalesLine."Document No."){}
                fieldelement(DocumentType; SalesLine."Document Type"){}
                fieldelement(CompanyName; SalesLine."Company Name"){}
                fieldelement(LineNo; SalesLine."Line No."){}
                fieldelement(Type; SalesLine.Type){}
                fieldelement(No; SalesLine."No."){}
                fieldelement(Description; SalesLine.Description){}
                fieldelement(Quantity; SalesLine.Quantity){}
                fieldelement(TotalWatts; SalesLine."Total Watts"){}
                fieldelement(Watts; SalesLine.Watts){}
                fieldelement(CostPerWatt; SalesLine."Cost Per Watt"){}
                fieldelement(PricePerWatt; SalesLine."Price Per Watt"){}
                fieldelement(OutstandingAmount; SalesLine."Outstanding Amount"){}
                fieldelement(QtyShipped; SalesLine."Quantity Shipped"){}
                fieldelement(QtyToShip; SalesLine."Qty. to Ship"){}
                fieldelement(AmountInclTax; SalesLine."Amount Incl Tax"){}
                fieldelement(RequestedDeliveryDate; SalesLine."Requested Delivery Date"){}
                fieldelement(PromisedDeliveryDate; SalesLine."Promised Delivery Date"){}
                               
                trigger OnPreXmlItem();
                    var 
                    SalesHeader_lRec:Record "Sales Header";
                    SalesLine_lRec:Record "Sales Line";
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
                    SalesLine.DeleteAll;

                    SalesHeader_lRec.RESET;
                    IF (SalesHeader_lRec.CHANGECOMPANY('LIVE HELIENE CANADA')) and 
                       (SalesLine_lRec.CHANGECOMPANY('LIVE HELIENE CANADA')) THEN
                    BEGIN
                        SalesHeader_lRec.SETFILTER("Document Type", '%1|%2', SalesHeader_lRec."Document Type"::Order, SalesHeader_lRec."Document Type"::Quote);
                        SalesHeader_lRec.SETFILTER("Salesperson Code", SalesPersonCode_lCode);
                        //Heliene requested not to show Heliene USA Inc. Sell-to Customer
                        SalesHeader_lRec.SETFILTER("Sell-to Customer Name", '<> %1', 'Heliene USA Inc.');
                        IF SalesHeader_lRec.FINDSET THEN
                        REPEAT
                            //For each Sales Header, get all Sales Lines
                            SalesLine_lRec.RESET;
                            SalesLine_lRec.SetRange("Document Type", SalesHeader_lRec."Document Type");
                            SalesLine_lRec.SetRange("Document No.", SalesHeader_lRec."No.");
                            if SalesLine_lRec.FindSet then
                            repeat
                                SalesLine.INIT;
                                SalesLine."Document No." := SalesLine_lRec."Document No.";
                                SalesLine."Document Type" := SalesLine_lRec."Document Type";
                                SalesLine."Company Name" := SalesLine_lRec.CurrentCompany;
                                SalesLine."Line No." := SalesLine_lRec."Line No.";
                                SalesLine.Type := SalesLine_lRec.Type;
                                SalesLine."No." := SalesLine_lRec."No.";
                                SalesLine.Description := SalesLine_lRec.Description;
                                SalesLine.Quantity := SalesLine_lRec.Quantity;
                                SalesLine."Total Watts" := SalesLine_lRec."SBR Total Watts";
                                SalesLine.Watts := SalesLine_lRec.Watts;
                                SalesLine."Cost Per Watt" := SalesLine_lRec.CostPerWatt;
                                SalesLine."Price Per Watt" := SalesLine_lRec.PricePerWatt;
                                SalesLine."Amount Incl Tax" := SalesLine_lRec."Amount Including VAT";
                                SalesLine."Outstanding Amount" := SalesLine_lRec."Outstanding Amount";
                                SalesLine."Quantity Shipped" := SalesLine_lRec."Qty. Shipped (Base)";
                                SalesLine."Qty. to Ship" := SalesLine_lRec."Qty. to Ship (Base)";
                                SalesLine."Requested Delivery Date" := SalesLine_lRec."Requested Delivery Date";
                                SalesLine."Promised Delivery Date" := SalesLine_lRec."Promised Delivery Date";
                                //SalesLine.Insert;
                                IF NOT SalesLine.Insert THEN ;
                            until SalesLine_lRec.Next = 0;                   
                        UNTIL SalesHeader_lRec.NEXT = 0;
                    END;

                    //Heliene requested to show the records of Heliene USA in the web portal in addition to Heliene Canada.
                    SalesHeader_lRec.RESET;
                    IF (SalesHeader_lRec.CHANGECOMPANY('LIVE HELIENE USA INC')) and 
                       (SalesLine_lRec.CHANGECOMPANY('LIVE HELIENE USA INC')) THEN
                    BEGIN
                        SalesHeader_lRec.SETFILTER("Document Type", '%1|%2', SalesHeader_lRec."Document Type"::Order, SalesHeader_lRec."Document Type"::Quote);
                        SalesHeader_lRec.SETFILTER("Salesperson Code", SalesPersonCode_lCode);
                        SalesHeader_lRec.SETFILTER("Sell-to Customer Name", '<> %1', 'Heliene USA Inc.');
                        IF SalesHeader_lRec.FINDSET THEN
                        REPEAT
                            //For each Sales Header, get all Sales Lines
                            SalesLine_lRec.RESET;
                            SalesLine_lRec.SetRange("Document Type", SalesHeader_lRec."Document Type");
                            SalesLine_lRec.SetRange("Document No.", SalesHeader_lRec."No.");
                            if SalesLine_lRec.FindSet then
                            repeat
                                SalesLine.INIT;
                                SalesLine."Document No." := SalesLine_lRec."Document No.";
                                SalesLine."Document Type" := SalesLine_lRec."Document Type";
                                SalesLine."Company Name" := SalesLine_lRec.CurrentCompany;
                                SalesLine."Line No." := SalesLine_lRec."Line No.";
                                SalesLine.Type := SalesLine_lRec.Type;
                                SalesLine."No." := SalesLine_lRec."No.";
                                SalesLine.Description := SalesLine_lRec.Description;
                                SalesLine.Quantity := SalesLine_lRec.Quantity;
                                SalesLine."Total Watts" := SalesLine_lRec."SBR Total Watts";
                                SalesLine.Watts := SalesLine_lRec.Watts;
                                SalesLine."Cost Per Watt" := SalesLine_lRec.CostPerWatt;
                                SalesLine."Price Per Watt" := SalesLine_lRec.PricePerWatt;
                                SalesLine."Amount Incl Tax" := SalesLine_lRec."Amount Including VAT";
                                SalesLine."Outstanding Amount" := SalesLine_lRec."Outstanding Amount";
                                SalesLine."Quantity Shipped" := SalesLine_lRec."Qty. Shipped (Base)";
                                SalesLine."Qty. to Ship" := SalesLine_lRec."Qty. to Ship (Base)";
                                SalesLine."Requested Delivery Date" := SalesLine_lRec."Requested Delivery Date";
                                SalesLine."Promised Delivery Date" := SalesLine_lRec."Promised Delivery Date";
                                //SalesLine.Insert;
                                IF NOT SalesLine.Insert THEN ;
                            until SalesLine_lRec.Next = 0;                   
                        until SalesHeader_lRec.NEXT = 0;
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