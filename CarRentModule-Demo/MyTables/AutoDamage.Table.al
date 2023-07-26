table 50135 "Auto Damage"
{
    Caption = 'Auto Damage';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Car No."; Code[20])
        {
            Caption = 'Car No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(4; Description; Code[100])
        {
            Caption = 'Description';
        }
        field(5; "Status"; Enum "Auto Damage Status")
        {
            Caption = 'Status';
        }
    }
    keys
    {
        key(Key1; "Car No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Line No.")
        {

        }
    }
}