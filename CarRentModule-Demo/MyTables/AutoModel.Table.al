table 50132 "Auto Model"
{
    Caption = 'Auto Model';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Brand Code"; Code[20])
        {
            Caption = 'Brand Code';
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(3; Description; Text[100])   // sitas nera raktas
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(Key1; "Brand Code", "Code")
        {
            Clustered = true;
        }
        key(Key2; "Code")
        {

        }
    }
}