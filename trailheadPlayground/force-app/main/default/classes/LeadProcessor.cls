public without sharing class LeadProcessor implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([SELECT Id, Name FROM Lead]);
    }
    public void execute(Database.BatchableContext bc ,List<Lead> leads)
    {
        for(Lead l : leads)
        {
            l.leadSource = 'Dreamforce';
        }
        update leads;
    }
    public static void finish(Database.BatchableContext bc )
    {
        System.debug('Done');
    }
}