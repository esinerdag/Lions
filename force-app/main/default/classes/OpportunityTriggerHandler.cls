public class OpportunityTriggerHandler {
    public static void OppClosedWonTask(List<Opportunity> newOpp, Map<Id, Opportunity> oldOpp){
     List<Task> newTasks = new List<Task>();
        for (Opportunity opp : newOpp) {
            // Check if the Opportunity stage is updated to 'Closed Won'
            if (opp.StageName == 'Closed Won' && oldOpp.get(opp.Id).StageName != 'Closed Won') {
                // Create a follow-up Task
                Task oppTask = new Task();
                    oppTask.Subject = 'Follow up Task';
                   	oppTask.ActivityDate = opp.CloseDate.addMonths(1);
                    oppTask.WhatId = opp.Id; // Link the Task to the Opportunity
                    oppTask.OwnerId = opp.OwnerId;
                
                newTasks.add(oppTask);
            
        }
        if (!newTasks.isEmpty()) {
            insert newTasks;
        }
    }

    }
}