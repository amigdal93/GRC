table 50501 "F1 - TabSalesPersonClientItem"
{
    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Nr.';
            //Editable = false;

        }
        field(2; "Client No."; Code[20])
        {
            Caption = 'Client nr.';
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                Customer.Reset();
                Customer.SetRange("No.", "Client No.");
                if Customer.FindSet() then begin
                    "Client Name" := Customer.Name;
                    Modify();
                end;
            end;
        }
        field(3; "Client Name"; Text[100])
        {
            Caption = 'Client name';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item nr.';
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                Item.Reset();
                Item.SetRange("No.", "Item No.");
                if Item.FindSet() then begin
                    "Item Description" := Item.Description;
                    Modify();
                end;
            end;
        }
        field(5; "Item Description"; Text[100])
        {
            Caption = 'Item description';
            TableRelation = Item.Description;
        }
        field(6; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson code';
            TableRelation = "Salesperson/Purchaser".Code;

            trigger OnValidate()
            var
                Salesperson: Record "Salesperson/Purchaser";
            begin
                Salesperson.Reset();
                Salesperson.SetRange(Code, "Salesperson Code");
                if Salesperson.FindSet() then begin
                    "Salesperson Name" := Salesperson.Name;
                    Modify();
                end;
            end;
        }
        field(7; "Salesperson Name"; Text[50])
        {
            Caption = 'Salesperson name';
            TableRelation = "Salesperson/Purchaser".Name;
        }
        field(8; "Fees"; Integer)
        {
            Caption = '% Fees';
        }
        field(9; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}