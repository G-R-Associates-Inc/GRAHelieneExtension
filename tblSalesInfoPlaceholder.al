/**
* Documentation Section
*   GRALE01 - 09/18/19 - Lina El Sadek, G.R. & Associates Inc.
            - Version Tag GRA1.02
*           - Created the table to act as a placeholder for all the information we want to expose in Salesperson Web Portal.
**/

table 58000 "Sales Info Placeholder"
{
    fields
    {
        field(1; "Document No."; Code[30])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }

        field(2; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = Quote,Order,Invoice,"Credit Memo","Blanket Order","Return Order";           
            OptionCaption = 'Quote,Order,Invoice,"Credit Memo","Blanket Order","Return Order"';
        }

        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers= ,"G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";           
        }

        field(4; "No."; Code[30])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }

        field(5; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }

        field(6; "Sell-to Customer No."; Code[30])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = ToBeClassified;
        }

        field(7; "Sell-to Customer Name"; Text[50])
        {
            Caption = 'Sell-to Customer Name';
            DataClassification = ToBeClassified;
        }

        field(8; "Bill-to Customer No."; Code[30])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = ToBeClassified;
        }

        field(9; "Bill-to Customer Name"; Text[50])
        {
            Caption = 'Bill-to Customer Name';
            DataClassification = ToBeClassified;
        }

        field(10; "Salesperson Code"; Code[30])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
        }

        field(11; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }

        field(12; "Total Quantity"; Decimal)
        {
            Caption = 'Total Quantity';
            DataClassification = ToBeClassified;
        }

        field(13; "Outstanding Amount"; Decimal)
        {
            Caption = 'Outstanding Amount';
            DataClassification = ToBeClassified;
        }

        field(14; "Total Outstanding Amount"; Decimal)
        {
            Caption = 'Total Outstanding Amount';
            DataClassification = ToBeClassified;
        }

        field(15; "Amount"; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(16; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            DataClassification = ToBeClassified;
        }

        field(17; "Quantity Shipped"; Decimal)
        {
            Caption = 'Quantity Shipped';
            DataClassification = ToBeClassified;
        }

        field(18; "Total Quantity Shipped"; Decimal)
        {
            Caption = 'Total Quantity Shipped';
            DataClassification = ToBeClassified;
        }

        field(19; "Qty. to Ship"; Decimal)
        {
            Caption = 'Qty. to Ship';
            DataClassification = ToBeClassified;
        }

        field(20; "Total Qty. to Ship"; Decimal)
        {
            Caption = 'Total Qty. to Ship';
            DataClassification = ToBeClassified;
        }

        field(21; "Amount Incl Tax"; Decimal)
        {
            Caption = 'Amount Incl Tax';
            DataClassification = ToBeClassified;
        }


        field(22; "Total Amount Incl Tax"; Decimal)
        {
            Caption = 'Total Amount Incl Tax';
            DataClassification = ToBeClassified;
        }


        field(23; "External Document No."; Code[40])
        {
            Caption = 'External Document No.';
            DataClassification = ToBeClassified;
        }

        field(24; "Status"; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }

        field(25; "Completely Shipped"; Boolean)
        {
            Caption = 'Completely Shipped';
            DataClassification = ToBeClassified;
        }

        field(26; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = ToBeClassified;
        }

        field(27; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }

        field(28; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }

        field(29; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = ToBeClassified;
        }

        field(30; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';
            DataClassification = ToBeClassified;
        }

        field(31; "Promised Delivery Date"; Date)
        {
            Caption = 'Promised Delivery Date';
            DataClassification = ToBeClassified;
        }

        field(32; "Total Watts"; Decimal)
        {
            Caption = 'Total Watts';
            DataClassification = ToBeClassified;
        }

        field(33; "Watts"; Decimal)
        {
            Caption = 'Watts';
            DataClassification = ToBeClassified;
        }

        field(34; "Cost Per Watt"; Decimal)
        {
            Caption = 'Cost Per Watt';
            DataClassification = ToBeClassified;
        }

        field(35; "Price Per Watt"; Decimal)
        {
            Caption = 'Price Per Watt';
            DataClassification = ToBeClassified;
        }

        field(36; "Description"; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }

        field(37; "Salesperson Name"; Text[50])
        {
            Caption = 'Salesperson Name';
            DataClassification = ToBeClassified;
        }

        field(38; "Company Name"; Text[50])
        {
            Caption = 'Company Name';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(Key1; "Document No.", "Document Type", "Line No."){}

        key(Key2; "Document No.", "Document Type", "Sell-to Customer No.", "Sell-to Customer Name", "Line No."){}

        key(Key3; "Document No.", "Document Type", "Company Name", "Sell-to Customer No.", "Sell-to Customer Name", "Salesperson Code", "Line No."){}
        
    }

}