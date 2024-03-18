trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
        {
            List<Task> followuptasks = new List<Task>();
            for(Opportunity opp : Trigger.new)
            {
                if(opp.StageName == 'Closed Won')
                {
                    Task newTask = new Task();
                    newTask.Subject = 'Follow Up Test Task';
                    newTask.WhatId = opp.Id;
                    followuptasks.add(newtask);
                }
            }
            upsert followuptasks;
        }
    }
}