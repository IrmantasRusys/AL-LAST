table 50136 "Auto Rent Header"
{
    Caption = 'Auto Rent Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Client No."; Code[20])
        {
            Caption = 'Client No.';
            TableRelation = Customer."No.";
            trigger OnValidate()
            var
            begin
                CheckClientBlocked();
                CheckClientDebt();
            end;
        }
        field(3; "Drivers License"; Media)
        {
            Caption = 'Drivers License';
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; "Car No."; Code[20])
        {
            Caption = 'Car No.';
        }
        field(6; "Reserved From"; Date)
        {
            Caption = 'Reserved From Date';
        }
        field(7; "Reserved Until"; Date)
        {
            Caption = 'Reserved Until Date';
        }
        field(8; Sum; Decimal)
        {
            Caption = 'Sum';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Auto Rent Line".Sum where("Document No." = field("No.")));
        }
        field(9; Status; Enum "Auto Rent Header Status")
        {
            Caption = 'Status';
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin  // ar numerio serija tuscia
            AutoSetup.Get();  // pasiimam duomenis
            AutoSetup.TestField("Car Rental NoS");
            "No." := NoSeriesManagement.GetNextNo(AutoSetup."Car Rental NoS", WorkDate(), true);
        end;
    end;

    local procedure CheckClientBlocked()
    var
        Customer: Record Customer;  // kintamasis Record Customer gaut
    begin
        if Customer.Get(Rec."Client No.") then  // duomenys apie klienta pagal kliento nr.
            Customer.TestField(Blocked, Customer.Blocked::" ");   // tikrinam, ar klientas uzblokuotas
    end;

    local procedure CheckClientDebt()
    var
        Customer: Record Customer;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Debt: Decimal;   // kliento skolos dydziui saugoti
        Err: Label 'This Client is in debt';  // etikete jei skoloj
    begin
        if Customer.Get(Rec."Client No.") then begin
            CustLedgerEntry.SetFilter("Customer No.", Rec."Client No.");
            if CustLedgerEntry.FindSet() then
                repeat
                    Debt += CustLedgerEntry."Amount (LCY)";  // bendras skolos dydis
                until CustLedgerEntry.Next() = 0;   // apdorojam visus irasus
        end;
        if Debt > 0 then
            Error(Err);  // jei skola didesne uz 0, turim errora
    end;
}