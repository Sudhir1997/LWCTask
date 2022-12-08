trigger EnrichFieldUpdate_trg on Contact (before insert,before update) {
    
	if(TRUE)
        {
        for(Contact loopCon:Trigger.NEW)
            {
                String title='';
                String department='';
                List<OpCo_Related_Contact__c> lstOpCon=[SELECT ID,Title__c,	Department__c,	ReportsToName__c,No_Of_Activities__c FROM OpCo_Related_Contact__c WHERE Email__c=:loopCon.Email];
                for(OpCo_Related_Contact__c loopOpCoCon:lstOpCon)
                    {
                        title+=loopOpCoCon.Title__c+',';
                        department+=loopOpCoCon.department+',';
                    }
                loopCon.Title__c=title;
                loopCon.Department__c=department;
                loopCon.ReportsToName__c=reportsToName;
                loopCon.No_Of_Activities__c=noofActivities;
            }
        }
}