codeunit 50501 "F1 - General Functions"
{
    trigger OnRun()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidate(var SL: Record "Sales Line")
    begin
    end;
}