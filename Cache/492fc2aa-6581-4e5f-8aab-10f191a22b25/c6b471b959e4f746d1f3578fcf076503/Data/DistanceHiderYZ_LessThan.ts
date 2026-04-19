@component
export class DistanceHiderYZ extends BaseScriptComponent {
    
    @input
    movingObject: SceneObject;
    
    @input
    speed: number = 10.0;
    
    @input
    direction: vec3 = new vec3(0, 0, 1);
    
    @input
    targetParent: SceneObject;
    
    @input
    criticalDistanceY: number = 2.0;
    
    @input
    criticalDistanceZ: number = 2.0;
    
    @input
    enableDebug: boolean = true;
    
    private transform: Transform;
    private targetObjects: SceneObject[] = [];
    private targetTransforms: Transform[] = [];
    private hiddenObjects: Set<SceneObject> = new Set();
    private detectionCount: number = 0;
    
    onAwake() {
        this.log("=== DistanceHiderYZ Initialization Started ===");
        
        if (!this.movingObject) {
            this.log("ERROR: Moving object is not assigned.");
            return;
        }
        this.log(`✓ Moving object: ${this.movingObject.name}`);
        
        if (!this.targetParent) {
            this.log("ERROR: Target parent is not assigned.");
            return;
        }
        this.log(`✓ Target parent: ${this.targetParent.name}`);
        
        this.transform = this.movingObject.getTransform();
        
        // Get all target objects from the parent
        this.getTargetObjects(this.targetParent);
        this.log(`✓ Found ${this.targetObjects.length} target objects`);
        
        if (this.targetObjects.length === 0) {
            this.log("WARNING: No target objects found in target parent!");
        }
        
        this.log(`✓ Critical Y distance: ${this.criticalDistanceY}`);
        this.log(`✓ Critical Z distance: ${this.criticalDistanceZ}`);
        this.log("=== DistanceHiderYZ Initialization Complete ===\n");
        
        // Set up update event for movement and distance checking
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
    }
    
    private getTargetObjects(parent: SceneObject) {
        const childCount = parent.getChildrenCount();
        
        for (let i = 0; i < childCount; i++) {
            const child = parent.getChild(i);
            this.targetObjects.push(child);
            this.targetTransforms.push(child.getTransform());
            this.log(`Found target object: ${child.name}`);
            
            // Recursively check nested children
            this.getTargetObjects(child);
        }
    }
    
    private onUpdate(eventData: UpdateEvent) {
        if (!this.transform) return;
        
        const deltaTime = getDeltaTime();
        
        // Update moving object position
        const currentPos = this.transform.getWorldPosition();
        const normalizedDir = this.direction.normalize();
        const movement = normalizedDir.uniformScale(this.speed * deltaTime);
        const newPos = currentPos.add(movement);
        this.transform.setWorldPosition(newPos);
        
        // Check Y and Z distances to all target objects
        this.checkYZDistances(currentPos);
    }
    
    private checkYZDistances(movingPos: vec3) {
        for (let i = 0; i < this.targetObjects.length; i++) {
            const targetObj = this.targetObjects[i];
            const targetTransform = this.targetTransforms[i];
            
            // Skip if already hidden
            if (this.hiddenObjects.has(targetObj)) {
                continue;
            }
            
            // Skip if object is disabled
            if (!targetObj.enabled) {
                this.hiddenObjects.add(targetObj);
                continue;
            }
            
            // Get target position
            const targetPos = targetTransform.getWorldPosition();
            
            // Calculate Y and Z distances
            const yDistance = this.calculateAxisDistance(movingPos.y, targetPos.y);
            const zDistance = this.calculateAxisDistance(movingPos.z, targetPos.z);
            
            // Hide if Y distance < critical Y AND Z distance < critical Z
            if (yDistance < this.criticalDistanceY && zDistance < this.criticalDistanceZ) {
                this.hideObject(targetObj, yDistance, zDistance);
            }
        }
    }
    
    private calculateAxisDistance(pos1: number, pos2: number): number {
        // Calculate absolute distance on a single axis
        return Math.abs(pos1 - pos2);
    }
    
    private hideObject(object: SceneObject, yDistance: number, zDistance: number) {
        this.log(`HIDING: ${object.name} (Y: ${yDistance.toFixed(2)}, Z: ${zDistance.toFixed(2)})`);
        this.detectionCount++;
        
        // Disable the entire object
        object.enabled = false;
        this.hiddenObjects.add(object);
        
        // Verify it was disabled
        if (!object.enabled) {
            this.log(`✓ Successfully hidden: ${object.name}`);
        } else {
            this.log(`✗ FAILED to hide: ${object.name}`);
        }
    }
    
    private log(message: string) {
        if (this.enableDebug) {
            print(`[DistanceHiderYZ] ${message}`);
        }
    }
    
    // Public methods
    
    public resetScene() {
        this.log("Resetting scene...");
        for (let obj of this.hiddenObjects) {
            if (obj) {
                obj.enabled = true;
                this.log(`Re-enabled: ${obj.name}`);
            }
        }
        this.hiddenObjects.clear();
        this.detectionCount = 0;
        this.log("Scene reset complete");
    }
    
    public getDetectionCount(): number {
        return this.detectionCount;
    }
    
    public getHiddenObjectCount(): number {
        return this.hiddenObjects.size;
    }
    
    public setSpeed(newSpeed: number) {
        this.speed = newSpeed;
        this.log(`Speed set to ${newSpeed}`);
    }
    
    public setDirection(newDirection: vec3) {
        this.direction = newDirection;
        this.log(`Direction set to (${newDirection.x}, ${newDirection.y}, ${newDirection.z})`);
    }
    
    public setCriticalDistanceY(newDistance: number) {
        this.criticalDistanceY = newDistance;
        this.log(`Critical Y distance set to ${newDistance}`);
    }
    
    public setCriticalDistanceZ(newDistance: number) {
        this.criticalDistanceZ = newDistance;
        this.log(`Critical Z distance set to ${newDistance}`);
    }
    
    public setCriticalDistances(distanceY: number, distanceZ: number) {
        this.criticalDistanceY = distanceY;
        this.criticalDistanceZ = distanceZ;
        this.log(`Critical distances set to Y: ${distanceY}, Z: ${distanceZ}`);
    }
    
    public getMovingObjectPosition(): vec3 {
        if (!this.transform) return new vec3(0, 0, 0);
        return this.transform.getWorldPosition();
    }
    
    public getTargetYZPositions(): Map<string, {y: number, z: number}> {
        const positions = new Map<string, {y: number, z: number}>();
        for (let i = 0; i < this.targetObjects.length; i++) {
            const name = this.targetObjects[i].name;
            const pos = this.targetTransforms[i].getWorldPosition();
            positions.set(name, {y: pos.y, z: pos.z});
        }
        return positions;
    }
}
