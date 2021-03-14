trigger CityTrigger on City__c (after update)
{
    TriggerTemplate.TriggerManager triggerManager = new TriggerTemplate.TriggerManager();
    triggerManager.addHandler(new CityHandler(), new List<TriggerTemplate.TriggerAction>{
        TriggerTemplate.TriggerAction.afterUpdate, TriggerTemplate.TriggerAction.afterInsert,
        TriggerTemplate.TriggerAction.beforeUpdate, TriggerTemplate.TriggerAction.beforeInsert,
        TriggerTemplate.TriggerAction.afterDelete
    });
    triggerManager.runHandlers();

}