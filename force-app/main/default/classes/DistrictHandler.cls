public without sharing class DistrictHandler implements TriggerTemplate.Handler{

    private List<District__c> newValues;
    private Map<Id, District__c> oldValues;

    public void setValues(List<sObject> newValues, Map<Id, sObject> oldValues)
    {
        this.newValues = newValues;
        this.oldValues = (Map<Id, District__c>) oldValues;
    }

    public void handle(TriggerTemplate.TriggerAction action)
    {
        if (action == TriggerTemplate.TriggerAction.afterUpdate)
        {
            DistrictService.countPopulationAndArea(newValues);
        }
    }
}