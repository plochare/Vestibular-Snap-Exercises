if (script.onAwake) {
    script.onAwake();
    return;
}
function checkUndefined(property, showIfData) {
    for (var i = 0; i < showIfData.length; i++) {
        if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]) {
            return;
        }
    }
    if (script[property] == undefined) {
        throw new Error("Input " + property + " was not provided for the object " + script.getSceneObject().name);
    }
}
// @input SceneObject movingObject
// @input float speed = 10
// @input vec3 direction = {0,0,1}
// @input SceneObject targetParent
// @input float criticalDistanceY = 2
// @input float criticalDistanceZ = 2
// @input bool enableDebug = true
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../Modules/Src/Assets/Scripts/DistanceHiderYZ_LessThan");
Object.setPrototypeOf(script, Module.DistanceHiderYZ.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("movingObject", []);
    checkUndefined("speed", []);
    checkUndefined("direction", []);
    checkUndefined("targetParent", []);
    checkUndefined("criticalDistanceY", []);
    checkUndefined("criticalDistanceZ", []);
    checkUndefined("enableDebug", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
