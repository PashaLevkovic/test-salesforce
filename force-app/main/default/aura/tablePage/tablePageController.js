({
    doInit : function(component, event, helper){
        var getCities = component.get("c.getCities");

        getCities.setCallback(this, function(response){
            var state = response.getState();
            console.log(state);

            if (state === "SUCCESS")
            {
                var cities = response.getReturnValue();
                component.set("v.regions", cities);
            }
            else
            {
                helper.showToast({
                    title: "Error!",
                    message: "There are some problems"
                });
            }
        });

        $A.enqueueAction(getCities);
    },

    sortByName : function(component, event, helper){
        console.log('hello');
    },

    runFlow :function(component, event, helper){
        var flow = component.find("flowData");
        flow.startFlow("runFlow");

    }
})