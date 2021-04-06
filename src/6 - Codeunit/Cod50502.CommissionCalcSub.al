codeunit 50502 CommissionCalcSub
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"F1 - TabSalesInv_CommissLines", 'OnAfterValidateEvent', 'Commission (Amount)', false, false)]
    local procedure CalculateCommissionAmount(var Rec: Record "F1 - TabSalesInv_CommissLines")
    begin
        Rec."Commission (Amount)" := (Rec."Fees" * Rec."Amount (Commission Base)") / 100;
    end;

    procedure ValidateCommissionLinesFields(SL: Record "Sales Line"; Salesperson: Record "F1 - Salespersons list")
    var
        CommissionLines: Record "F1 - TabSalesInv_CommissLines";
    begin
        //if SL.Get(CommissionLines.Type, CommissionLines."Document No.", CommissionLines."Line No.") then begin
        //if CommissionLines.IsReady() then
        repeat
            //with CommissionLines do begin
            CommissionLines.Init;
            //CommissionLines.TransferFields(SL);

            CommissionLines."No." := SL."No.";
            CommissionLines.Type := SL.Type;
            CommissionLines.Description := SL.Description;
            CommissionLines.Quantity := SL.Quantity;

            CommissionLines."Salesperson Code" := Salesperson."Salesperson Code";
            CommissionLines."Salesperson Name" := Salesperson."Salesperson Name";
            CommissionLines."Role Description" := Salesperson."Role Description";
            CommissionLines.Fees := Salesperson.Fees;
            CommissionLines.Insert;
        until SL.Next() = 0;
    end;
}