@component
export class FoodCollider extends VisualScripting.BaseScriptComponent {
    @input
    physicsBody: Physics.BodyComponent;

    onAwake() {
        if (this.physicsBody) {
            this.physicsBody.onTargetEnter.add((eventArgs) => {
                print("Collision detected with: " + eventArgs.target.getSceneObject().name);
                
                // Use 'this.getSceneObject()' instead of 'script.getSceneObject()'
                this.getSceneObject().enabled = false;
            });
        }
    }
}

