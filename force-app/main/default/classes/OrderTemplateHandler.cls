public without sharing class OrderTemplateHandler implements TriggerTemplate.Handler{
	
    private List<Order__c> newValues;
	private Map<Id, Order__c> oldValues;
	
	public void setValues(List<sObject> newValues, Map<Id, sObject> oldValues)
	{
		this.newValues = newValues;
		this.oldValues = (Map<Id, Order__c>) oldValues;
	}
	
	public void handle(TriggerTemplate.TriggerAction action)
	{
		if (action == TriggerTemplate.TriggerAction.beforeUpdate)
		{
			OrderService.countTax(newValues);
		}

		if (action == TriggerTemplate.TriggerAction.afterUpdate)
		{
			OrderService.countTotalIncome(newValues);
		}

		if (action == TriggerTemplate.TriggerAction.afterInsert)
		{
			OrderService.createTask(newValues);
            OrderService.countTotalIncome(newValues);
		}

		if (action == TriggerTemplate.TriggerAction.beforeInsert)
		{
			OrderService.countTax(newValues);
		}
        if (action == TriggerTemplate.TriggerAction.afterDelete)
		{
			OrderService.countTotalIncome(oldValues.values());
		}
	}
}