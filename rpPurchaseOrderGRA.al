/**
*   GRALE01 - 10/07/2019 - Lina El Sadek, G.R. & Associates Inc.codeunit
*           - This report is the same as Sabre's 50100. We will be maintaining it from now on. 
*/       
report 58000 "GRA Purchase Order"
{
    // version NAVW111.00.00.22292,NAVNA11.00.00.22292

    WordLayout = './GRA Purchase Order.docx';
    CaptionML = ENU = 'GRA Purchase Order',
                ESM = 'Compra Pedido',
                FRC = 'Achat Commande',
                ENC = 'GRA Purchase Order';
    DefaultLayout = Word;
    EnableHyperlinks = true;
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Purchase Header";

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING ("Document Type", "No.") WHERE ("Document Type" = CONST (Order));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeadingML = ENU = 'Standard Purchase - Order',
                                     ESM = 'Compra estándar: pedido',
                                     FRC = 'Codes achat standard - commande',
                                     ENC = 'Standard Purchase - Order';
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyHomePage_Lbl; HomePageCaptionLbl)
            {
            }
            column(CompanyHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyEmail_Lbl; EmailIDCaptionLbl)
            {
            }
            column(CompanyEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyPhoneNo_Lbl; CompanyInfoPhoneNoCaptionLbl)
            {
            }
            column(CompanyGiroNo; CompanyInfo."Giro No.")
            {
            }
            column(CompanyGiroNo_Lbl; CompanyInfoGiroNoCaptionLbl)
            {
            }
            column(CompanyBankName; CompanyInfo."Bank Name")
            {
            }
            column(CompanyBankName_Lbl; CompanyInfoBankNameCaptionLbl)
            {
            }
            column(CompanyBankBranchNo; CompanyInfo."Bank Branch No.")
            {
            }
            column(CompanyBankBranchNo_Lbl; CompanyInfo.FIELDCAPTION("Bank Branch No."))
            {
            }
            column(CompanyBankAccountNo; CompanyInfo."Bank Account No.")
            {
            }
            column(CompanyBankAccountNo_Lbl; CompanyInfoBankAccNoCaptionLbl)
            {
            }
            column(CompanyIBAN; CompanyInfo.IBAN)
            {
            }
            column(CompanyIBAN_Lbl; CompanyInfo.FIELDCAPTION(IBAN))
            {
            }
            column(CompanySWIFT; CompanyInfo."SWIFT Code")
            {
            }
            column(CompanySWIFT_Lbl; CompanyInfo.FIELDCAPTION("SWIFT Code"))
            {
            }
            column(CompanyLogoPosition; CompanyLogoPosition)
            {
            }
            column(CompanyRegistrationNumber; CompanyInfo.GetRegistrationNumber)
            {
            }
            column(CompanyRegistrationNumber_Lbl; CompanyInfo.GetRegistrationNumberLbl)
            {
            }
            column(CompanyVATRegNo; CompanyInfo.GetVATRegistrationNumber)
            {
            }
            column(CompanyVATRegNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
            {
            }
            column(CompanyVATRegistrationNo; CompanyInfo.GetVATRegistrationNumber)
            {
            }
            column(CompanyVATRegistrationNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
            {
            }
            column(CompanyLegalOffice; CompanyInfo.GetLegalOffice)
            {
            }
            column(CompanyLegalOffice_Lbl; CompanyInfo.GetLegalOfficeLbl)
            {
            }
            column(CompanyCustomGiro; CompanyInfo.GetCustomGiro)
            {
            }
            column(CompanyCustomGiro_Lbl; CompanyInfo.GetCustomGiroLbl)
            {
            }
            column(DocType_PurchHeader; "Document Type")
            {
            }
            column(No_PurchHeader; "No.")
            {
            }
            column(DocumentTitle_Lbl; DocumentTitleLbl)
            {
            }
            column(Amount_Lbl; AmountCaptionLbl)
            {
            }
            column(PurchLineInvDiscAmt_Lbl; PurchLineInvDiscAmtCaptionLbl)
            {
            }
            column(Subtotal_Lbl; SubtotalCaptionLbl)
            {
            }
            column(VATAmtLineVAT_Lbl; VATAmtLineVATCaptionLbl)
            {
            }
            column(VATAmtLineVATAmt_Lbl; VATAmtLineVATAmtCaptionLbl)
            {
            }
            column(VATAmtSpec_Lbl; VATAmtSpecCaptionLbl)
            {
            }
            column(VATIdentifier_Lbl; VATIdentifierCaptionLbl)
            {
            }
            column(VATAmtLineInvDiscBaseAmt_Lbl; VATAmtLineInvDiscBaseAmtCaptionLbl)
            {
            }
            column(VATAmtLineLineAmt_Lbl; VATAmtLineLineAmtCaptionLbl)
            {
            }
            column(VALVATBaseLCY_Lbl; VALVATBaseLCYCaptionLbl)
            {
            }
            column(Total_Lbl; TotalCaptionTxt) //GRALE01 - Change
            {
            }
            column(PaymentTermsDesc_Lbl; PaymentTermsDescCaptionLbl)
            {
            }
            column(ShipmentMethodDesc_Lbl; ShipmentMethodDescCaptionLbl)
            {
            }
            column(PrepymtTermsDesc_Lbl; PrepymtTermsDescCaptionLbl)
            {
            }
            column(HomePage_Lbl; HomePageCaptionLbl)
            {
            }
            column(EmailID_Lbl; EmailIDCaptionLbl)
            {
            }
            column(AllowInvoiceDisc_Lbl; AllowInvoiceDiscCaptionLbl)
            {
            }
            column(CurrRepPageNo; STRSUBSTNO(PageLbl, FORMAT(CurrReport.PAGENO)))
            {
            }
            column(DocumentDate; FORMAT("Document Date", 0, DateFormat))
            {
            }
            column(FormattedDocumentDate;ExtensionFunctions.getFormattedDate("Document Date")){}//Sbr-Jo M3928
            column(DueDate; FORMAT("Due Date", 0, DateFormat))
            {
            }
            column(FormattedDueDate;ExtensionFunctions.getFormattedDate("Due Date")){}//Sbr-Jo M3928
            column(ExptRecptDt_PurchaseHeader; FORMAT("Expected Receipt Date", 0, DateFormat))
            {
            }
            column(FormattedExptRecptDt_PurchHeader;ExtensionFunctions.getFormattedDate("Expected Receipt Date")){}//Sbr-Jo M3928
            column(OrderDate_PurchaseHeader; FORMAT("Order Date", 0, DateFormat))
            {
            }
            column(FormattedorderDate_PurchHeader;ExtensionFunctions.getFormattedDate("Order Date")){}//Sbr-Jo M3928
            column(VATNoText; VATNoText)
            {
            }
            column(VATRegNo_PurchHeader; "VAT Registration No.")
            {
            }
            column(PurchaserText; PurchaserText)
            {
            }
            column(SalesPurchPersonName; SalespersonPurchaser.Name)
            {
            }
            column(ReferenceText; ReferenceText)
            {
            }
            column(YourRef_PurchHeader; "Your Reference")
            {
            }
            column(BuyFrmVendNo_PurchHeader; "Buy-from Vendor No.")
            {
            }
            column(BuyFromAddr1; BuyFromAddr[1])
            {
            }
            column(BuyFromAddr2; BuyFromAddr[2])
            {
            }
            column(BuyFromAddr3; BuyFromAddr[3])
            {
            }
            column(BuyFromAddr4; BuyFromAddr[4])
            {
            }
            column(BuyFromAddr5; BuyFromAddr[5])
            {
            }
            column(BuyFromAddr6; BuyFromAddr[6])
            {
            }
            column(BuyFromAddr7; BuyFromAddr[7])
            {
            }
            column(BuyFromAddr8; BuyFromAddr[8])
            {
            }
            column(PricesIncludingVAT_Lbl; PricesIncludingVATCaptionLbl)
            {
            }
            column(PricesInclVAT_PurchHeader; "Prices Including VAT")
            {
            }
            column(OutputNo; OutputNo)
            {
            }
            column(VATBaseDisc_PurchHeader; "VAT Base Discount %")
            {
            }
            column(PricesInclVATtxt; PricesInclVATtxtLbl)
            {
            }
            column(PaymentTermsDesc; PaymentTerms.Description)
            {
            }
            column(ShipmentMethodDesc; ShipmentMethod.Description)
            {
            }
            column(PrepmtPaymentTermsDesc; PrepmtPaymentTerms.Description)
            {
            }
            column(DimText; DimText)
            {
            }
            column(OrderNo_Lbl; OrderNoCaptionLbl)
            {
            }
            column(Page_Lbl; PageCaptionLbl)
            {
            }
            column(DocumentDate_Lbl; DocumentDateCaptionLbl)
            {
            }
            column(BuyFrmVendNo_PurchHeader_Lbl; FIELDCAPTION("Buy-from Vendor No."))
            {
            }
            column(PricesInclVAT_PurchHeader_Lbl; FIELDCAPTION("Prices Including VAT"))
            {
            }
            column(Receiveby_Lbl; ReceivebyCaptionLbl)
            {
            }
            column(Buyer_Lbl; BuyerCaptionLbl)
            {
            }
            column(PayToVendNo_PurchHeader; "Pay-to Vendor No.")
            {
            }
            column(VendAddr8; VendAddr[8])
            {
            }
            column(VendAddr7; VendAddr[7])
            {
            }
            column(VendAddr6; VendAddr[6])
            {
            }
            column(VendAddr5; VendAddr[5])
            {
            }
            column(VendAddr4; VendAddr[4])
            {
            }
            column(VendAddr3; VendAddr[3])
            {
            }
            column(VendAddr2; VendAddr[2])
            {
            }
            column(VendAddr1; VendAddr[1])
            {
            }
            column(PaymentDetails_Lbl; PaymentDetailsCaptionLbl)
            {
            }
            column(VendNo_Lbl; VendNoCaptionLbl)
            {
            }
            column(SellToCustNo_PurchHeader; "Sell-to Customer No.")
            {
            }
            column(ShipToAddr1; ShipToAddr[1])
            {
            }
            column(ShipToAddr2; ShipToAddr[2])
            {
            }
            column(ShipToAddr3; ShipToAddr[3])
            {
            }
            column(ShipToAddr4; ShipToAddr[4])
            {
            }
            column(ShipToAddr5; ShipToAddr[5])
            {
            }
            column(ShipToAddr6; ShipToAddr[6])
            {
            }
            column(ShipToAddr7; ShipToAddr[7])
            {
            }
            column(ShipToAddr8; ShipToAddr[8])
            {
            }
            column(ShiptoAddress_Lbl; ShiptoAddressCaptionLbl)
            {
            }
            column(SellToCustNo_PurchHeader_Lbl; FIELDCAPTION("Sell-to Customer No."))
            {
            }
            column(ItemNumber_Lbl; ItemNumberCaptionLbl)
            {
            }
            column(ItemDescription_Lbl; ItemDescriptionCaptionLbl)
            {
            }
            column(ItemQuantity_Lbl; ItemQuantityCaptionLbl)
            {
            }
            column(ItemUnit_Lbl; ItemUnitCaptionLbl)
            {
            }
            column(ItemUnitPrice_Lbl; ItemUnitPriceCaptionLbl)
            {
            }
            column(ItemLineAmount_Lbl; ItemLineAmountCaptionLbl)
            {
            }
            column(ToCaption_Lbl; ToCaptionLbl)
            {
            }
            column(VendorIDCaption_Lbl; VendorIDCaptionLbl)
            {
            }
            column(ConfirmToCaption_Lbl; ConfirmToCaptionLbl)
            {
            }
            column(PurchOrderCaption_Lbl; PurchOrderCaptionLbl)
            {
            }
            column(PurchOrderNumCaption_Lbl; PurchOrderNumCaptionLbl)
            {
            }
            column(PurchOrderDateCaption_Lbl; PurchOrderDateCaptionLbl)
            {
            }
            column(TaxIdentTypeCaption_Lbl; TaxIdentTypeCaptionLbl)
            {
            }
            column(InvoiceDiscountCaption_Lbl; InvoiceDiscountCaptionLbl)
            {
            }
            column(TotalPriceCaption_Lbl; TotalPriceCaptionLbl)
            {
            }
            column(TotalTaxLabel; TotalTaxLabel)
            {
            }
            column(Tax_Lbl; TaxLbl)
            {
            }
            column(OrderDate_Lbl; OrderDateLbl)
            {
            }
            column(VendorInvoiceNo_Lbl; VendorInvoiceNoLbl)
            {
            }
            column(VendorInvoiceNo; "Vendor Invoice No.")
            {
            }
            column(VendorOrderNo_Lbl; VendorOrderNoLbl)
            {
            }
            column(VendorOrderNo; "Vendor Order No.")
            {
            }
            column(Buy_from_Contact; "Buy-from Contact")
            {
            }
            column(BuyFromPhoneNo; BuyFromPhoneNo) { } //SBR-Jo
            column(BuyFromFaxNo; BuyFromFaxNo) { } //END SBR-Jo


            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("No.");
                DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.");
                column(LineNo_PurchLine; "Line No.")
                {
                }
                column(AllowInvDisctxt; AllowInvDisctxt)
                {
                }
                column(Type_PurchLine; FORMAT(Type, 0, 2))
                {
                }
                column(No_PurchLine; "No.")
                {
                }
                column(Desc_PurchLine; Description)
                {
                }
                column(Qty_PurchLine; FormattedQuanitity)
                {
                }
                column(UOM_PurchLine; "Unit of Measure")
                {
                }               
                column(DirUnitCost_PurchLine; FormattedDirectUnitCost)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 2;
                }
                column(LineDisc_PurchLine; "Line Discount %")
                {
                }
                column(LineAmt_PurchLine; "Line Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(AllowInvDisc_PurchLine; "Allow Invoice Disc.")
                {
                }
                column(VATIdentifier_PurchLine; "VAT Identifier")
                {
                }
                column(InvDiscAmt_PurchLine; -"Inv. Discount Amount")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalInclVAT; "Line Amount" - "Inv. Discount Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(DirectUniCost_Lbl; DirectUniCostCaptionLbl)
                {
                }
                column(PurchLineLineDisc_Lbl; PurchLineLineDiscCaptionLbl)
                {
                }
                column(VATDiscountAmount_Lbl; VATDiscountAmountCaptionLbl)
                {
                }
                column(No_PurchLine_Lbl; FIELDCAPTION("No."))
                {
                }
                column(Desc_PurchLine_Lbl; FIELDCAPTION(Description))
                {
                }
                column(Qty_PurchLine_Lbl; FIELDCAPTION(Quantity))
                {
                }
                column(UOM_PurchLine_Lbl; ItemUnitOfMeasureCaptionLbl)
                {
                }
                column(VATIdentifier_PurchLine_Lbl; FIELDCAPTION("VAT Identifier"))
                {
                }
                column(AmountIncludingVAT; UnitPrice_PurchLine) //GRALE01 - Change
                {
                }
                column(LineAmtTaxAmtInvDiscountAmt; "Line Amount" + TaxAmount - "Inv. Discount Amount")
                {
                }
                column(UnitPrice_PurchLine; "Unit Price (LCY)")
                {
                }
                column(UnitPrice_PurchLine_Lbl; UnitPriceLbl)
                {
                }
                column(JobNo_PurchLine; "Job No.")
                {
                }
                column(JobNo_PurchLine_Lbl; JobNoLbl)
                {
                }
                column(JobTaskNo_PurchLine; "Job Task No.")
                {
                }
                column(JobTaskNo_PurchLine_Lbl; JobTaskNoLbl)
                {
                }
                column(LineAmtFixed; LineAmtFixed) { }//Sbr-Jo
                column(DirUnitCostFixed; DirUnitCostFixed) { }//Sbr-Jo M3824
                column(ExptRecptDt_PurchaseLine; FORMAT("Expected Receipt Date", 0, DateFormat)){} //GRALE01 - Add

                trigger OnAfterGetRecord();
                var
                    tempDec: Decimal;
                begin
                    LineAmtFixed := '';//Sbr-Jo
                    if ("Line Amount" <> 0) AND (Quantity <> 0) then
                        LineAmtFixed := FORMAT("Line Amount", 0, '<Precision,2:2><Standard Format,2>');
                    DirUnitCostFixed := '';
                    if ("Direct Unit Cost" <> 0) AND (Quantity <> 0) then
                        DirUnitCostFixed := FORMAT("Direct Unit Cost", 0, '<Precision,2:2><Standard Format,2>');//End SBr-Jo
                    AllowInvDisctxt := FORMAT("Allow Invoice Disc.");
                    TotalSubTotal += "Line Amount";
                    TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
                    TotalAmount += Amount;
                    if "Cross-Reference No." <> '' then
                        "No." := "Cross-Reference No.";

                    FormatDocument.SetPurchaseLine("Purchase Line", FormattedQuanitity, FormattedDirectUnitCost);

                    OnLineNumber := OnLineNumber + 1;

                    if ("Purchase Header"."Tax Area Code" <> '') and not UseExternalTaxEngine then
                        SalesTaxCalc.AddPurchLine("Purchase Line");

                    if Type = 0 then begin
                        "Unit of Measure" := '';
                        "Line Amount" := 0;
                        "Inv. Discount Amount" := 0;                       
                        Quantity := 0;
                        //GRALE01 - Add Start
                        UnitPrice_PurchLine := '';
                        //GRALE01 - Add End
                    end else
                    begin
                        //GRALE01 - Add Start
                        FormattedDirectUnitCost := '$ ' + FormattedDirectUnitCost;
                        UnitPrice_PurchLine := '$ ' + FORMAT("Amount Including VAT",0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                        //GRALE01 - Add End 
                    end;

                    if OnLineNumber = NumberOfLines then
                        if "Purchase Header"."Tax Area Code" <> '' then begin
                            if UseExternalTaxEngine then
                                SalesTaxCalc.CallExternalTaxEngineForPurch("Purchase Header", true)
                            else
                                SalesTaxCalc.EndSalesTaxCalculation(UseDate);
                            SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
                            BrkIdx := 0;
                            PrevPrintOrder := 0;
                            PrevTaxPercent := 0;
                            TaxAmount := 0;

                            TempSalesTaxAmtLine.RESET;
                            TempSalesTaxAmtLine.SETCURRENTKEY("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
                            if TempSalesTaxAmtLine.FIND('-') then
                                repeat
                                    if (TempSalesTaxAmtLine."Print Order" = 0) or
                                       (TempSalesTaxAmtLine."Print Order" <> PrevPrintOrder) or
                                       (TempSalesTaxAmtLine."Tax %" <> PrevTaxPercent)
                                    then begin
                                        BrkIdx := BrkIdx + 1;
                                        if BrkIdx > 1 then begin
                                            if TaxArea."Country/Region" = TaxArea."Country/Region"::CA then
                                                BreakdownTitle := TaxBreakdownLbl
                                            else
                                                BreakdownTitle := SalesTaxBreakdownLbl;
                                        end;
                                        if BrkIdx > ARRAYLEN(BreakdownAmt) then begin
                                            BrkIdx := BrkIdx - 1;
                                            BreakdownLabel[BrkIdx] := OtherTaxesLbl;
                                        end else
                                            BreakdownLabel[BrkIdx] := STRSUBSTNO(TempSalesTaxAmtLine."Print Description", TempSalesTaxAmtLine."Tax %");
                                    end;
                                    BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + TempSalesTaxAmtLine."Tax Amount";
                                    TaxAmount := TaxAmount + TempSalesTaxAmtLine."Tax Amount";
                                until TempSalesTaxAmtLine.NEXT = 0;

                            if BrkIdx = 1 then begin
                                CLEAR(BreakdownLabel);
                                CLEAR(BreakdownAmt);
                            end;
                        end;

                end;

                trigger OnPreDataItem();
                begin
                    NumberOfLines := COUNT;
                    OnLineNumber := 0;
                end;
            }
            dataitem(Totals; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                column(VATAmountText; TempVATAmountLine.VATAmountText)
                {
                }
                column(TotalVATAmount; VATAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATDiscountAmount; -VATDiscountAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATBaseAmount; VATBaseAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalAmountInclVAT; TotalAmountInclVAT)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalInclVATText; TotalInclVATText)
                {
                }
                column(TotalExclVATText; TotalExclVATText)
                {
                }
                column(TotalSubTotal; TotalSubTotalTxtVal) //GRALE01 - Change
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalInvoiceDiscountAmount; TotalInvoiceDiscountAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalAmount; TotalAmountTxtVal) //GRALE01 - Change
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalText; TotalText)
                {
                }
                column(TaxAmount; TaxAmountTxtVal) //GRALE01 - Change
                {
                }

                trigger OnAfterGetRecord();
                var
                    TempPrepmtPurchLine: Record "Purchase Line" temporary;
                begin
                    CLEAR(TempPurchLine);
                    CLEAR(PurchPost);
                    TempPurchLine.DELETEALL;
                    TempVATAmountLine.DELETEALL;
                    PurchPost.GetPurchLines("Purchase Header", TempPurchLine, 0);
                    TempPurchLine.CalcVATAmountLines(0, "Purchase Header", TempPurchLine, TempVATAmountLine);
                    TempPurchLine.UpdateVATOnLines(0, "Purchase Header", TempPurchLine, TempVATAmountLine);
                    VATAmount := TempVATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := TempVATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      TempVATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code", "Purchase Header"."Prices Including VAT");
                    TotalAmountInclVAT := TempVATAmountLine.GetTotalAmountInclVAT;

                    TempPrepaymentInvLineBuffer.DELETEALL;
                    PurchasePostPrepayments.GetPurchLines("Purchase Header", 0, TempPrepmtPurchLine);
                    if not TempPrepmtPurchLine.ISEMPTY then begin
                        PurchasePostPrepayments.GetPurchLinesToDeduct("Purchase Header", TempPurchLine);
                        if not TempPurchLine.ISEMPTY then
                            PurchasePostPrepayments.CalcVATAmountLines("Purchase Header", TempPurchLine, TempPrePmtVATAmountLineDeduct, 1);
                    end;
                    PurchasePostPrepayments.CalcVATAmountLines("Purchase Header", TempPrepmtPurchLine, TempPrepmtVATAmountLine, 0);
                    TempPrepmtVATAmountLine.DeductVATAmountLine(TempPrePmtVATAmountLineDeduct);
                    PurchasePostPrepayments.UpdateVATOnLines("Purchase Header", TempPrepmtPurchLine, TempPrepmtVATAmountLine, 0);
                    PurchasePostPrepayments.BuildInvLineBuffer2("Purchase Header", TempPrepmtPurchLine, 0, TempPrepaymentInvLineBuffer);
                    PrepmtVATAmount := TempPrepmtVATAmountLine.GetTotalVATAmount;
                    PrepmtVATBaseAmount := TempPrepmtVATAmountLine.GetTotalVATBase;
                    PrepmtTotalAmountInclVAT := TempPrepmtVATAmountLine.GetTotalAmountInclVAT;

                    TotalAmount := TotalSubTotal + TotalInvoiceDiscountAmount + TaxAmount;

                    //GRALE01 - Add Start
                    TotalSubTotalTxtVal := '$ ' + FORMAT(TotalSubTotal, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                    TaxAmountTxtVal := '$ ' + FORMAT(TaxAmount, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                    TotalAmountTxtVal := '$ ' + FORMAT(TotalAmount, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                    //GRALE01 - Add End
                end;
            }
            dataitem(TaxBreakdown; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                column(BreakdownTitle; BreakdownTitle)
                {
                }
                column(BreakdownLabel1; BreakdownLabel[1])
                {
                }
                column(BreakdownAmt1; FormatBreakdownAmounts(BreakdownLabel[1], BreakdownAmt[1]))
                {
                }
                column(BreakdownLabel2; BreakdownLabel[2])
                {
                }
                column(BreakdownAmt2; FormatBreakdownAmounts(BreakdownLabel[2], BreakdownAmt[2]))
                {
                }
                column(BreakdownLabel3; BreakdownLabel[3])
                {
                }
                column(BreakdownAmt3; FormatBreakdownAmounts(BreakdownLabel[3], BreakdownAmt[3]))
                {
                }
                column(BreakdownAmt4; FormatBreakdownAmounts(BreakdownLabel[4], BreakdownAmt[4]))
                {
                }
                column(BreakdownLabel4; BreakdownLabel[4])
                {
                }
            }
            dataitem(VATCounter; "Integer")
            {
                DataItemTableView = SORTING (Number);
                column(VATAmtLineVATBase; TempVATAmountLine."VAT Base")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineVATAmt; TempVATAmountLine."VAT Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineLineAmt; TempVATAmountLine."Line Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineInvDiscBaseAmt; TempVATAmountLine."Inv. Disc. Base Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineInvDiscAmt; TempVATAmountLine."Invoice Discount Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmtLineVAT; TempVATAmountLine."VAT %")
                {
                    DecimalPlaces = 0 : 5;
                }
                column(VATAmtLineVATIdentifier; TempVATAmountLine."VAT Identifier")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    TempVATAmountLine.GetLine(Number);
                end;

                trigger OnPreDataItem();
                begin
                    if VATAmount = 0 then
                        CurrReport.BREAK;
                    SETRANGE(Number, 1, TempVATAmountLine.COUNT);
                    CurrReport.CREATETOTALS(
                      TempVATAmountLine."Line Amount", TempVATAmountLine."Inv. Disc. Base Amount",
                      TempVATAmountLine."Invoice Discount Amount", TempVATAmountLine."VAT Base", TempVATAmountLine."VAT Amount");
                end;
            }
            dataitem(VATCounterLCY; "Integer")
            {
                DataItemTableView = SORTING (Number);
                column(VALExchRate; VALExchRate)
                {
                }
                column(VALSpecLCYHeader; VALSpecLCYHeader)
                {
                }
                column(VALVATAmountLCY; VALVATAmountLCY)
                {
                    AutoFormatType = 1;
                }
                column(VALVATBaseLCY; VALVATBaseLCY)
                {
                    AutoFormatType = 1;
                }

                trigger OnAfterGetRecord();
                begin
                    TempVATAmountLine.GetLine(Number);
                    VALVATBaseLCY :=
                      TempVATAmountLine.GetBaseLCY(
                        "Purchase Header"."Posting Date", "Purchase Header"."Currency Code", "Purchase Header"."Currency Factor");
                    VALVATAmountLCY :=
                      TempVATAmountLine.GetAmountLCY(
                        "Purchase Header"."Posting Date", "Purchase Header"."Currency Code", "Purchase Header"."Currency Factor");
                end;

                trigger OnPreDataItem();
                begin
                    if (not GLSetup."Print VAT specification in LCY") or
                       ("Purchase Header"."Currency Code" = '') or
                       (TempVATAmountLine.GetTotalVATAmount = 0)
                    then
                        CurrReport.BREAK;

                    SETRANGE(Number, 1, TempVATAmountLine.COUNT);

                    if GLSetup."LCY Code" = '' then
                        VALSpecLCYHeader := VATAmountSpecificationLbl + LocalCurrentyLbl
                    else
                        VALSpecLCYHeader := VATAmountSpecificationLbl + FORMAT(GLSetup."LCY Code");

                    CurrExchRate.FindCurrency("Purchase Header"."Posting Date", "Purchase Header"."Currency Code", 1);
                    VALExchRate := STRSUBSTNO(ExchangeRateLbl, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                end;
            }
            dataitem(PrepmtLoop; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                column(PrepmtLineAmount; PrepmtLineAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtInvBufGLAccNo; TempPrepaymentInvLineBuffer."G/L Account No.")
                {
                }
                column(PrepmtInvBufDesc; TempPrepaymentInvLineBuffer.Description)
                {
                }
                column(TotalInclVATText2; TotalInclVATText)
                {
                }
                column(TotalExclVATText2; TotalExclVATText)
                {
                }
                column(PrepmtInvBufAmt; TempPrepaymentInvLineBuffer.Amount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATAmountText; TempPrepmtVATAmountLine.VATAmountText)
                {
                }
                column(PrepmtVATAmount; PrepmtVATAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtTotalAmountInclVAT; PrepmtTotalAmountInclVAT)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATBaseAmount; PrepmtVATBaseAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtInvBuDescCaption; PrepmtInvBuDescCaptionLbl)
                {
                }
                column(PrepmtInvBufGLAccNoCaption; PrepmtInvBufGLAccNoCaptionLbl)
                {
                }
                column(PrepaymentSpecCaption; PrepaymentSpecCaptionLbl)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    if Number = 1 then begin
                        if not TempPrepaymentInvLineBuffer.FIND('-') then
                            CurrReport.BREAK;
                    end else
                        if TempPrepaymentInvLineBuffer.NEXT = 0 then
                            CurrReport.BREAK;

                    if "Purchase Header"."Prices Including VAT" then
                        PrepmtLineAmount := TempPrepaymentInvLineBuffer."Amount Incl. VAT"
                    else
                        PrepmtLineAmount := TempPrepaymentInvLineBuffer.Amount;
                end;
            }
            dataitem(PrepmtVATCounter; "Integer")
            {
                DataItemTableView = SORTING (Number);
                column(PrepmtVATAmtLineVATAmt; TempPrepmtVATAmountLine."VAT Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATAmtLineVATBase; TempPrepmtVATAmountLine."VAT Base")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATAmtLineLineAmt; TempPrepmtVATAmountLine."Line Amount")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(PrepmtVATAmtLineVAT; TempPrepmtVATAmountLine."VAT %")
                {
                    DecimalPlaces = 0 : 5;
                }
                column(PrepmtVATAmtLineVATId; TempPrepmtVATAmountLine."VAT Identifier")
                {
                }
                column(PrepymtVATAmtSpecCaption; PrepymtVATAmtSpecCaptionLbl)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    TempPrepmtVATAmountLine.GetLine(Number);
                end;

                trigger OnPreDataItem();
                begin
                    SETRANGE(Number, 1, TempPrepmtVATAmountLine.COUNT);
                end;
            }
            dataitem(LetterText; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                column(GreetingText; GreetingLbl)
                {
                }
                column(BodyText; BodyLbl)
                {
                }
                column(ClosingText; ClosingLbl)
                {
                }
            }

            //GRALE01 - Note:trigger
            //This is the trigger for Purchace Header
            trigger OnAfterGetRecord();
            var
                Vendor: Record Vendor;
            begin
                TotalAmount := 0;
                TotalSubTotal := 0;
                TaxAmount := 0;
                TotalInvoiceDiscountAmount := 0;
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                CLEAR(BreakdownTitle);
                CLEAR(BreakdownLabel);
                CLEAR(BreakdownAmt);

                FormatAddressFields("Purchase Header");
                FormatDocumentFields("Purchase Header");

                if not CurrReport.PREVIEW then begin
                    CODEUNIT.RUN(CODEUNIT::"Purch.Header-Printed", "Purchase Header");
                    if ArchiveDocument then
                        ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);

                    if LogInteraction then
                        SegManagement.LogDocument(
                          13, "No.", 0, 0, DATABASE::Vendor, "Buy-from Vendor No.",
                          "Purchaser Code", '', "Posting Description", '');
                end;

                TotalTaxLabel := TaxLbl;
                if "Tax Area Code" <> '' then begin
                    TaxArea.GET("Tax Area Code");
                    case TaxArea."Country/Region" of
                        TaxArea."Country/Region"::US:
                            TotalTaxLabel := TotalSalesTaxLbl;
                        TaxArea."Country/Region"::CA:
                            TotalTaxLabel := TotalTaxLbl;
                    end;
                    UseExternalTaxEngine := TaxArea."Use External Tax Engine";
                    SalesTaxCalc.StartSalesTaxCalculation;
                end;

                if "Posting Date" <> 0D then
                    UseDate := "Posting Date"
                else
                    UseDate := WORKDATE;

                //SBR-Jo PO Changes
                BuyFromFaxNo := '';
                BuyFromPhoneNo := '';
                Vendor.SetRange("No.", "Purchase Header"."Buy-from Vendor No.");
                IF Vendor.FindFirst() then begin
                    BuyFromPhoneNo := Vendor."Phone No.";
                    BuyFromFaxNo := Vendor."Fax No.";
                end;
                //END SBR-JO Po Changes

                //GRALE01 - Add Start
                IF "Currency Code" <> '' then
                     TotalCaptionTxt:= StrSubstNo('Total (%1)', "Currency Code")
                Else
                    TotalCaptionTxt := 'Total';
                //GRALE01 - Add End
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
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU = 'Archive Document',
                                    ESM = 'Archivar documento',
                                    FRC = 'Archiver document',
                                    ENC = 'Archive Document';
                        ToolTipML = ENU = 'Specifies whether to archive the order.',
                                    ESM = 'Especifica si debe archivarse el pedido.',
                                    FRC = 'Spécifie s''il faut archiver la commande ou non.',
                                    ENC = 'Specifies whether to archive the order.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU = 'Log Interaction',
                                    ESM = 'Log interacción',
                                    FRC = 'Journal interaction',
                                    ENC = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTipML = ENU = 'Specifies if you want to log this interaction.',
                                    ESM = 'Especifica si desea registrar esta interacción.',
                                    FRC = 'Spécifie si vous souhaitez enregistrer cette interaction.',
                                    ENC = 'Specifies if you want to log this interaction.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            LogInteractionEnable := true;
            ArchiveDocument := PurchSetup."Archive Quotes and Orders";
        end;

        trigger OnOpenPage();
        begin
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
        CompanyInfo.GET;
        PurchSetup.GET;
        CompanyInfo.CALCFIELDS(Picture);
        DateFormat := 0;
    end;

    trigger OnPreReport();
    begin
        if not CurrReport.USEREQUESTPAGE then
            InitLogInteraction;
    end;

    var
        DateFormat: Integer;
        PageLbl: TextConst Comment = '%1 = Page No.', ENU = 'Page %1', ESM = 'Página %1', FRC = 'Page %1', ENC = 'Page %1';
        VATAmountSpecificationLbl: TextConst ENU = 'Tax Amount Specification in ', ESM = 'Especificación de importe de IVA en ', FRC = 'Détail TVA dans ', ENC = 'Tax Amount Specification in ';
        LocalCurrentyLbl: TextConst ENU = 'Local Currency', ESM = 'Divisa local', FRC = 'Devise locale', ENC = 'Local Currency';
        ExchangeRateLbl: TextConst Comment = '%1 = CurrExchRate."Relational Exch. Rate Amount", %2 = CurrExchRate."Exchange Rate Amount"', ENU = 'Exchange rate: %1/%2', ESM = 'Tipo cambio: %1/%2', FRC = 'Taux de change : %1/%2', ENC = 'Exchange rate: %1/%2';
        CompanyInfoPhoneNoCaptionLbl: TextConst ENU = 'Phone No.', ESM = 'N.º teléfono', FRC = 'N° téléphone', ENC = 'Phone No.';
        CompanyInfoGiroNoCaptionLbl: TextConst ENU = 'Giro No.', ESM = 'N.º giro postal', FRC = 'N° CCP', ENC = 'Giro No.';
        CompanyInfoBankNameCaptionLbl: TextConst ENU = 'Bank', ESM = 'Banco', FRC = 'Banque', ENC = 'Bank';
        CompanyInfoBankAccNoCaptionLbl: TextConst ENU = 'Account No.', ESM = 'Nº cuenta', FRC = 'N° compte', ENC = 'Account No.';
        OrderNoCaptionLbl: TextConst ENU = 'Order No.', ESM = 'Nº pedido', FRC = 'N° commande', ENC = 'Order No.';
        PageCaptionLbl: TextConst ENU = 'Page', ESM = 'Página', FRC = 'Page', ENC = 'Page';
        DocumentDateCaptionLbl: TextConst ENU = 'Document Date', ESM = 'Fecha de documento', FRC = 'Date document', ENC = 'Document Date';
        DirectUniCostCaptionLbl: TextConst ENU = 'Unit Price', ESM = 'Precio unitario', FRC = 'Prix unitaire', ENC = 'Unit Price';
        PurchLineLineDiscCaptionLbl: TextConst ENU = 'Discount %', ESM = '% Descuento', FRC = '% escompte', ENC = 'Discount %';
        VATDiscountAmountCaptionLbl: TextConst ENU = 'Payment Discount on Tax', ESM = 'Descuento P.P. sobre IVA', FRC = 'Escompte de paiement sur TVA', ENC = 'Payment Discount on Tax';
        PaymentDetailsCaptionLbl: TextConst ENU = 'Payment Details', ESM = 'Detalles del pago', FRC = 'Détail paiement', ENC = 'Payment Details';
        VendNoCaptionLbl: TextConst ENU = 'Vendor No.', ESM = 'N.º proveedor', FRC = 'N° fournisseur', ENC = 'Vendor No.';
        ShiptoAddressCaptionLbl: TextConst ENU = 'Ship-to Address', ESM = 'Dirección de envío', FRC = 'Adresse de livraison', ENC = 'Ship-to Address';
        PrepmtInvBuDescCaptionLbl: TextConst ENU = 'Description', ESM = 'Descripción', FRC = 'Description', ENC = 'Description';
        PrepmtInvBufGLAccNoCaptionLbl: TextConst ENU = 'G/L Account No.', ESM = 'Nº cuenta', FRC = 'N° de compte du grand livre', ENC = 'G/L Account No.';
        PrepaymentSpecCaptionLbl: TextConst ENU = 'Prepayment Specification', ESM = 'Especificación anticipo', FRC = 'Spécification de paiement anticipé', ENC = 'Prepayment Specification';
        PrepymtVATAmtSpecCaptionLbl: TextConst ENU = 'Prepayment Tax Amount Specification', ESM = 'Especificación importe IVA anticipo', FRC = 'Spécification du montant de TVA du paiement anticipé', ENC = 'Prepayment Tax Amount Specification';
        AmountCaptionLbl: TextConst ENU = 'Amount', ESM = 'Importe', FRC = 'Montant', ENC = 'Amount';
        PurchLineInvDiscAmtCaptionLbl: TextConst ENU = 'Invoice Discount Amount', ESM = 'Importe descuento en factura', FRC = 'Montant d''escompte de la facture', ENC = 'Invoice Discount Amount';
        SubtotalCaptionLbl: TextConst ENU = 'Subtotal', ESM = 'Subtotal', FRC = 'Sous-total', ENC = 'Subtotal';
        VATAmtLineVATCaptionLbl: TextConst ENU = 'Tax %', ESM = '% IVA', FRC = '% TVA', ENC = 'Tax %';
        VATAmtLineVATAmtCaptionLbl: TextConst ENU = 'Tax Amount', ESM = 'Importe IVA', FRC = 'Montant TVA', ENC = 'Tax Amount';
        VATAmtSpecCaptionLbl: TextConst ENU = 'Tax Amount Specification', ESM = 'Especificación importe IVA', FRC = 'Détail montant TVA', ENC = 'Tax Amount Specification';
        VATIdentifierCaptionLbl: TextConst ENU = 'Tax Identifier', ESM = 'Identific. IVA', FRC = 'Identificateur de TVA', ENC = 'Tax Identifier';
        VATAmtLineInvDiscBaseAmtCaptionLbl: TextConst ENU = 'Invoice Discount Base Amount', ESM = 'Importe base descuento factura', FRC = 'Montant de base d''escompte de la facture', ENC = 'Invoice Discount Base Amount';
        VATAmtLineLineAmtCaptionLbl: TextConst ENU = 'Line Amount', ESM = 'Importe de línea', FRC = 'Montant ligne', ENC = 'Line Amount';
        VALVATBaseLCYCaptionLbl: TextConst ENU = 'Tax Base', ESM = 'Base IVA', FRC = 'Base TVA', ENC = 'Tax Base';
        PricesInclVATtxtLbl: TextConst ENU = 'Prices Including Tax', ESM = 'Precios IVA incluido', FRC = 'Prix TTC', ENC = 'Prices Including Tax';
        TotalCaptionLbl: TextConst ENU = 'Total (%1)', ESM = 'Total (%1)', FRC = 'Total (%1)', ENC = 'Total (%1)'; //GRALE01 - Change
        PaymentTermsDescCaptionLbl: TextConst ENU = 'Payment Terms', ESM = 'Condiciones de pago', FRC = 'Modalités de paiement', ENC = 'Payment Terms';
        ShipmentMethodDescCaptionLbl: TextConst ENU = 'Shipment Method', ESM = 'Método de envío', FRC = 'Méthode de livraison', ENC = 'Shipment Method';
        PrepymtTermsDescCaptionLbl: TextConst ENU = 'Prepmt. Payment Terms', ESM = 'Términos prepago', FRC = 'Modalités de paiement anticipé', ENC = 'Prepmt. Payment Terms';
        HomePageCaptionLbl: TextConst ENU = 'Home Page', ESM = 'Página Web', FRC = 'Page d''accueil', ENC = 'Home Page';
        EmailIDCaptionLbl: TextConst ENU = 'Email', ESM = 'Correo electrónico', FRC = 'Courriel', ENC = 'Email';
        AllowInvoiceDiscCaptionLbl: TextConst ENU = 'Allow Invoice Discount', ESM = 'Permitir descuento factura', FRC = 'Autoriser escompte facture', ENC = 'Allow Invoice Discount';
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PrepmtPaymentTerms: Record "Payment Terms";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        TempPrepmtVATAmountLine: Record "VAT Amount Line" temporary;
        TempPurchLine: Record "Purchase Line" temporary;
        TempPrepaymentInvLineBuffer: Record "Prepayment Inv. Line Buffer" temporary;
        TempPrePmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
        TaxArea: Record "Tax Area";
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        CurrExchRate: Record "Currency Exchange Rate";
        PurchSetup: Record "Purchases & Payables Setup";
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        PurchPost: Codeunit "Purch.-Post";
        SegManagement: Codeunit SegManagement;
        PurchasePostPrepayments: Codeunit "Purchase-Post Prepayments";
        ArchiveManagement: Codeunit ArchiveManagement;
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        BuyFromAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        FormattedQuanitity: Text;
        FormattedDirectUnitCost: Text;
        OutputNo: Integer;
        DimText: Text[120];
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        AllowInvDisctxt: Text[30];
        
        //GRALE01 - Add Start
        TotalCaptionTxt: Text[30]; 
        UnitPrice_PurchLine: Text;
        TotalSubTotalTxtVal: Text;
        TaxAmountTxtVal: Text;
        TotalAmountTxtVal: Text;
        //GRALE01 - Add End

        [InDataSet]
        LogInteractionEnable: Boolean;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        DocumentTitleLbl: TextConst ENU = 'Purchase Order', ESM = 'Pedido compra', FRC = 'Bon de commande', ENC = 'Purchase Order';
        TaxAmount: Decimal;
        CompanyLogoPosition: Integer;
        ReceivebyCaptionLbl: TextConst ENU = 'Receive By', ESM = 'Recepción por', FRC = 'Réceptionner par', ENC = 'Receive By';
        BuyerCaptionLbl: TextConst ENU = 'Buyer', ESM = 'Comprador', FRC = 'Acheteur', ENC = 'Buyer';
        ItemNumberCaptionLbl: TextConst ENU = 'Item No.', ESM = 'N.º producto', FRC = 'N° article', ENC = 'Item No.';
        ItemDescriptionCaptionLbl: TextConst ENU = 'Description', ESM = 'Descripción', FRC = 'Description', ENC = 'Description';
        ItemQuantityCaptionLbl: TextConst ENU = 'Quantity', ESM = 'Cantidad', FRC = 'Quantité', ENC = 'Quantity';
        ItemUnitCaptionLbl: TextConst ENU = 'Unit', ESM = 'Unidad', FRC = 'Unité', ENC = 'Unit';
        ItemUnitPriceCaptionLbl: TextConst ENU = 'Unit Price', ESM = 'Precio unitario', FRC = 'Prix unitaire', ENC = 'Unit Price';
        ItemLineAmountCaptionLbl: TextConst ENU = 'Line Amount', ESM = 'Importe de línea', FRC = 'Montant ligne', ENC = 'Line Amount';
        PricesIncludingVATCaptionLbl: TextConst ENU = 'Prices Including Tax', ESM = 'Precios IVA incluido', FRC = 'Prix TTC', ENC = 'Prices Including Tax';
        ItemUnitOfMeasureCaptionLbl: TextConst ENU = 'Unit', ESM = 'Unidad', FRC = 'Unité', ENC = 'Unit';
        ToCaptionLbl: TextConst ENU = 'To:', ESM = 'Para:', FRC = '‡ :', ENC = 'To:';
        VendorIDCaptionLbl: TextConst ENU = 'Vendor ID', ESM = 'Id. de proveedor', FRC = 'Code fournisseur', ENC = 'Vendor ID';
        ConfirmToCaptionLbl: TextConst ENU = 'Confirm To', ESM = 'Confirmar a', FRC = 'Confirmer à', ENC = 'Confirm To';
        PurchOrderCaptionLbl: TextConst ENU = 'PURCHASE ORDER', ESM = 'PEDIDO DE COMPRA', FRC = 'Bon de commande', ENC = 'PURCHASE ORDER';
        PurchOrderNumCaptionLbl: TextConst ENU = 'Purchase Order Number:', ESM = 'Número de pedido de compra:', FRC = 'N° bon de commande :', ENC = 'Purchase Order Number:';
        PurchOrderDateCaptionLbl: TextConst ENU = 'Purchase Order Date:', ESM = 'Fecha de pedido de compra:', FRC = 'Date bon de commande :', ENC = 'Purchase Order Date:';
        TaxIdentTypeCaptionLbl: TextConst ENU = 'Tax Ident. Type', ESM = 'Tipo de identificación fiscal', FRC = 'Type Ident. Taxe', ENC = 'Tax Ident. Type';
        TotalPriceCaptionLbl: TextConst ENU = 'Total Price', ESM = 'Precio total', FRC = 'Prix total', ENC = 'Total Price';
        ArchiveDocument: Boolean;
        VendorOrderNoLbl: TextConst ENU = 'Vendor Order No.', ESM = 'Nº pedido proveedor', FRC = 'N° commande fournisseur', ENC = 'Vendor Order No.';
        VendorInvoiceNoLbl: TextConst ENU = 'Vendor Invoice No.', ESM = 'Nº factura proveedor', FRC = 'N° facture fournisseur', ENC = 'Vendor Invoice No.';
        InvoiceDiscountCaptionLbl: TextConst ENU = 'Invoice Discount', ESM = 'Descuento en factura', FRC = 'Escompte facture', ENC = 'Invoice Discount';
        SalesTaxBreakdownLbl: TextConst ENU = 'Sales Tax Breakdown', ESM = 'Análisis de impuesto de ventas', FRC = 'Ventilation taxe de vente', ENC = 'Sales Tax Breakdown';
        OtherTaxesLbl: TextConst ENU = 'Other Taxes', ESM = 'Otros impuestos', FRC = 'Autres taxes', ENC = 'Other Taxes';
        TotalSalesTaxLbl: TextConst ENU = 'Total Sales Tax', ESM = 'Impuesto de ventas total', FRC = 'Taxe de vente totale', ENC = 'Total Sales Tax';
        TotalTaxLbl: TextConst ENU = 'Total Tax', ESM = 'Impuestos totales', FRC = 'Taxe totale', ENC = 'Total Tax';
        TaxLbl: TextConst ENU = 'Tax', ESM = 'Impuestos', FRC = 'Taxe', ENC = 'Tax';
        TotalTaxLabel: Text[30];
        BreakdownTitle: Text[30];
        BreakdownLabel: array[4] of Text[30];
        UseExternalTaxEngine: Boolean;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        UseDate: Date;
        BrkIdx: Integer;
        PrevPrintOrder: Integer;
        PrevTaxPercent: Decimal;
        TaxBreakdownLbl: TextConst ENU = 'Tax Breakdown', ESM = 'Desglose de impuestos', FRC = 'Ventilation fiscale', ENC = 'Tax Breakdown';
        BreakdownAmt: array[4] of Decimal;
        GreetingLbl: TextConst ENU = 'Hello', ESM = 'Hola', FRC = 'Bonjour', ENC = 'Hello';
        ClosingLbl: TextConst ENU = 'Sincerely', ESM = 'Un saludo', FRC = 'Cordialement', ENC = 'Sincerely';
        BodyLbl: TextConst ENU = 'The purchase order is attached to this message.', ESM = 'El mensaje incluye un archivo adjunto con la orden de compra.', FRC = 'Le bon de commande est joint au présent message.', ENC = 'The purchase order is attached to this message.';
        OrderDateLbl: TextConst ENU = 'Order Date', ESM = 'Fecha de orden', FRC = 'Date commande', ENC = 'Order Date';
        UnitPriceLbl: TextConst ENU = 'Unit Price (LCY)', ESM = 'Precio unitario ($)', FRC = 'Prix unitaire ($)', ENC = 'Unit Price ($)';
        JobNoLbl: TextConst ENU = 'Job No.', ESM = 'N.º de trabajo', FRC = 'N° de projet', ENC = 'Job No.';
        JobTaskNoLbl: TextConst ENU = 'Job Task No.', ESM = 'N.º tarea de trabajo', FRC = 'N° de tâche projet', ENC = 'Job Task No.';
        //Sbr-Jo PO Changes
        BuyFromPhoneNo: Text[20];
        BuyFromFaxNo: Text[20];
        LineAmtFixed: Text[20];//Sbr-Jo
        DirUnitCostFixed: Text[20];//Sbr-Jo M3824
        ExtensionFunctions:Codeunit ExtensionFunctions; //m3928
        //End Sbr-Jo PO Changes

    [Scope('Personalization')]
    procedure InitializeRequest(LogInteractionParam: Boolean);
    begin
        LogInteraction := LogInteractionParam;
    end;

    local procedure FormatAddressFields(var PurchaseHeader: Record "Purchase Header");
    begin
        FormatAddr.GetCompanyAddr(PurchaseHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.PurchHeaderBuyFrom(BuyFromAddr, PurchaseHeader);
        if PurchaseHeader."Buy-from Vendor No." <> PurchaseHeader."Pay-to Vendor No." then
            FormatAddr.PurchHeaderPayTo(VendAddr, PurchaseHeader);
        FormatAddr.PurchHeaderShipTo(ShipToAddr, PurchaseHeader);
    end;

    local procedure FormatDocumentFields(PurchaseHeader: Record "Purchase Header");
    begin
        with PurchaseHeader do begin
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            FormatDocument.SetPurchaser(SalespersonPurchaser, "Purchaser Code", PurchaserText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetPaymentTerms(PrepmtPaymentTerms, "Prepmt. Payment Terms Code", "Language Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");

            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FIELDCAPTION("Your Reference"));
            VATNoText := FormatDocument.SetText("VAT Registration No." <> '', FIELDCAPTION("VAT Registration No."));
        end;
    end;

    local procedure InitLogInteraction();
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(13) <> '';
    end;

    local procedure FormatBreakdownAmounts(BreakdownLabel: Text; BreakdownAmount: Decimal): Text;
    var
        BreakdownTextAmount: Text;
    begin
        // If the breakdown label is blank, the breakdown amount should be blank too.
        // This enables the NA report layout to serve both CA and US.
        if BreakdownLabel <> '' then
            BreakdownTextAmount := FORMAT(BreakdownAmount, 0, '<Precision,2><Standard Format,0>')
        else
            BreakdownTextAmount := '';

        exit(BreakdownTextAmount);
    end;

}