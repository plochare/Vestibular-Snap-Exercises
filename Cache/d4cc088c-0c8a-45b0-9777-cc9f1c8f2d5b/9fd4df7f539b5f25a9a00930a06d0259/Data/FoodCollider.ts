// @input Component.PhysicsBody physicsBody

if (script.physicsBody) {
    // Listen for collision/trigger events
    script.physicsBody.onTargetEnter.add((eventArgs) => {
        // Log the collision for debugging
        print("Collision detected with: " + eventArgs.target.getSceneObject().name);

        // Make the object disappear
        // Option A: Completely destroy it
        // script.getSceneObject().destroy();

        // Option B: Simply hide it (better for performance if reusing)
        script.getSceneObject().enabled = false;
    });
}