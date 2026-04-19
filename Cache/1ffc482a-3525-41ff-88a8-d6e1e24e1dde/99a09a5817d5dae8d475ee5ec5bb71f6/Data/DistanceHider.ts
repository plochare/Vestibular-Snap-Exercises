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
    
    @input
    particleSystemPrefab: SceneObject;
    
    @input
    enableParticleBurst: boolean = true;
    
    private transform: Transform;
    private targetObjects: SceneObject[] = [];
    private hiddenObjects: Set<SceneObject> = new Set();
    private detectionCount: number = 0;
    
    onAwake() {
        this.log("=== DistanceHider with Particles Initialization Started ===");
        
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
            this.log("WARNING: Collision sound effect is not assigned.");
        } else {
            this.log(`✓ Collision sound effect assigned`);
        }
        
        if (!this.particleSystemPrefab) {
            this.log("WARNING: Particle system prefab is not assigned.");
        } else {
            this.log(`✓ Particle system prefab assigned`);
        }
        
        this.transform = this.movingObject.getTransform();
        
        // Get all target objects from the parent
        this.getTargetObjects(this.targetParent);
        this.log(`✓ Found ${this.targetObjects.length} target objects`);
        
        if (this.targetObjects.length === 0) {
            this.log("WARNING: No target objects found in target parent!");
        }
        
        this.log(`✓ Detection radius: ${this.detectionRadius}`);
        this.log(`✓ Particle burst: ${this.enableParticleBurst ? "Enabled" : "Disabled"}`);
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
        
        // Get object position before hiding
        const targetTransform = object.getTransform();
        const hidePosition = targetTransform.getWorldPosition();
        
        // Trigger particle burst
        if (this.enableParticleBurst) {
            this.triggerParticleBurst(hidePosition);
        }
        
        // Play collision sound effect
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
    
    private triggerParticleBurst(position: vec3) {
        if (!this.particleSystemPrefab) {
            return;
        }
        
        try {
            // Clone particle system
            const particleClone = this.particleSystemPrefab.clone();
            
            // Move to hide position
            const particleTransform = particleClone.getTransform();
            particleTransform.setWorldPosition(position);
            
            // Play particle system
            const particleSystem = particleClone.getComponent("ParticleSystem") as any;
            if (particleSystem && typeof particleSystem.play === 'function') {
                particleSystem.play();
                this.log(`✓ Particle burst triggered at (${position.x.toFixed(1)}, ${position.y.toFixed(1)}, ${position.z.toFixed(1)})`);
            } else {
                this.log(`WARNING: ParticleSystem component not found or play() not available`);
            }
            
            // Schedule destruction of particle clone
            this.scheduleDestroy(particleClone, 2.0);
        } catch (error) {
            this.log(`ERROR: Failed to trigger particle burst - ${error}`);
        }
    }
    
    private playCollisionSound() {
        if (!this.collisionSoundEffect) {
            return;
        }
        
        try {
            // Play the sound effect
            (this.collisionSoundEffect as any).play();
            this.log(`♪ Collision sound played`);
        } catch (error) {
            this.log(`ERROR: Failed to play collision sound`);
        }
    }
    
    private scheduleDestroy(object: SceneObject, delay: number) {
        try {
            const destroyEvent = this.createEvent("DelayedCallbackEvent");
            destroyEvent.bind(() => {
                if (object) {
                    try {
                        object.destroy();
                        this.log(`✓ Particle system destroyed`);
                    } catch (e) {
                        this.log(`WARNING: Failed to destroy particle system`);
                    }
                }
            });
            (destroyEvent as any).delay = delay;
        } catch (error) {
            this.log(`ERROR: Failed to schedule destroy - ${error}`);
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
        this.log(`Collision sound effect updated`);
    }
    
    public setParticleSystemPrefab(particleSystem: SceneObject) {
        this.particleSystemPrefab = particleSystem;
        this.log(`Particle system prefab updated`);
    }
    
    public setEnableParticleBurst(enable: boolean) {
        this.enableParticleBurst = enable;
        this.log(`Particle burst: ${enable ? "Enabled" : "Disabled"}`);
    }
}
