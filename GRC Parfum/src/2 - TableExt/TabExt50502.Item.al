tableextension 50502 TabExtItem extends Item
{
    fields
    {
        field(50501; "Preferible Vendor"; Text[100])
        {
            TableRelation = Vendor;
            ValidateTableRelation = true;

            trigger OnValidate()
            begin
                // inserts vendor name instead of vendor number
                VendorRec.Reset();
                VendorRec.SetRange("No.", Rec."Preferible Vendor");
                if VendorRec.FindSet() then begin

                    // modify F1 Vendor No. by taking the Preferible Vendor value
                    Rec."F1 - Vendor No." := Rec."Preferible Vendor";
                    Rec.Modify();

                    // modify Preferible Vendor value by inserting the Vendor name
                    Rec."Preferible Vendor" := VendorRec.Name;
                    Rec.Modify();
                end;
            end;
        }

        // field created for the notification needs
        field(50502; "F1 - Vendor No."; Code[20])
        {
            TableRelation = Vendor;
            ValidateTableRelation = true;
        }
    }
    var
        VendorRec: Record Vendor;
}