table 50130 "Auto Setup"    // automobiliu saranka
{
    Caption = 'Auto Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[10])  // primary key
        {
            Caption = 'Primary Key';
        }
        field(2; "Car NoS"; Code[20]) // auto numeriu serija
        {
            Caption = 'Car No. Series';
        }
        field(3; "Car Rental NoS"; Code[20]) // nuomos korteles serija
        {
            Caption = 'Car Rental No. Series';
        }
        field(4; "Attachment location"; Code[20])  // Priedu vieta.  " " ne tik lauko pav., bet ir tekstas
        {
            Caption = 'Attachment location';
            TableRelation = Location;
        }
    }
    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;  // irasai lenteleje isdestyti pagal primary key
        }
    }
}