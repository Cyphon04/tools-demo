public without sharing class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext sc)
    {
        List<Lead> Leads = [SELECT Id,LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        
        for(Lead lead : leads)
        {
            lead.leadSource = 'Dreamforce';
        }
        
        update leads;
    }
}