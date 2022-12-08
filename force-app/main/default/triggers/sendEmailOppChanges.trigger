trigger sendEmailOppChanges on Opportunity (before insert,before update) {
    /* Handler Email*/
    sendEmailOppChangesHandler.sendEmailOppChangesHandler(Trigger.NEW,Trigger.oldMap,Trigger.newMap);
}