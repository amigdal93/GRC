tableextension 50503 TabExtCustomer extends Customer
{
    fields
    {   // calculates how many Salespersons the customer have
        field(50501; Salespersons; Integer)
        {
            CalcFormula = Count("F1 - Salespersons list" WHERE("Customer No." = FIELD("No.")));
            Caption = 'Salespersons';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    procedure OpenSalespersonListEntries()
    var
        Salespersonlist: Record "F1 - Salespersons list";
    begin
        Salespersonlist.Reset();
        Salespersonlist.SetRange("Customer No.", "No.");
        if Salespersonlist.FindSet() then begin
            PAGE.Run(50502, Salespersonlist);
            Salespersonlist.SetCurrentKey("Customer No.");
        end else begin
            PAGE.Run(50502, Salespersonlist);
        end;
    end;
}