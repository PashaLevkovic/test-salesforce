public without sharing class CityHandler implements TriggerTemplate.Handler{

    private List<City__c> newValues;
    private Map<Id, City__c> oldValues;

    public void setValues(List<sObject> newValues, Map<Id, sObject> oldValues)
    {
        this.newValues = newValues;
        this.oldValues = (Map<Id, City__c>) oldValues;
    }

    public void handle(TriggerTemplate.TriggerAction action)
    {
        if (action == TriggerTemplate.TriggerAction.afterUpdate)
        {
            CityService.countPopulation(newValues);
        }
    }
}