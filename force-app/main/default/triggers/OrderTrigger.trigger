trigger OrderTrigger on Order__c (before insert, before update, before delete, after update, after Insert, after delete) {
    
    if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            HandlerOrderTrigger.countTax((List<Order__c>)Trigger.new);
        }
        if(Trigger.isUpdate)
        {
            HandlerOrderTrigger.countTax((List<Order__c>)Trigger.new);
        }
        if(Trigger.isDelete){
            HandlerOrderTrigger.countTotalIncome((List<Order__c>)Trigger.new);
        }
    } else if(Trigger.isAfter){
        if(Trigger.isInsert){
            HandlerOrderTrigger.createTask((List<Order__c>)Trigger.new);
            HandlerOrderTrigger.countTotalIncome((List<Order__c>)Trigger.new);
        }
        if(Trigger.isUpdate)
        {
            HandlerOrderTrigger.countTotalIncome((List<Order__c>)Trigger.new);
        }   
        if(Trigger.isDelete){
            HandlerOrderTrigger.countTotalIncome((List<Order__c>)Trigger.new);
        }
    }
    
}