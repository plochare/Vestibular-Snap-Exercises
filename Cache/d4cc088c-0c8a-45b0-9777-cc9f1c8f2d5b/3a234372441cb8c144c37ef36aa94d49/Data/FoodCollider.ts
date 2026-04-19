@component
export class FoodCollider extends ContainerComponent {
    @input
    physicsBody: Physics.Component.PhysicsBody;

    onAwake() {
        if (this.physicsBody) {
            // "onTargetEnter" is for Triggers/Intangible objects
            // "onCollisionEnter" is for solid physical impacts
            this.physicsBody.onTargetEnter.add((eventArgs) => {
                print("Collision detected with: " + eventArgs.target.getSceneObject().name);
                
                // Use 'sceneObject' to refer to the object this script is on
                this.sceneObject.enabled = false;
            });
        }
    }
}