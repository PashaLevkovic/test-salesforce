({
    doInit : function(component, event, helper){
        var getDistricts = component.get("c.getDistricts");

        console.log(component.get("v.recordId"));

        getDistricts.setParams({
            "regionId" : component.get("v.recordId")
        });

        getDistricts.setCallback(this, function(response){
            var state = response.getState();
            console.log(state);

            if (state === "SUCCESS")
            {
                var districts = response.getReturnValue();
                console.log(districts);
                component.set("v.districts", districts);
            }
            else
            {
                helper.showToast({
                    title: "Error!",
                    message: "There are some problems"
                });
            }
        });

        $A.enqueueAction(getDistricts);
    }
})