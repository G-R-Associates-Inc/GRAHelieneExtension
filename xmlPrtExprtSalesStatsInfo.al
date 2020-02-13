/**
* Documentation Section
*   GRALE01 - 09/19/19 - Lina El Sadek, G.R. & Associates Inc.
            - Version Tag GRA1.02
*          - Created the XmlPort to export Admin Mode insformation into Salesperson Web Portal.
**/
xmlport 58001 ExportSalesStatsInfo 
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
        textelement(ExportSalesInfo)
        {
            tableelement(SalesHeaderStats; "Sales Info Placeholder 2")
            {
                UseTemporary = true;
                AutoSave = false;   
                            
                fieldelement(DocumentNo; SalesHeaderStats."Document No."){}
                fieldelement(DocumentType; SalesHeaderStats."Document Type"){}
                fieldelement(SalespersonCode; SalesHeaderStats."Salesperson Code"){}
                fieldelement(SalespersonName; SalesHeaderStats."Salesperson Name"){}
                fieldelement(TotalWatts; SalesHeaderStats."Total Watts"){}
                fieldelement(TotalOutstandingAmount; SalesHeaderStats."Total Outstanding Amount"){}
                fieldelement(TotalAmountIncludingTax; SalesHeaderStats."Total Amount Incl Tax"){}
                fieldelement(TotalQuantity; SalesHeaderStats."Total Quantity"){}
                
                trigger OnPreXmlItem();
                    var 
                    SalesHeader_lRec:Record "Sales Header";
                    SalesPerson_lRec:Record "Salesperson/Purchaser";
                    SalesPersonCode_lCode:Code[30];
                    NumOfSalesRecs_lInt:Integer;
                    RecordNum_lInt:Integer;
                    TotalAmountInclTaxPerPerson_lDec:Decimal;
                    TotalWatts_lDec:Decimal;
                    TotalOutstandingAmount_lDec:Decimal;
                    DocumentType_lOptn:Option Quote,Order,Invoice,"Credit Memo","Blanket Order","Return Order";
                    TotalNumOfRecs_lInt:Integer;
                    CurrRec_lInt:Integer;                   
                begin
                    //GRALE01 - Add Start

                    SalesPersonCode_lCode := '';
                    RecordNum_lInt := 1;
                    TotalNumOfRecs_lInt := 0;
                    CurrRec_lInt := -1;
                    SalesHeaderStats.DeleteAll;
                    
                    
                    //Add records to the temporary table
                    SalesHeader_lRec.Reset;
                    SalesHeader_lRec.SetCurrentKey("Salesperson Code", "Document Type");
                    SalesHeader_lRec.SetFilter("Document Type", '%1|%2', SalesHeader_lRec."Document Type"::Order, SalesHeader_lRec."Document Type"::Quote);
                    //Heliene requested not to show Heliene USA Inc. Sell-to Customer
                    SalesHeader_lRec.SetFilter("Sell-to Customer Name", '<> %1', 'Heliene USA Inc.');
                    if SalesHeader_lRec.FindSet then
                    begin
                        TotalNumOfRecs_lInt := SalesHeader_lRec.Count; //Get the total number of records we will look through
                        CurrRec_lInt := 0; //Initialize the record to the first one
                        SalesPersonCode_lCode := SalesHeader_lRec."Salesperson Code";
                        DocumentType_lOptn := SalesHeader_lRec."Document Type";
                        repeat
                            CurrRec_lInt += 1; //Always count the record
                            if (SalesPersonCode_lCode <> SalesHeader_lRec."Salesperson Code") OR
                                    (DocumentType_lOptn <> SalesHeader_lRec."Document Type") OR
                                    (CurrRec_lInt = TotalNumOfRecs_lInt) then //Count the special case were this is the last or only record in the system
                                //This means we're starting a new set of records
                            begin
                                SalesHeaderStats."Document No." := Format(RecordNum_lInt);
                                SalesHeaderStats."Document Type" := DocumentType_lOptn;
                                SalesHeaderStats."Line No." := RecordNum_lInt;
                                SalesHeaderStats."Salesperson Code" := SalesPersonCode_lCode;
                                SalesHeaderStats."Total Watts" := TotalWatts_lDec;
                                SalesHeaderStats."Total Outstanding Amount" := TotalOutstandingAmount_lDec;
                                SalesHeaderStats."Total Amount Incl Tax" := TotalAmountInclTaxPerPerson_lDec;
                                SalesHeaderStats."Total Quantity" := NumOfSalesRecs_lInt;

                                //Get the Salesperson Name
                                if SalesPersonCode_lCode <> '' then
                                begin
                                    SalesPerson_lRec.Reset;
                                    SalesPerson_lRec.SetRange(Code, SalesPersonCode_lCode);
                                    if SalesPerson_lRec.FindFirst then
                                        SalesHeaderStats."Salesperson Name" := SalesPerson_lRec.Name
                                    else
                                        SalesHeaderStats."Salesperson Name" := '';
                                end else
                                    SalesHeaderStats."Salesperson Name" := '';

                                if not SalesHeaderStats.Insert then;
                                RecordNum_lInt += 1;
                                NumOfSalesRecs_lInt := 1;
                                SalesHeader_lRec.CalcFields("Amount Including VAT", "Outstanding Amount ($)");
                                TotalWatts_lDec := SalesHeader_lRec.TotalWattage;
                                TotalOutstandingAmount_lDec := SalesHeader_lRec."Outstanding Amount ($)";
                                TotalAmountInclTaxPerPerson_lDec := SalesHeader_lRec."Amount Including VAT";
                                SalesPersonCode_lCode := SalesHeader_lRec."Salesperson Code";
                                DocumentType_lOptn := SalesHeader_lRec."Document Type";
                            end else
                            begin
                                NumOfSalesRecs_lInt += 1;
                                SalesHeader_lRec.CalcFields("Amount Including VAT", "Outstanding Amount ($)");
                                TotalWatts_lDec += SalesHeader_lRec.TotalWattage;
                                TotalOutstandingAmount_lDec += SalesHeader_lRec."Outstanding Amount ($)";
                                TotalAmountInclTaxPerPerson_lDec += SalesHeader_lRec."Amount Including VAT";
                            end; 
                        UNTIL SalesHeader_lRec.Next = 0;
                    end;
                    
                    //Reset some of the variables
                    //Dont reset the rest of the values otherwise, it will cause an error
                    NumOfSalesRecs_lInt := 0;
                    SalesPersonCode_lCode := '';

                    //Heliene requested to show the records of Heliene USA in the web portal in addition to Heliene Canada.
                    SalesHeader_lRec.Reset;
                    if SalesHeader_lRec.ChangeCompany('LIVE HELIENE USA INC') then
                    begin                                              
                        SalesHeader_lRec.SETCURRENTKEY("Salesperson Code", "Document Type");
                        SalesHeader_lRec.SetFilter("Document Type", '%1|%2', SalesHeader_lRec."Document Type"::Order, SalesHeader_lRec."Document Type"::Quote);
                        SalesHeader_lRec.SetFilter("Sell-to Customer Name", '<> %1', 'Heliene USA Inc.');
                        if SalesHeader_lRec.FindSet then
                        begin
                            TotalNumOfRecs_lInt := SalesHeader_lRec.Count; //Get the total number of records we will look through
                            CurrRec_lInt := 0; //Initialize the record to the first one
                            SalesPersonCode_lCode := SalesHeader_lRec."Salesperson Code";
                            DocumentType_lOptn := SalesHeader_lRec."Document Type";                            
                            repeat
                                CurrRec_lInt += 1; //Always count the record
                                if (SalesPersonCode_lCode <> SalesHeader_lRec."Salesperson Code") OR
                                    (DocumentType_lOptn <> SalesHeader_lRec."Document Type") OR
                                    (CurrRec_lInt = TotalNumOfRecs_lInt) then //Count the special case were this is the last or only record in the system
                                //This means we're starting a new set of records
                                begin
                                    //First, check if there is a salesperson code already in the temp table
                                    SalesHeaderStats.Reset;
                                    SalesHeaderStats.SetFilter("Salesperson Code", '%1', SalesPersonCode_lCode);
                                    SalesHeaderStats.SetFilter("Document Type", '%1', DocumentType_lOptn);
                                    if SalesHeaderStats.FindFirst then
                                    begin
                                        //Update the values of the existing records                                
                                        SalesHeaderStats."Total Amount Incl Tax" += TotalAmountInclTaxPerPerson_lDec;
                                        SalesHeaderStats."Total Quantity" += NumOfSalesRecs_lInt;
                                        SalesHeaderStats."Total Watts" += TotalWatts_lDec;
                                        SalesHeaderStats."Total Outstanding Amount" += TotalOutstandingAmount_lDec;
                                        if not SalesHeaderStats.Modify then;
                                    end else
                                    begin
                                        SalesHeaderStats.Reset;
                                        SalesHeaderStats.Init;
                                        SalesHeaderStats."Document No." := Format(RecordNum_lInt);
                                        SalesHeaderStats."Document Type" := DocumentType_lOptn;
                                        SalesHeaderStats."Line No." := RecordNum_lInt;
                                        SalesHeaderStats."Salesperson Code" := SalesPersonCode_lCode;
                                        SalesHeaderStats."Total Watts" := TotalWatts_lDec;
                                        SalesHeaderStats."Total Outstanding Amount" := TotalOutstandingAmount_lDec;
                                        SalesHeaderStats."Total Amount Incl Tax" := TotalAmountInclTaxPerPerson_lDec;
                                        SalesHeaderStats."Total Quantity" := NumOfSalesRecs_lInt;

                                        //Get the Salesperson Name
                                        if SalesPersonCode_lCode <> '' then
                                        begin
                                            SalesPerson_lRec.Reset;
                                            SalesPerson_lRec.SetRange(Code, SalesPersonCode_lCode);
                                            if SalesPerson_lRec.FindFirst then
                                                SalesHeaderStats."Salesperson Name" := SalesPerson_lRec.Name
                                            else
                                                SalesHeaderStats."Salesperson Name" := '';
                                        end else
                                            SalesHeaderStats."Salesperson Name" := '';

                                        if not SalesHeaderStats.Insert then;
                                    end;
                                    RecordNum_lInt += 1;
                                    NumOfSalesRecs_lInt := 1;
                                    SalesHeader_lRec.CalcFields("Amount Including VAT", "Outstanding Amount ($)");
                                    TotalWatts_lDec := SalesHeader_lRec.TotalWattage;
                                    TotalOutstandingAmount_lDec := SalesHeader_lRec."Outstanding Amount ($)";
                                    TotalAmountInclTaxPerPerson_lDec := SalesHeader_lRec."Amount Including VAT";
                                    SalesPersonCode_lCode := SalesHeader_lRec."Salesperson Code";
                                    DocumentType_lOptn := SalesHeader_lRec."Document Type";
                                end else
                                begin
                                    NumOfSalesRecs_lInt += 1;
                                    SalesHeader_lRec.CalcFields("Amount Including VAT", "Outstanding Amount ($)");
                                    TotalWatts_lDec += SalesHeader_lRec.TotalWattage;
                                    TotalOutstandingAmount_lDec := SalesHeader_lRec."Outstanding Amount ($)";
                                    TotalAmountInclTaxPerPerson_lDec += SalesHeader_lRec."Amount Including VAT";
                                end;                                   
                            until SalesHeader_lRec.Next = 0;
                        end;
                    end;

                    //Clear any filters and get all records
                    SalesHeaderStats.Reset;
                    IF SalesHeaderStats.FindSet then;

                    //GRALE01 - Add End
                end;
                
            }

        }

    }
}