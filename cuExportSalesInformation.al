/**
* Documentation Section
*   GRALE01 - 09/18/19 - Lina El Sadek, G.R. & Associates Inc.
            - Version Tag GRA1.02
*           - Created codeunit to expose Sales Orders and Sales Quotes throught WebServices
**/
codeunit 58000 "Export Sales Information"
{
    
    trigger OnRun()
    begin

    end;

    procedure ExportSalesHeaderInformation(var SalesInfo:XmlPort 58000; var Username:Text);
    begin
        //GRALE01 - Add Start
        SalesInfo.SetUserName(Username);
        SalesInfo.Export;
        //GRALE01 - Add End
    end;

    procedure ExportSalesLineInformation(var SalesLineInfo:XmlPort 58002; var Username:Text);
    begin
        //GRALE01 - Add Start
        SalesLineInfo.SetUserName(Username);
        SalesLineInfo.Export;
        //GRALE01 - Add End
    end;

    procedure ExportSalesStatsInfo(var SalesStatsInfo:XmlPort 58001);
    begin
        //GRALE01 - Add Start
        SalesStatsInfo.Export;
        //GRALE01 - Add End
    end;

    procedure ConnectionTest();
    begin
        //This function is to remain empyt. The Web portal will generate an exception if we call this function
        //and the credentials were wrong or the user did not have access.
    end;

    procedure IsUserAdmin(var Username:Text; var WebPortalAdmin:Boolean);
        var UserSetup_lRec:Record 91;
    begin
        //GRALE01 - Add Start
        UserSetup_lRec.Reset;
        UserSetup_lRec.SetRange("User ID", Username);
        IF UserSetup_lRec.FindFirst THEN
            WebPortalAdmin := UserSetup_lRec."Web Portal Admin"
        ELSE
            WebPortalAdmin := false;
        //GRALE01 - Add End
    end;   

}