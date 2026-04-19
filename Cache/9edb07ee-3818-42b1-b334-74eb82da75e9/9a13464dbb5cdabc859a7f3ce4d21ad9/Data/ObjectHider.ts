import { ContainerManager } from "./ContainerManager";

@component
export class ObjectHider extends BaseScriptComponent {
    @input
    managerObject: SceneObject;

    @input
    targetColliderLayer: number = 0; // The physics layer of the object that triggers the hide

    private manager: ContainerManager;
    private collider: Physics.ColliderComponent;
    private isHidden: boolean = false;

    onAwake() {
        // Get the ContainerManager script from the assigned manager object
        if (this.managerObject) {
            this.manager = this.managerObject.getComponent(ContainerManager.getTypeName()) as ContainerManager;
        } else {
            print("ObjectHider: Manager Object is not assigned!");
        }

        // Try to get a Physics Body or Collider component on this object
        this.collider = this.getSceneObject().getComponent("Physics.BodyComponent") as Physics.ColliderComponent;
        if (!this.collider) {
            this.collider = this.getSceneObject().getComponent("Physics.ColliderComponent");
        }

        if (this.collider) {
            // Listen for collision events
            this.collider.onCollisionEnter.add(this.onCollisionEnter.bind(this));
            // Also listen for overlap events in case it's a trigger/intangible collider
            this.collider.onOverlapEnter.add(this.onOverlapEnter.bind(this));
        } else {
            print("ObjectHider: No Physics Collider or Body found on " + this.getSceneObject().name);
        }
    }

    private onCollisionEnter(event: Physics.CollisionEvent) {
        this.checkCollision(event.collision.collider);
    }

    private onOverlapEnter(event: Physics.OverlapEvent) {
        this.checkCollision(event.overlap.collider);
    }

    private checkCollision(otherCollider: Physics.ColliderComponent) {
        if (this.isHidden) return;

        // Check if the colliding object is on the target layer
        // In Lens Studio, layers are bitmasks, but for simplicity we can check the layer index
        // or just hide on any collision if targetColliderLayer is not specifically checked.
        // Here we assume any collision with a dynamic body triggers it, but you can refine this.
        
        this.hideObject();
    }

    private hideObject() {
        this.isHidden = true;
        
        // Disable the scene object to hide it
        this.getSceneObject().enabled = false;

        // Notify the manager that this object has been hidden
        if (this.manager) {
            this.manager.onObjectHidden();
        }
    }
}
