@component
export class CollisionHider extends BaseScriptComponent {
    
    @input
    movingObject: SceneObject;
    
    @input
    speed: number = 10.0;
    
    @input
    direction: vec3 = new vec3(1, 0, 0);
    
    @input
    targetParent: SceneObject;
    
    private transform: Transform;
    private colliders: ColliderComponent[] = [];
    private colliderToObject: Map<ColliderComponent, SceneObject> = new Map();
    
    onAwake() {
        if (!this.movingObject) {
            print("Error: Moving object is not assigned.");
            return;
        }
        
        if (!this.targetParent) {
            print("Error: Target parent is not assigned.");
            return;
        }
        
        this.transform = this.movingObject.getTransform();
        
        // Get all colliders from the children of the target parent
        this.getCollidersFromChildren(this.targetParent);
        
        print(`Found ${this.colliders.length} colliders in target parent.`);
        
        // Ensure the moving object has a collider
        let movingCollider = this.movingObject.getComponent("Component.ColliderComponent") as ColliderComponent;
        if (!movingCollider) {
            print("Warning: Moving object does not have a ColliderComponent. Adding one.");
            movingCollider = this.movingObject.createComponent("Component.ColliderComponent") as ColliderComponent;
        }
        
        // Set up collision event
        movingCollider.onCollisionEnter.add(this.onCollisionEnter.bind(this));
        
        // Set up update event for movement
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
    }
    
    private getCollidersFromChildren(parent: SceneObject) {
        const childCount = parent.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = parent.getChild(i);
            const collider = child.getComponent("Component.ColliderComponent") as ColliderComponent;
            
            if (collider) {
                this.colliders.push(collider);
                this.colliderToObject.set(collider, child);
            } else {
                print(`Warning: Child object ${child.name} does not have a ColliderComponent.`);
            }
            
            // Recursively check for colliders in nested children
            this.getCollidersFromChildren(child);
        }
    }
    
    private onUpdate(eventData: UpdateEvent) {
        if (!this.transform) return;
        
        const deltaTime = getDeltaTime();
        const currentPos = this.transform.getWorldPosition();
        
        // Calculate new position based on direction and speed
        const normalizedDir = this.direction.normalize();
        const movement = normalizedDir.uniformScale(this.speed * deltaTime);
        const newPos = currentPos.add(movement);
        
        this.transform.setWorldPosition(newPos);
    }
    
    private onCollisionEnter(eventArgs: CollisionEnterEventArgs) {
        const collision = eventArgs.collision;
        const hitCollider = collision.collider;
        const hitObject = this.colliderToObject.get(hitCollider);
        
        // Check if the hit object is one of our target children
        if (hitObject && this.colliders.includes(hitCollider)) {
            print(`Collision detected with ${hitObject.name}. Hiding object.`);
            
            // Hide the object by disabling it
            hitObject.enabled = false;
            
            // Alternatively, you could disable just the RenderMeshVisual
            // const renderMesh = hitObject.getComponent("Component.RenderMeshVisual");
            // if (renderMesh) {
            //     renderMesh.enabled = false;
            // }
        }
    }
}
