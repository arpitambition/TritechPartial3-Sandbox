public with sharing class Opportunity_Utility {
    public static void setOpportunityPriceBook(List<Opportunity> listOpportunity){

        ID pb1 = '01s80000000VdQw';
        ID pb2 = '01s80000000VdR1';
        ID pb3 = '01s80000000Ve0K';
        ID pb4 = '01s80000000Ve0P';
        ID pb5 = '01s80000000OWim';
        ID pb6 = '01s80000000C4Dy' ;

        String Edition1 = 'Inform';
        String Edition2 = 'GSA';
        String Edition3 = 'Perform';
        String Edition4 = 'Respond';
        String Edition5 = 'Rapid Implementation';
        String Edition6 = 'Zuercher';

        for(Opportunity opp : listOpportunity) {
            if (opp.Price_Book__c == Edition1) {
                opp.Pricebook2Id = pb1;
            }

            else if (opp.Price_Book__c == Edition2) {
                opp.Pricebook2Id = pb2;
            }

            else if (opp.Price_Book__c == Edition3) {
                opp.Pricebook2Id = pb3;
            }

            else if (opp.Price_Book__c == Edition4) {
                opp.Pricebook2Id = pb4;
            }
            else if (opp.Price_Book__c == Edition5) {
                opp.Pricebook2Id = pb5;
            }
            else if (opp.Price_Book__c == Edition6) {
                opp.Pricebook2Id = pb6;
            }
        }
    }
}