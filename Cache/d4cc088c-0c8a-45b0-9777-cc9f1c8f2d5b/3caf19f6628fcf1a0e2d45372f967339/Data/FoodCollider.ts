@component
export class FoodCollider extends ScriptComponent {
    @input
    physicsBody: Physics.ColliderComponent;

    onAwake() {
        if (this.physicsBody) {
            // "onCollisionEnter" is for solid impacts
            // "onTargetEnter" is for Triggers/Intangible objects
            this.physicsBody.onCollisionEnter.add((eventArgs) => {
                print("Collision detected!");
                
                // Hide the object this script is attached to
                this.getSceneObject().enabled = false;
            });
        }
    }
}