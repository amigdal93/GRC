pageextension 50501 PagExtItemVendorCatalog extends "Item Vendor Catalog"
{
    layout
    {
        modify("Item No.")
        {
            Visible = true;
        }

        addafter("Vendor No.")
        {
            field("Direct Unit Cost"; Rec."Direct Unit Cost")
            {
                Caption = 'Direct Unit Cost';
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //> alternative function for Calcfields Lookup, recalled when the record is being retrieved
        GetDirectUnitCostValue();
    end;

    local procedure GetDirectUnitCostValue()
    var
        PurchasePrice: Record "Purchase Price";
    begin
        PurchasePrice.Reset();
        PurchasePrice.SetRange("Item No.", Rec."Item No.");
        PurchasePrice.SetRange("Vendor No.", Rec."Vendor No.");
        PurchasePrice.SetRange("Variant Code", Rec."Variant Code");
        if PurchasePrice.FindSet() then begin
            //Rec.Validate("Direct Unit Cost", PurchasePrice."Direct Unit Cost");
            //>alternative way of field validation
            Rec."Direct Unit Cost" := PurchasePrice."Direct Unit Cost";
            Rec.Modify();
            // for direct unit cost order ascending
            Rec.SetCurrentKey("Direct Unit Cost");
            //<
        end;
    end;

    trigger OnOpenPage()
    var
        PrefVendorNotification: Notification;
        InformMessageLbl: Label 'The preferencial vendor for the article %1 is %2.';
        Lbl001: Label 'The preferencial vendor for the article ';
        Lbl002: Label ' is ';
        NotificationMsg: Text;
        PrefVendor: Text;
        InformMessage: Text;
        Item: Record Item;
        PreferedVendorName: Text[100];
        ItemNo: Code[20];
        ItemVendor: Record "Item Vendor";
    begin
        //> managed message with article number and prefered vendor name
        if Item.Get(Rec."Item No.") then begin
            if Item."Preferible Vendor" <> '' then begin
                PreferedVendorName := Item."Preferible Vendor";
                ItemNo := Item."No.";

                Message(InformMessageLbl, ItemNo, PreferedVendorName);
            end;
        end;

        //> managed notification with article number and prefered vendor name
        if Item.Get(Rec."Item No.") then begin
            if Item."Preferible Vendor" <> '' then begin
                //Add a data property for the vendor number
                PrefVendorNotification.SetData('ItemNo', Item."No.");
                PrefVendorNotification.SetData('PrefVendor', Item."Preferible Vendor");

                PrefVendorNotification.Scope := NotificationScope::LocalScope;
                ItemNo := PrefVendorNotification.GetData('ItemNo');
                PreferedVendorName := PrefVendorNotification.GetData('PrefVendor');
                NotificationMsg := Lbl001 + ItemNo + Lbl002 + PreferedVendorName + '.';
                //Create the notification
                PrefVendorNotification.Message(NotificationMsg);
                //Send the notification to the client.
                PrefVendorNotification.Send();


                /*                 // da gestire
                                ItemVendor.Reset();
                                ItemVendor.SetRange("Item No.", Item."No.");
                                ItemVendor.SetRange("Vendor No.", Item."F1 - Vendor No.");
                                if ItemVendor.FindSet() then
                                    ItemVendor.Mark(true); */
            end;
        end;
    end;
}