table 50502 "F1 - Salespersons list"
{
    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            AutoIncrement = true;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
        }
        field(3; "Salesperson Code"; Code[10])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser".Code;

            trigger OnValidate()
            var
                Salesperson: Record "Salesperson/Purchaser";
            begin
                Salesperson.Reset();
                Salesperson.SetRange(Code, "Salesperson Code");
                if Salesperson.FindSet() then begin
                    "Salesperson Name" := Salesperson.Name;
                    Salesperson.Modify();
                end;
            end;
        }
        field(4; "Salesperson Name"; Text[100])
        {
            Caption = 'Salesperson Name';
            TableRelation = "Salesperson/Purchaser".Name;
        }
        field(5; "Role Description"; Enum "Role Description")
        {
            Caption = 'Role Description';
        }
        field(6; "% Commission"; Integer)
        {
            Caption = '% Commission';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
