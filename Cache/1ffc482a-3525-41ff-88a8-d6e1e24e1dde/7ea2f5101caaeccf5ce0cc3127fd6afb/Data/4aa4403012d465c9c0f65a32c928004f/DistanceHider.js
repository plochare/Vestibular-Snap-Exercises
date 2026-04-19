"use strict";
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.DistanceHider = void 0;
var __selfType = requireType("./DistanceHider");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let DistanceHider = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var DistanceHider = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.movingObject = this.movingObject;
            this.speed = this.speed;
            this.direction = this.direction;
            this.targetParent = this.targetParent;
            this.detectionRadius = this.detectionRadius;
            this.enableDebug = this.enableDebug;
            this.collisionSoundEffect = this.collisionSoundEffect;
            this.targetObjects = [];
            this.hiddenObjects = new Set();
            this.detectionCount = 0;
        }
        __initialize() {
            super.__initialize();
            this.movingObject = this.movingObject;
            this.speed = this.speed;
            this.direction = this.direction;
            this.targetParent = this.targetParent;
            this.detectionRadius = this.detectionRadius;
            this.enableDebug = this.enableDebug;
            this.collisionSoundEffect = this.collisionSoundEffect;
            this.targetObjects = [];
            this.hiddenObjects = new Set();
            this.detectionCount = 0;
        }
        onAwake() {
            this.collisionSoundEffect.playbackMode = Audio.PlaybackMode.LowLatency;
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
            }
            else {
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
        getTargetObjects(parent) {
            const childCount = parent.getChildrenCount();
            for (let i = 0; i < childCount; i++) {
                const child = parent.getChild(i);
                this.targetObjects.push(child);
                this.log(`Found target object: ${child.name}`);
                // Recursively check nested children
                this.getTargetObjects(child);
            }
        }
        onUpdate(eventData) {
            if (!this.transform)
                return;
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
        checkDistances(movingPos) {
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
        calculateDistance(pos1, pos2) {
            const dx = pos1.x - pos2.x;
            const dy = pos1.y - pos2.y;
            const dz = pos1.z - pos2.z;
            return Math.sqrt(dx * dx + dy * dy + dz * dz);
        }
        hideObject(object, distance) {
            this.log(`HIDING: ${object.name} (distance: ${distance.toFixed(2)})`);
            this.detectionCount++;
            // Disable the entire object
            object.enabled = false;
            this.hiddenObjects.add(object);
            // Play collision sound effect
            this.playCollisionSound();
            // Verify it was disabled
            if (!object.enabled) {
                this.log(`✓ Successfully hidden: ${object.name}`);
            }
            else {
                this.log(`✗ FAILED to hide: ${object.name}`);
            }
        }
        playCollisionSound() {
            // if (!this.collisionSoundEffect) {
            //  return;
            // }
            try {
                // Play the sound effect
                this.collisionSoundEffect.play();
                this.log(`♪ Collision sound played`);
            }
            catch (error) {
                this.log(`ERROR: Failed to play collision sound`);
            }
        }
        log(message) {
            if (this.enableDebug) {
                print(`[DistanceHider] ${message}`);
            }
        }
        // Public methods
        resetScene() {
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
        getDetectionCount() {
            return this.detectionCount;
        }
        getHiddenObjectCount() {
            return this.hiddenObjects.size;
        }
        setSpeed(newSpeed) {
            this.speed = newSpeed;
            this.log(`Speed set to ${newSpeed}`);
        }
        setDirection(newDirection) {
            this.direction = newDirection;
            this.log(`Direction set to (${newDirection.x}, ${newDirection.y}, ${newDirection.z})`);
        }
        setDetectionRadius(newRadius) {
            this.detectionRadius = newRadius;
            this.log(`Detection radius set to ${newRadius}`);
        }
        setCollisionSoundEffect(soundComponent) {
            this.collisionSoundEffect = soundComponent;
            this.log(`Collision sound effect updated`);
        }
    };
    __setFunctionName(_classThis, "DistanceHider");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        DistanceHider = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return DistanceHider = _classThis;
})();
exports.DistanceHider = DistanceHider;
//# sourceMappingURL=DistanceHider.js.map