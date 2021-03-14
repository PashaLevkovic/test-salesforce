({
    getComponent : function(cmp, event) {
        $A.createComponent(
            "c:frameFileDownload",{},
            function(newComponent){
                if (cmp.isValid()) {
                    var body = cmp.get("v.body");
                    body.push(newComponent);
                    cmp.set("v.body", body);
                }
            }
        );
    },

    removeComponent : function(cmp, event) {
        console.log('work');
    }
})