tableextension 50501 TabExtItemVendor extends "Item Vendor"
{
    fields
    {
        field(50501; "Direct Unit Cost"; Decimal)
        {
            AccessByPermission = tabledata "Purchase Price Access" = R;
            AutoFormatExpression = 'Currency Code';
            AutoFormatType = 2;
            Caption = 'Direct Unit Cost';
            MinValue = 0;

            //> questo pezzo funziona, ma commenta il codice dentro trigger OnAfterGetRecord sulla pagina Item Vendor Catalog
            //FieldClass = FlowField;
            //CalcFormula = Lookup("Purchase Price"."Direct Unit Cost" WHERE("Vendor No." = FIELD("Vendor No."),
            //"Item No." = FIELD("Item No.")));
        }
    }
}