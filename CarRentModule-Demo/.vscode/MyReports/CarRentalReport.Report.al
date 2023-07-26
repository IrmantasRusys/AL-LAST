report 50149 "Rental Report"
{
    Caption = 'Rental Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = RentalReport;
    dataset
    {
        dataitem(AutoRentHeader; "Auto Rent Header")
        {
            PrintOnlyIfDetail = true;
            column(Car_No; "Car No.")
            {

            }
            dataitem(DataItemName; Auto)
            {
                DataItemLink = "No." = field("Car No.");
                column(Brand; Brand)
                {

                }
                column(Model; Model)
                {

                }
            }
            column(Reserved_From; "Reserved From")
            {

            }
            column(Reserved_Until; "Reserved Until")
            {

            }
            dataitem(AutoRentLine; "Auto Rent Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                {

                }
                column(Amount; Amount)
                {

                }
                column(Price; Price)
                {

                }
                column(Line_Sum; Sum)
                {

                }
            }
            column(Total_Sum; Sum)
            {

            }
        }
    }
    rendering
    {
        layout(RentalReport)
        {
            Type = RDLC;
            LayoutFile = './Layout/RentalReport.rdl';
        }
    }
}