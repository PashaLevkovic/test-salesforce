({
    afterRender: function (component, helper) {
        this.superAfterRender();
        setTimeout(function() {
            component.getEvent("onload").fire();
            component.destroy();

        }, 10000);
    },
})