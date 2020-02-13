/**
* Documentation Section
*   12/13/2019 - Lina El Sadek, G.R. & Associates Inc.
*              - This report is the same as NAV's 10048. We will add to it any future Heliene's customizations. 
*/       
report 58001 "GRA Customer/Item Statistics"
{
    CaptionML=ENU='Customer/Item Statistics',
               ESM='Estad. cliente/producto',
               FRC='Statistiques client/article',
               ENC='Customer/Item Statistics';
  
    DefaultLayout=RDLC;
    RDLCLayout='./GRACustomerItemStatistics.rdlc';
    UsageCategory=ReportsAndAnalysis;
    ApplicationArea=All;
    PreviewMode=Normal;
    dataset
    {
        dataitem(Customer; Customer)
        {
                PrintOnlyIfDetail = true;
                RequestFilterFields="No.","Search Name","Customer Posting Group";

                column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
                {

                }

                column(TIME;TIME)
                {
                    
                }

                column(CompanyInformation_Name;CompanyInformation.Name)
                {
                    
                }

                column(CurrReport_PAGENO;CurrReport.PAGENO)
                {
                    
                }

                column(USERID;USERID)
                {
                    
                }

                column(Customer_TABLECAPTION___________FilterString;Customer.TABLECAPTION + ':  ' + FilterString)
                {
                    
                }


                column(Value_Entry__TABLECAPTION___________FilterString2;"Value Entry".TABLECAPTION + ':  ' + FilterString2)
                {
                    
                }

                column(groupno;groupno)
                {
                    
                }

                column(PrintToExcel;PrintToExcel)
                {
                    
                }

                column(FilterString;FilterString)
                {
                    
                }

                column(FilterString2;FilterString2)
                {
                    
                }

                column(OnlyOnePerPage;OnlyOnePerPage)
                {
                    
                }

                column(Customer__No__;"No.")
                {
                    
                }

                column(Customer_Name;Name)
                {
                    
                }

                column(Customer__Phone_No__;"Phone No.")
                {
                    
                }

                column(Customer_Contact;Contact)
                {
                    
                }

                column(Value_Entry___Sales_Amount__Actual__;"Value Entry"."Sales Amount (Actual)")
                {
                    
                }

                column(Profit;Profit)
                {
                    
                }

                column(Value_Entry___Discount_Amount_;"Value Entry"."Discount Amount")
                {
                    
                }

                column(Profit__;"Profit%")
                {
                    DecimalPlaces=1:1;
                }

                column(Customer_Global_Dimension_1_Filter;"Global Dimension 1 Filter")
                {
                    
                }

                column(Customer_Global_Dimension_2_Filter;"Global Dimension 2 Filter")
                {
                    
                }
                
                column(Customer_Item_StatisticsCaption;Customer_Item_StatisticsCaptionLbl)
                {
                    
                }

                column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
                {
                    
                }

                column(Customer_NoCaption;Customer_NoCaptionLbl)
                {
                    
                }

                column(Customer_NameCaption;FIELDCAPTION(Name))
                {
                    
                }

                column(Value_Entry__Item_No__Caption;"Value Entry".FIELDCAPTION("Item No."))
                {
                    
                }

                column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
                {
                    
                }

                column(Invoiced_Quantity_Caption;Invoiced_Quantity_CaptionLbl)
                {
                    
                }

                column(Value_Entry__Sales_Amount__Actual__Caption;Value_Entry__Sales_Amount__Actual__CaptionLbl)
                {
                    
                }

                column(Profit_Control38Caption;Profit_Control38CaptionLbl)
                {
                    
                }

                column(Value_Entry__Discount_Amount_Caption;Value_Entry__Discount_Amount_CaptionLbl)
                {
                    
                }

                column(Profit___Control40Caption;Profit___Control40CaptionLbl)
                {
                    
                }

                column(Item__Base_Unit_of_Measure_Caption;Item__Base_Unit_of_Measure_CaptionLbl)
                {
                    
                }

                column(Phone_Caption;Phone_CaptionLbl)
                {
                    
                }

                column(Contact_Caption;Contact_CaptionLbl)
                {
                    
                }

                column(Report_TotalCaption;Report_TotalCaptionLbl)
                {
                    
                }

                //GRALE01 - Add Start
                column(SalespersonCode_Caption;SalespersonCode_CaptionLbl)
                {
                    
                }
                column(SalespersonName_Caption;SalespersonName_CaptionLbl)
                {
                    
                }
                //GRALE01 - Add End

                dataitem("Value Entry"; "Value Entry")
                {
                    RequestFilterFields="Item No.","Inventory Posting Group","Posting Date";
                    
                    DataItemTableView=SORTING("Source Type","Source No.","Item Ledger Entry Type","Item No.","Posting Date")
                                    WHERE("Source Type"=CONST(Customer),
                                        "Item Ledger Entry Type"=CONST(Sale),
                                        "Expected Cost"=CONST(false));

                    DataItemLink="Source No."=FIELD("No."),
                                "Global Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                "Global Dimension 2 Code"=FIELD("Global Dimension 2 Filter"); 

                    column(Value_Entry__Item_No__;"Item No.")
                    {

                    }

                    column(Item_Description;Item.Description)
                    {
                        
                    }

                    column(Invoiced_Quantity_;-"Invoiced Quantity")
                    {
                        
                    }

                    column(Item__Base_Unit_of_Measure_;Item."Base Unit of Measure")
                    {
                        
                    }

                    column(Profit_Control38;Profit)
                    {
                        
                    }

                    column(Value_Entry__Discount_Amount_;"Discount Amount")
                    {
                        
                    }

                    column(Profit___Control40;"Profit%")
                    {
                    DecimalPlaces=1:1; 
                    }

                    column(Value_Entry__Sales_Amount__Actual__;"Sales Amount (Actual)")
                    {
                        
                    }

                    column(Customer__No___Control41;Customer."No.")
                    {
                        
                    }

                    column(Value_Entry__Sales_Amount__Actual___Control42;"Sales Amount (Actual)")
                    {
                        
                    }

                    column(Profit_Control43;Profit)
                    {
                        
                    }

                    column(Value_Entry__Discount_Amount__Control44;"Discount Amount")
                    {
                        
                    }

                    column(Profit___Control45;"Profit%")
                    {
                    DecimalPlaces=1:1; 
                    }

                    column(Value_Entry_Entry_No_;"Entry No.")
                    {
                        
                    }

                    column(Value_Entry_Source_No_;"Source No.")
                    {
                        
                    }

                    column(Value_Entry_Global_Dimension_1_Code;"Global Dimension 1 Code")
                    {
                        
                    }

                    column(Value_Entry_Global_Dimension_2_Code;"Global Dimension 2 Code")
                    {
                        
                    }

                    column(Customer_TotalCaption;Customer_TotalCaptionLbl)
                    {
                        
                    }

                    //GRALE01 - Add Start
                    column(Value_Entry_SalespersonCode;"Salespers./Purch. Code")
                    {
                        
                    }
                    column(Value_Entry_SalespersonName;Salespersonpurchaser.Name)
                    {
                        
                    }

                    //GRALE01 - Add End

                    trigger OnPreDataItem();
                    begin
                        CurrReport.CreateTotals("Invoiced Quantity","Sales Amount (Actual)",Profit,"Discount Amount");
                        CLEAR(ValueEntryTotalForItem);
                        ProfitTotalForItem := 0;
                    end;

                    trigger OnAfterGetRecord();
                    begin
                        if ValueEntryTotalForItem."Item No." <> "Item No." then
                        begin
                            "CalculateProfit%";
                            if PrintToExcel AND (ValueEntryTotalForItem."Item No." <> '') THEN
                                MakeExcelDataBody;
                            CLEAR(ValueEntryTotalForItem);
                            ProfitTotalForItem := 0;
                            if NOT Item.GET("Item No.") then 
                            begin
                                Item.Description := Text000;
                                Item."Base Unit of Measure" := '';
                            end;
                        end;

                        Profit := "Sales Amount (Actual)" + "Cost Amount (Actual)";
                        "Discount Amount" := -"Discount Amount";

                        ValueEntryTotalForItem."Item No." := "Item No.";
                        ValueEntryTotalForItem."Invoiced Quantity" += "Invoiced Quantity";
                        ValueEntryTotalForItem."Sales Amount (Actual)" += "Sales Amount (Actual)";
                        ValueEntryTotalForItem."Discount Amount" += "Discount Amount";
                        ProfitTotalForItem += Profit;

                        //GRALE01 - Add Start
                        SalespersonPurchaser.Reset;
                        if "Salespers./Purch. Code" <> '' then
                        begin
                            SalespersonPurchaser.SetRange(Code, "Salespers./Purch. Code");
                            if not SalespersonPurchaser.FindFirst then
                                SalespersonPurchaser.Name := '';
                        end else
                            SalespersonPurchaser.Name := '';
                        //GRALE01 - Add End
                    end;

                    trigger OnPostDataItem();
                    begin
                        if PrintToExcel AND (ValueEntryTotalForItem."Item No." <> '') then
                        begin
                            "CalculateProfit%";
                            MakeExcelDataBody;
                        end;
                    end;
                }
    
                trigger OnPreDataItem();
                begin
                    CurrReport.NewPagePerRecord := OnlyOnePerPage;
                    CurrReport.CreateTotals("Value Entry"."Sales Amount (Actual)",Profit,"Value Entry"."Discount Amount");
                end;

                trigger OnAfterGetRecord();
                begin
                    IF OnlyOnePerPage THEN
                        groupno := groupno + 1;
                end;
        }
        


        

    }

    requestpage
    {

        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU = 'Options',
                                    ESM = 'Opciones',
                                    FRC = 'Options',
                                    ENC = 'Options'; 

                    field("New Page per Account"; OnlyOnePerPage)
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML=ENU='New Page per Account',
                                ESM='Nueva p g. por cuenta',
                                FRC='Nouvelle page par compte',
                                ENC='New Page per Account';

                        ToolTipML=ENU='Specifies if you want to print each account on a separate page. Each account will begin at the top of the following page. Otherwise, each account will follow the previous account on the current page.',
                                ESM='Especifica si desea imprimir cada cuenta en una p gina independiente. Cada una de las cuentas empezar  al principio de la p gina siguiente. En caso contrario, cada cuenta seguir  a la cuenta anterior en la p gina actual.',
                                FRC='Sp‚cifie si vous souhaitez imprimer chaque compte sur une page distincte. Chaque compte commencera au d‚but de la page suivante. Dans le cas contraire, chaque compte viendra aprŠs le compte pr‚c‚dent sur la page actuelle.',
                                ENC='Specifies if you want to print each account on a separate page. Each account will begin at the top of the following page. Otherwise, each account will follow the previous account on the current page.';
                    }

                    field("Print To Excel"; PrintToExcel)
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML=ENU='Print To Excel',
                                ESM='Imprimir en Excel',
                                FRC='Imprimer dans Excel',
                                ENC='Print To Excel';

                        ToolTipML=ENU='Specifies if you want to export the data to an Excel spreadsheet for additional analysis or formatting before printing.',
                                ESM='Especifica si desea exportar los datos a una hoja de c lculo de Excel para realizar an lisis adicionales o para aplicar formato antes de imprimir.',
                                FRC='Sp‚cifie si vous souhaitez exporter les donn‚es dans une feuille de calcul Excel pour une analyse ult‚rieure ou pour une mise en forme avant impression.';
                    }
                }
            }
        }
    }


    labels
    {
    }
   
    trigger OnPreReport();
    begin
        CompanyInformation.GET;
        FilterString := Customer.GETFILTERS;
        FilterString2 := "Value Entry".GETFILTERS;
        IF PrintToExcel THEN
            MakeExcelInfo;
    end;

    trigger OnPostReport();
    begin
        IF PrintToExcel THEN
            CreateExcelbook;
    end;

    var
        ExcelBuf: Record "Excel Buffer" temporary;
        Item: Record Item;
        CompanyInformation: Record "Company Information";
        ValueEntryTotalForItem: Record "Value Entry";
        //GRALE01 - Add Start
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        //GRALE01 - Add End
        FilterString: Text;
        FilterString2: Text;
        groupno: Integer;
        Profit: Decimal;
        "Profit%": Decimal;
        ProfitTotalForItem: Decimal;
        OnlyOnePerPage: Boolean;      
        PrintToExcel: Boolean;
        Text000: TextConst ENU='Invalid Item', ESM='Producto no v lido', FRC='Article non valide', ENC='Invalid Item';
        Text001: TextConst ENU='Data', ESM='Datos', FRC='Donn‚es', ENC='Data';
        Text002: TextConst ENU='Customer/Item Statistics', ESM='Estad. cliente/producto', FRC='Statistiques client/article', ENC='Customer/Item Statistics';
        Text003: TextConst ENU='Company Name', ESM='Nombre empresa', FRC='Nom de compagnie', ENC='Company Name';
        Text004: TextConst ENU='Report No.', ESM='N§ informe', FRC='Nø rapport', ENC='Report No.';
        Text005: TextConst ENU='Report Name', ESM='Nombre informe', FRC='Nom de rapport', ENC='Report Name';
        Text006: TextConst ENU='User ID', ESM='Id. usuario', FRC='Code utilisateur', ENC='User ID';
        Text007: TextConst ENU='Date / Time', ESM='Fecha / Hora', FRC='Date / Heure', ENC='Date / Time';
        Text008: TextConst ENU='Customer Filters', ESM='Filtros cliente', FRC='Filtres client', ENC='Customer Filters';
        Text009: TextConst ENU='Value Entry Filters', ESM='Filtros mov. valor', FRC='Filtres d''‚criture valeur', ENC='Value Entry Filters';
        Text010: TextConst ENU='Contribution Margin', ESM='Margen contribuci¢n', FRC='Marge contribution', ENC='Contribution Margin';
        Text011: TextConst ENU='Contribution Ratio', ESM='Ratio contribuci¢n', FRC='Ratio contribution', ENC='Contribution Ratio';   
        Customer_Item_StatisticsCaptionLbl: TextConst ENU='Customer/Item Statistics', ESM='Estad. cliente/producto', FRC='Statistiques client/article', ENC='Customer/Item Statistics';
        CurrReport_PAGENOCaptionLbl: TextConst ENU='Page', ESM='P g.', FRC='Page', ENC='Page';
        Customer_NoCaptionLbl: TextConst ENU='Customer No', ESM='N§ cliente', FRC='Nø de client', ENC='Customer No';
        Item_DescriptionCaptionLbl: TextConst ENU='Item Description', ESM='Descripci¢n producto', FRC='Description article', ENC='Item Description';
        Invoiced_Quantity_CaptionLbl: TextConst ENU='Quantity', ESM='Cantidad', FRC='Quantit‚', ENC='Quantity';
        Value_Entry__Sales_Amount__Actual__CaptionLbl: TextConst ENU='Amount', ESM='Importe', FRC='Montant', ENC='Amount';
        Profit_Control38CaptionLbl: TextConst ENU='Contribution Margin', ESM='Margen contribuci¢n', FRC='Marge contribution', ENC='Contribution Margin';
        Value_Entry__Discount_Amount_CaptionLbl: TextConst ENU='Discount', ESM='Descuento', FRC='Escompte', ENC='Discount';
        Profit___Control40CaptionLbl: TextConst ENU='Contrib Ratio', ESM='Coeficiente contribuci¢n', FRC='Ratio contribution', ENC='Contrib Ratio';
        Item__Base_Unit_of_Measure_CaptionLbl: TextConst ENU='Unit', ESM='Unidad', FRC='Unit‚', ENC='Unit';
        Phone_CaptionLbl: TextConst ENU='Phone:', ESM='Tel‚fono:', FRC='T‚l‚phone :',ENC='Phone:';
        Contact_CaptionLbl: TextConst ENU='Contact:', ESM='Contacto:', FRC='Contact :', ENC='Contact:';
        Report_TotalCaptionLbl: TextConst ENU='Report Total', ESM='Total informe', FRC='Total du rapport', ENC='Report Total';
        Customer_TotalCaptionLbl: TextConst ENU='Customer Total', ESM='Total cliente', FRC='Total du client', ENC='Customer Total';
        //GRALE01 - Add Start
        SalespersonCode_CaptionLbl: TextConst ENU='Salesperson Code', ENC='Salesperson Code';
        SalespersonName_CaptionLbl: TextConst ENU='Salesperson Name', ENC='Salesperson Name';
        //GRALE01 - Add End
    PROCEDURE "CalculateProfit%"();
    BEGIN
        IF ValueEntryTotalForItem."Sales Amount (Actual)" <> 0 THEN
            "Profit%" := ROUND(100 * ProfitTotalForItem / ValueEntryTotalForItem."Sales Amount (Actual)",0.1)
        ELSE
            "Profit%" := 0;
    END;

    LOCAL PROCEDURE MakeExcelInfo();
    BEGIN
        ExcelBuf.SetUseInfoSheet;
        ExcelBuf.AddInfoColumn(FORMAT(Text003),FALSE,TRUE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(CompanyInformation.Name,FALSE,FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text005),FALSE,TRUE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(FORMAT(Text002),FALSE,FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text004),FALSE,TRUE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(REPORT::"GRA Customer/Item Statistics",FALSE,FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text006),FALSE,TRUE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(USERID,FALSE,FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text007),FALSE,TRUE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(TODAY,FALSE,FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Date);
        ExcelBuf.AddInfoColumn(TIME,FALSE,FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Time);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text008),FALSE,TRUE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(FilterString,FALSE,FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text009),FALSE,TRUE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(FilterString2,FALSE,FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
    END;

    LOCAL PROCEDURE MakeExcelDataHeader();
    BEGIN
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer.FIELDCAPTION("No."),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Customer.FIELDCAPTION(Name),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Value Entry".FIELDCAPTION("Item No."),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Item.FIELDCAPTION(Description),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //GRALE01 - Add Start
        ExcelBuf.AddColumn(Format(SalespersonCode_CaptionLbl),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Format(SalespersonName_CaptionLbl),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //GRALE01 - Add End
        ExcelBuf.AddColumn("Value Entry".FIELDCAPTION("Invoiced Quantity"),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Item.FIELDCAPTION("Base Unit of Measure"),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Value Entry".FIELDCAPTION("Sales Amount (Actual)"),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text010),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text011),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Value Entry".FIELDCAPTION("Discount Amount"),FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
    END;

    LOCAL PROCEDURE MakeExcelDataBody();
    BEGIN
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer."No.",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Customer.Name,FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(ValueEntryTotalForItem."Item No.",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Item.Description,FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        //GRALE01 - Add Start
        ExcelBuf.AddColumn(ValueEntryTotalForItem."Salespers./Purch. Code",FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SalespersonPurchaser.Name,FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //GRALE01 - Add End
        ExcelBuf.AddColumn(-ValueEntryTotalForItem."Invoiced Quantity",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(Item."Base Unit of Measure",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(ValueEntryTotalForItem."Sales Amount (Actual)",FALSE,'',FALSE,FALSE,FALSE,'#,##0.00',ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(ProfitTotalForItem,FALSE,'',FALSE,FALSE,FALSE,'#,##0.00',ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn("Profit%" / 100,FALSE,'',FALSE,FALSE,FALSE,'0.0%',ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(ValueEntryTotalForItem."Discount Amount",FALSE,'',FALSE,FALSE,FALSE,'#,##0.00',ExcelBuf."Cell Type"::Number);
    END;

    LOCAL PROCEDURE CreateExcelbook();
    BEGIN
      ExcelBuf.CreateBookAndOpenExcel('',Text001,Text002,COMPANYNAME,USERID);
      ERROR('');
    END;
}