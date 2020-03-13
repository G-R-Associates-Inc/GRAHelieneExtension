/**
*   Documentation Section
*   GRALE01 - 01/21/2020 - Lina El Sadek, G.R. & Associates Inc.
*           - Created batch report to update Item Ledger Entry fields Salesperson Code, Salesperson Name, and External Document No.
*
*/

report 58003 BatchUpdateItemLedgerEntry
{
    Caption = 'Batch Update Item Ledger Entry';
    Description = 'This report should run once only and populated Salesperson Code, Salesperson Name, and External Document No. fields based on the values provided in each entry''s source document.';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea=All;

    dataset
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            DataItemTableView = sorting("Posting Date", "Entry Type", "Country/Region Code") where ("Entry Type" = const(Sale), "Document Type" = filter("Sales Shipment"|"Sales Invoice"|"Sales Return Receipt"|"Sales Credit Memo"));
            RequestFilterFields = "Entry No.", "Entry Type", "Document Type", "Item No.";

            trigger OnPreDataItem();
            begin 
                
                TotalCount := Count;
                timProgress := TIME;
                CurrentCount := 0;

                windowsDialog.Open('Updating Records Progress @1@@@@@@@');
                
            end;
            
            trigger OnAfterGetRecord();
            begin 
                
                CurrentCount += 1;
                Percentage := Round(CurrentCount/TotalCount * 10000,1);                
                windowsDialog.Update(1,Percentage);

                if "Document Type" = "Document Type"::"Sales Shipment" then
                begin
                    if ("Document Type" = PrevDocumentType) and ("Document No." = PrevDocumentNo) then
                    begin 
                        "Salesperson Code" := SalesShipment."Salesperson Code";
                        "External Document No." := SalesShipment."External Document No.";
                        //"Salesperson Name" := SalespersonPurchaser.Name; 
                        "Salesperson Name" := SalesPersonName;   
                    end else
                    begin
                        SalesShipment.Reset;
                        SalesShipment.SetRange("No.", "Document No.");
                        if SalesShipment.FindFirst then
                        begin
                            "Salesperson Code" := SalesShipment."Salesperson Code";
                            "External Document No." := SalesShipment."External Document No.";
                            if "Salesperson Code" <> '' then
                            begin 
                                SalespersonPurchaser.Reset;
                                if SalespersonPurchaser.Get("Salesperson Code") then
                                    SalesPersonName := SalespersonPurchaser.Name
                                else
                                  SalesPersonName := '';
                            end;
                            "Salesperson Name" := SalesPersonName;    
                        end;
                    end;    
                end else if "Document Type" = "Document Type"::"Sales Invoice" then
                begin
                    if ("Document Type" = PrevDocumentType) and ("Document No." = PrevDocumentNo) then
                    begin 
                        "Salesperson Code" := SalesInvoice."Salesperson Code";
                        "External Document No." := SalesInvoice."External Document No.";
                        //"Salesperson Name" := SalespersonPurchaser.Name;
                        "Salesperson Name" := SalesPersonName;    
                    end else
                    begin 
                        SalesInvoice.Reset;
                        SalesInvoice.SetRange("No.", "Document No.");
                        if SalesInvoice.FindFirst then
                        begin
                            "Salesperson Code" := SalesInvoice."Salesperson Code";
                            "External Document No." := SalesInvoice."External Document No.";
                            if "Salesperson Code" <> '' then
                            begin 
                                SalespersonPurchaser.Reset;
                                if SalespersonPurchaser.Get("Salesperson Code") then
                                    SalesPersonName := SalespersonPurchaser.Name
                                else
                                  SalesPersonName := '';  
                            end;
                            "Salesperson Name" := SalesPersonName;        
                        end;
                    end;    
                end else if "Document Type" = "Document Type"::"Sales Return Receipt" then
                begin
                    if ("Document Type" = PrevDocumentType) and ("Document No." = PrevDocumentNo) then
                    begin 
                        "Salesperson Code" := SalesReturnReceipt."Salesperson Code";
                        "External Document No." := SalesReturnReceipt."External Document No.";
                        //"Salesperson Name" := SalespersonPurchaser.Name;
                        "Salesperson Name" := SalesPersonName;    
                    end else
                    begin
                        SalesReturnReceipt.Reset;
                        SalesReturnReceipt.SetRange("No.", "Document No.");
                        if SalesReturnReceipt.FindFirst then
                        begin
                            "Salesperson Code" := SalesReturnReceipt."Salesperson Code";
                            "External Document No." := SalesReturnReceipt."External Document No.";
                            if "Salesperson Code" <> '' then
                            begin 
                                SalespersonPurchaser.Reset;
                                if SalespersonPurchaser.Get("Salesperson Code") then
                                    SalesPersonName := SalespersonPurchaser.Name
                                else
                                  SalesPersonName := '';
                            end;
                            "Salesperson Name" := SalesPersonName;    
                        end; 
                    end;   
                end else if "Document Type" = "Document Type"::"Sales Credit Memo" then
                begin
                    if ("Document Type" = PrevDocumentType) and ("Document No." = PrevDocumentNo) then
                    begin 
                        "Salesperson Code" := SalesCreditMemo."Salesperson Code";
                        "External Document No." := SalesCreditMemo."External Document No.";
                        //"Salesperson Name" := SalespersonPurchaser.Name;
                        "Salesperson Name" := SalesPersonName;    
                    end else
                    begin
                        SalesCreditMemo.Reset;
                        SalesCreditMemo.SetRange("No.", "Document No.");
                        if SalesCreditMemo.FindFirst then
                        begin
                            "Salesperson Code" := SalesCreditMemo."Salesperson Code";
                            "External Document No." := SalesCreditMemo."External Document No.";
                            if "Salesperson Code" <> '' then
                            begin 
                                SalespersonPurchaser.Reset;
                                if SalespersonPurchaser.Get("Salesperson Code") then
                                    SalesPersonName := SalespersonPurchaser.Name
                                else
                                  SalesPersonName := '';
                            end;
                            "Salesperson Name" := SalesPersonName;                                   
                        end;
                    end;    
                end;

                If Modify(false) then;

                if PrevDocumentType = 0 then
                begin
                    PrevDocumentType := "Document Type";
                    PrevDocumentNo := "Document No.";
                end else if PrevDocumentType <> "Document Type" then
                begin
                    PrevDocumentType := "Document Type";
                    PrevDocumentNo := "Document No.";
                end;
                
            end; 

            trigger OnPostDataItem();
            begin
                windowsDialog.Close;
            end;   
        }
    }

    trigger OnInitReport();
    begin
        PrevDocumentType := 0;
        PrevDocumentNo := '';
        SalesPersonName := '';
    end;

    var
        SalesShipment: Record "Sales Shipment Header";
        SalesInvoice: Record "Sales Invoice Header";  
        SalesReturnReceipt: Record "Return Receipt Header";
        SalesCreditMemo: Record "Sales Cr.Memo Header";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        Percentage: Decimal;
        PrevDocumentType: Integer;
        TotalCount: Integer;
        CurrentCount:Integer;       
        PrevDocumentNo: Code[30];
        windowsDialog: Dialog;
        timProgress: Time;
        SalesPersonName: Text[50];
}