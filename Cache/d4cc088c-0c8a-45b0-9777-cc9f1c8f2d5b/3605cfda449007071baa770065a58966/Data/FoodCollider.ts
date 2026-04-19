typescript
@component
export class FoodCollider extends BaseScriptComponent {
    @input
    physicsBody: Physics.BodyComponent;

    onAwake() {
        // Check if the physicsBody was assigned in the Inspector
        if (this.physicsBody) {
            this.physicsBody.onTargetEnter.add((eventArgs) => {
                print("Collision detected with: " + eventArgs.target.getSceneObject().name);
                
                // Hide the object on collision
                this.getSceneObject().enabled = false;
            });
        }
    }
}