public with sharing class Pidi_getRecords {
    /*List of Leads */
    @AuraEnabled(cacheable=true)
    public static List<Lead> getLeads() {
        return [SELECT Name,Company,Email,Status FROM Lead];
    }
}
