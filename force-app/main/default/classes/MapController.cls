public with sharing class MapController
{
    public String districts {get; set;}

    public MapController(){
        districts = JSON.serialize([
            SELECT Name, Boundary_Coordinates__c, Region__r.Name
            FROM District__c
        ]);
    }
}