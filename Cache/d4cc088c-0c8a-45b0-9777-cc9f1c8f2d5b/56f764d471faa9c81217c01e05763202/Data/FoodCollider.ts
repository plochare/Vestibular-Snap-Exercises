@component
export class FoodCollider extends BaseScriptComponent {
    @input
    physicsBody: Physics.ColliderComponent;

    onAwake() {
        if (this.physicsBody) {
            // Collision events are added via the '.add()' method in Lens Studio
            this.physicsBody.onCollisionEnter.add((eventArgs) => {
                print("Collision detected with: " + eventArgs.collision.collider.getSceneObject().name);
                
                // Hide the object this script is on
                this.getSceneObject().enabled = false;
            });
        }
    }
}