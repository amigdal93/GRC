table 50503 "F1 - TabSalesInv_CommissLines"
{
    fields
    {
        field(1; Type; Enum "Sales Line Type")
        {
            Caption = 'Type';
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST(" ")) "Standard Text"
            ELSE
            IF (Type = CONST("G/L Account"))
                "G/L Account" WHERE("Direct Posting" = CONST(true), "Account Type" = CONST(Posting), Blocked = CONST(false))
            ELSE
            IF (Type = CONST("G/L Account"))
                "G/L Account"
            ELSE
            IF (Type = CONST(Resource)) Resource
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST("Charge (Item)")) "Item Charge"
            ELSE
            IF (Type = CONST(Item)) Item WHERE(Blocked = CONST(false),
                "Sales Blocked" = CONST(false))
            ELSE
            IF (Type = CONST(Item)) Item WHERE(Blocked = CONST(false));
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                Item.Reset();
                Item.SetRange("No.", Rec."No.");
                if Item.FindSet() then begin
                    Description := Item.Description;
                    Modify();
                end;
            end;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            TableRelation = IF (Type = CONST("G/L Account"), "No." = CONST('')) "G/L Account".Name WHERE("Direct Posting" = CONST(true),
                                "Account Type" = CONST(Posting),
                                Blocked = CONST(false))
            ELSE
            IF (Type = CONST("G/L Account"), "No." = CONST('')) "G/L Account".Name
            ELSE
            IF (Type = CONST(Item), "No." = CONST('')) Item.Description WHERE(Blocked = CONST(false),
                                                    "Sales Blocked" = CONST(false))
            ELSE
            IF (Type = CONST(Item), "No." = CONST('')) Item.Description WHERE(Blocked = CONST(false))
            ELSE
            IF (Type = CONST(Resource), "No." = CONST('')) Resource.Name
            ELSE
            IF (Type = CONST("Fixed Asset"), "No." = CONST('')) "Fixed Asset".Description
            ELSE
            IF (Type = CONST("Charge (Item)"), "No." = CONST('')) "Item Charge".Description;


        }
        field(4; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;

        }
        field(5; "Salesperson Code"; Code[10])
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
        field(6; "Salesperson Name"; Text[100])
        {
            Caption = 'Salesperson Name';
            TableRelation = "Salesperson/Purchaser".Name;
        }
        field(7; "Role Description"; Enum "Role Description")
        {
            Caption = 'Role Description';
        }
        field(8; "Amount (Commission Base)"; Decimal)
        {
            //AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
            Editable = false;
        }
        field(9; "Fees"; Decimal)
        {
            Caption = '% Fees';
            TableRelation = "F1 - Salespersons list"."Fees" WHERE("Customer No." = FIELD("No."));
            DecimalPlaces = 0 : 5;
        }
        field(10; "Commission (Amount)"; Decimal)
        {
            Caption = 'Commission (Amount) (LCY)';

            trigger OnValidate()
            begin
                "Commission (Amount)" := ("Amount (Commission Base)" * "Fees") / 100;
            end;
        }
        field(11; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(12; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(13; "Document No."; Code[20])
        {
            Caption = 'Document Type';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = FIELD("Document Type"));

            trigger OnValidate()
            begin

            end;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    procedure IsReady(): Boolean
    begin
        exit(false);
    end;
}