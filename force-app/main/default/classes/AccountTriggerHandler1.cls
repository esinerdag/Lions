public with sharing class AccountTriggerHandler1 {
    public static void handleNewAccounts(List<Account> newAccounts) {
         Set<Id> accIdSet = new Set<Id>();
        
        for (Account acc : newAccounts) {
            accIdSet.add(acc.Id);
        }
        
         List<Opportunity> oppAcc =[ SELECT Id FROM Opportunity  WHERE AccountId IN :accIdSet ] ;
       
         List<Opportunity> oppList = new List<Opportunity>();
            If (oppAcc.isEmpty()){
            for (Account acc : newAccounts) {
           
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name + ' Opportunity';
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today().addMonths(1);
            opp.AccountId = acc.Id;
            oppList.add(opp);
            
           
        }
        }       

            insert oppList;
        
    }
  
  
}