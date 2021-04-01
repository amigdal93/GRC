tableextension 50504 TabExtSalesHeader extends "Sales Header"
{
    fields
    {
        field(50501; Salespersons; Integer)
        {
            Caption = 'Salespersons';
            //TableRelation = "F1 - Salespersons list"."No.";
            CalcFormula = Count("F1 - Salespersons list" WHERE("Customer No." = FIELD("Sell-to Customer No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }
    procedure OpenSalespersonListEntries()
    var
        Salespersonlist: Record "F1 - Salespersons list";
    begin
        Salespersonlist.Reset();
        Salespersonlist.SetRange("Customer No.", "Sell-to Customer No.");
        if Salespersonlist.FindSet() then begin
            Salespersonlist.SetCurrentKey("Customer No.");
            PAGE.Run(50502, Salespersonlist);
            //Page.RunModal(Page::"F1 - Salespersons List", Salespersonlist);
        end;
    end;
}
