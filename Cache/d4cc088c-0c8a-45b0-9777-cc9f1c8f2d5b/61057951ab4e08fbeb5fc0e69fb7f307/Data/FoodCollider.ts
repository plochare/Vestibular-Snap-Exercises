// Example TypeScript for Lens Studio
//@input Component.ColliderComponent collider
//@input Component.SceneObject objectToHide

var scriptComponent = script.getSceneObject().getComponent("Component.ScriptComponent");

script.collider.onTriggerEnter.add(function(e) {
    print("Collision detected!");
    // Make the object disappear
    script.objectToHide.enabled = false;
});