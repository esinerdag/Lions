public with sharing class saController {
    @AuraEnabled(cacheable=true)
    public static List<SA_Details__c> searchSalesAgents(String searchKey) {

        searchKey = '%'+searchKey + '%';

        return [SELECT Id, Name, Customer_Handled__c, Date_of_Joining__c, Experience__c
        FROM SA_Details__c 
        WHERE Name LIKE : searchKey
        WITH SECURITY_ENFORCED
        ORDER BY Name ASC ]; 
}
}