public class sendEmailOppChangesHandler
{
    public Static Void  sendEmailOppChangesHandler(List<Opportunity> lstOpp,Map<ID,Opportunity> oldMap,Map<ID,Opportunity> newMap) 
    {
        Map<ID,Opportunity> odMap=oldMap;
        Map<ID,Opportunity> nwMap=newMap;
        /*Code for Map Contact ID with list of Email*/
        Set<ID> ids=new Set<ID>();
        for(Opportunity opp:lstOpp)
        {
            ids.add(opp.AccountId);
        }
        List<Contact> lstCon=[SELECT ID,Email,AccountId FROM Contact WHERE AccountId IN :ids ];
        Map<ID,List<String>> mapCon=new Map<ID,List<String>>();
        for(Contact loopCon:lstCon)
        {   
            if(mapCon.containsKey(loopCon.AccountId))
            {
                List<String> accCon=mapCon.get(loopCon.AccountId);
                accCon.add(loopCon.Email);
                mapCon.put(loopCon.AccountId,accCon);
            }
            else
            {
                List<String> acCon=new List<String>();
                acCon.add(loopCon.Email);
                mapCon.put(loopCon.AccountId,acCon);
            }
        }
        
        /*End of Map of AccountID and Email */
        for(Opportunity opp:lstOpp)
        {
            if(odMap.get(opp.ID).StageName != nwMap.get(opp.ID).StageName)
                {
                    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                    message.toAddresses = mapCon.get(opp.AccountID);
                    message.optOutPolicy = 'FILTER';
                    message.subject = 'Notification Opportunity Stage Change';
                    message.plainTextBody = 'Opportunity Stage Change from '+ odMap.get(opp.ID).StageName+' to '+nwMap.get(opp.ID).StageName+'.';
                    Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
                    Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

                    if (results[0].success)
                     {
                        System.debug('The email was sent successfully.');
                     } else
                     {
                        System.debug('The email failed to send: ' + results[0].errors[0].message);
                     }           
                }
        }
    }
}
