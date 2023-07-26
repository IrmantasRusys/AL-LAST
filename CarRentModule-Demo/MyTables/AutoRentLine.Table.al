table 50137 "Auto Rent Line"
{
    Caption = 'Auto Rent Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Type"; Enum "Auto Rent Line Type")
        {
            Caption = 'Type';
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(6; Amount; Integer)
        {
            Caption = 'Amount';
            trigger OnValidate()
            begin
                Sum := Round(Amount * Price);
            end;
        }
        field(7; Price; Decimal)
        {
            Caption = 'Price';
            Editable = false;
            trigger OnValidate()
            begin
                Sum := Round(Amount * Price);
            end;
        }
        field(8; Sum; Decimal)
        {
            Caption = 'Sum';
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Line No.")
        {

        }
    }
}