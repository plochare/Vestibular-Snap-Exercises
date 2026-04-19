@component
export class DistanceHider extends BaseScriptComponent {
    
    @input
    movingObject: SceneObject;
    
    @input
    speed: number = 10.0;
    
    @input
    direction: vec3 = new vec3(1, 0, 0);
    
    @input
    targetParent: SceneObject;
    
    @input
    detectionRadius: number = 2.0;
    
    @input
    enableDebug: boolean = true;
    
    @input
    collisionSoundEffect: AudioComponent;
    
    private transform: Transform;
    private targetObjects: SceneObject[] = [];
    private hiddenObjects: Set<SceneObject> = new Set();
    private detectionCount: number = 0;
    
    onAwake() {
        // Configure audio playback mode for low latency if assigned
        if (this.collisionSoundEffect) {
            try {
                (this.collisionSoundEffect as any).playbackMode = (Audio as any).PlaybackMode?.LowLatency || 1;
                this.log("✓ Audio playback mode set to LowLatency");
            } catch (error) {
                this.log("WARNING: Could not set audio playback mode - " + error);
            }
        }
        
        this.log("=== DistanceHider Initialization Started ===");
        
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
        
        if (!this.collisionSoundEffect) {
            this.log("WARNING: Collision sound effect is not assigned. Collisions will be silent.");
        } else {
            this.log(`✓ Collision sound effect assigned`);
        }
        
        this.transform = this.movingObject.getTransform();
        
        // Get all target objects from the parent
        this.getTargetObjects(this.targetParent);
        this.log(`✓ Found ${this.targetObjects.length} target objects`);
        
        if (this.targetObjects.length === 0) {
            this.log("WARNING: No target objects found in target parent!");
        }
        
        this.log(`✓ Detection radius: ${this.detectionRadius}`);
        this.log("=== DistanceHider Initialization Complete ===\n");
        
        // Set up update event for movement and distance checking
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
    }
    
    private getTargetObjects(parent: SceneObject) {
        const childCount = parent.getChildrenCount();
        
        for (let i = 0; i < childCount; i++) {
            const child = parent.getChild(i);
            this.targetObjects.push(child);
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
        
        // Check distance to all target objects
        this.checkDistances(currentPos);
    }
    
    private checkDistances(movingPos: vec3) {
        for (let targetObj of this.targetObjects) {
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
            const targetTransform = targetObj.getTransform();
            const targetPos = targetTransform.getWorldPosition();
            
            // Calculate distance
            const distance = this.calculateDistance(movingPos, targetPos);
            
            // Check if within detection radius
            if (distance <= this.detectionRadius) {
                this.hideObject(targetObj, distance);
            }
        }
    }
    
    private calculateDistance(pos1: vec3, pos2: vec3): number {
        const dx = pos1.x - pos2.x;
        const dy = pos1.y - pos2.y;
        const dz = pos1.z - pos2.z;
        
        return Math.sqrt(dx * dx + dy * dy + dz * dz);
    }
    
    private hideObject(object: SceneObject, distance: number) {
        this.log(`HIDING: ${object.name} (distance: ${distance.toFixed(2)})`);
        this.detectionCount++;
        
        // Play collision sound effect before disabling
        this.playCollisionSound();
        
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
    
    private playCollisionSound() {
        if (!this.collisionSoundEffect) {
            return;
        }
        
        try {
            // Play the sound effect with type assertion to bypass strict typing
            (this.collisionSoundEffect as any).play(1);
            this.log(`♪ Collision sound played`);
        } catch (error) {
            this.log(`ERROR: Failed to play collision sound - ${error}`);
        }
    }
    
    private log(message: string) {
        if (this.enableDebug) {
            print(`[DistanceHider] ${message}`);
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
    
    public setDetectionRadius(newRadius: number) {
        this.detectionRadius = newRadius;
        this.log(`Detection radius set to ${newRadius}`);
    }
    
    public setCollisionSoundEffect(soundComponent: AudioComponent) {
        this.collisionSoundEffect = soundComponent;
        if (this.collisionSoundEffect) {
            try {
                (this.collisionSoundEffect as any).playbackMode = (Audio as any).PlaybackMode?.LowLatency || 1;
            } catch (error) {
                this.log("WARNING: Could not set audio playback mode");
            }
        }
        this.log(`Collision sound effect updated`);
    }
}
