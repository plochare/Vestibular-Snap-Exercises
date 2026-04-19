@component
export class CollisionHiderDebug extends BaseScriptComponent {
    
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
    private movingCollider: ColliderComponent;
    private collisionCount: number = 0;
    
    onAwake() {
        print("=== CollisionHiderDebug: Initialization Started ===");
        
        if (!this.movingObject) {
            print("ERROR: Moving object is not assigned.");
            return;
        }
        print(`✓ Moving object assigned: ${this.movingObject.name}`);
        
        if (!this.targetParent) {
            print("ERROR: Target parent is not assigned.");
            return;
        }
        print(`✓ Target parent assigned: ${this.targetParent.name}`);
        
        this.transform = this.movingObject.getTransform();
        print(`✓ Transform retrieved from moving object`);
        
        // Get all colliders from the children of the target parent
        this.getCollidersFromChildren(this.targetParent);
        print(`✓ Found ${this.colliders.length} colliders in target parent hierarchy`);
        
        // Ensure the moving object has a collider
        this.movingCollider = this.movingObject.getComponent("Component.ColliderComponent") as ColliderComponent;
        if (!this.movingCollider) {
            print("⚠ Moving object does not have ColliderComponent. Attempting to create one...");
            try {
                this.movingCollider = this.movingObject.createComponent("Component.ColliderComponent") as ColliderComponent;
                print("✓ ColliderComponent created on moving object");
            } catch (e) {
                print(`ERROR: Failed to create ColliderComponent: ${e}`);
                return;
            }
        } else {
            print("✓ Moving object already has ColliderComponent");
        }
        
        // Verify the collider is enabled
        print(`✓ Moving collider enabled: ${this.movingCollider.enabled}`);
        print(`✓ Moving collider is enabled in hierarchy: ${this.movingCollider.isEnabledInHierarchy}`);
        
        // Set up collision events
        try {
            this.movingCollider.onCollisionEnter.add(this.onCollisionEnter.bind(this));
            print("✓ onCollisionEnter event listener registered");
        } catch (e) {
            print(`ERROR: Failed to register onCollisionEnter: ${e}`);
            return;
        }
        
        // Also register collision stay and exit for debugging
        this.movingCollider.onCollisionStay.add(this.onCollisionStay.bind(this));
        this.movingCollider.onCollisionExit.add(this.onCollisionExit.bind(this));
        print("✓ Additional collision event listeners registered (Stay, Exit)");
        
        // Set up update event for movement
        try {
            this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
            print("✓ UpdateEvent listener registered");
        } catch (e) {
            print(`ERROR: Failed to register UpdateEvent: ${e}`);
            return;
        }
        
        print("=== CollisionHiderDebug: Initialization Complete ===\n");
    }
    
    private getCollidersFromChildren(parent: SceneObject, depth: number = 0) {
        const indent = "  ".repeat(depth);
        const childCount = parent.getChildrenCount();
        print(`${indent}Checking parent: ${parent.name} (${childCount} children)`);
        
        for (let i = 0; i < childCount; i++) {
            const child = parent.getChild(i);
            const collider = child.getComponent("Component.ColliderComponent") as ColliderComponent;
            
            if (collider) {
                print(`${indent}  ✓ Found collider on: ${child.name}`);
                print(`${indent}    - Enabled: ${collider.enabled}`);
                print(`${indent}    - Enabled in hierarchy: ${collider.isEnabledInHierarchy}`);
                this.colliders.push(collider);
                this.colliderToObject.set(collider, child);
            } else {
                print(`${indent}  ✗ NO collider on: ${child.name}`);
            }
            
            // Recursively check nested children
            this.getCollidersFromChildren(child, depth + 1);
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
        print(`\n>>> COLLISION ENTER EVENT TRIGGERED <<<`);
        
        if (!eventArgs) {
            print("ERROR: eventArgs is null");
            return;
        }
        
        if (!eventArgs.collision) {
            print("ERROR: eventArgs.collision is null");
            return;
        }
        
        const collision = eventArgs.collision;
        print(`Collision ID: ${collision.id}`);
        print(`Contact Count: ${collision.contactCount}`);
        
        const hitCollider = collision.collider;
        if (!hitCollider) {
            print("ERROR: collision.collider is null");
            return;
        }
        
        const hitObject = hitCollider.getSceneObject();
        print(`Hit object: ${hitObject.name}`);
        
        // Check if the hit object is one of our target children
        const isTargetChild = this.colliderToObject.has(hitCollider);
        print(`Is target child: ${isTargetChild}`);
        
        if (isTargetChild) {
            print(`✓ HIDING OBJECT: ${hitObject.name}`);
            this.collisionCount++;
            print(`Total collisions: ${this.collisionCount}`);
            
            // Hide the object by disabling it
            print(`Before: ${hitObject.name} enabled = ${hitObject.enabled}`);
            hitObject.enabled = false;
            print(`After: ${hitObject.name} enabled = ${hitObject.enabled}`);
        } else {
            print(`✗ NOT a target child - ignoring collision`);
        }
        
        print(`<<< COLLISION ENTER EVENT COMPLETE >>>\n`);
    }
    
    private onCollisionStay(eventArgs: CollisionStayEventArgs) {
        // Uncomment for very verbose logging
        // print(`Collision Stay: ${eventArgs.collision.collider.getSceneObject().name}`);
    }
    
    private onCollisionExit(eventArgs: CollisionExitEventArgs) {
        print(`Collision Exit: ${eventArgs.collision.collider.getSceneObject().name}`);
    }
}
