trigger OpportunityTrigger on Opportunity (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityTriggerHandler.OppClosedWonTask(Trigger.new,Trigger.oldMap);
    }
}