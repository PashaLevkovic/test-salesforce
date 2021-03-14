trigger OrderTemplateTrigger on Order__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    
    TriggerTemplate.TriggerManager triggerManager = new TriggerTemplate.TriggerManager();
    triggerManager.addHandler(new OrderTemplateHandler(), new List<TriggerTemplate.TriggerAction>{
        TriggerTemplate.TriggerAction.afterUpdate, TriggerTemplate.TriggerAction.afterInsert, 
            TriggerTemplate.TriggerAction.beforeUpdate, TriggerTemplate.TriggerAction.beforeInsert,
            TriggerTemplate.TriggerAction.afterDelete
    });
    triggerManager.runHandlers();
                                          
}