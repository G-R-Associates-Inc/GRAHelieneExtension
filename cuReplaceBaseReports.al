/**
* Documentation Section
*   12/16/19 - Lina El Sadek, G.R. & Associates Inc.
*   Created codeunit to replace certain reports with custom made ones
*/
/*codeunit 58001 "Replace Reports"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnAfterSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Customer/Item Statistics" then
        begin
            NewReportId := Report::"GRA Customer/Item Statistics";
            Report.Run(NewReportId);
        end;
    end;
}*/