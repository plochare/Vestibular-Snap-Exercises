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
exports.CollisionHiderDebug = void 0;
var __selfType = requireType("./CollisionHider");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let CollisionHiderDebug = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var CollisionHiderDebug = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.movingObject = this.movingObject;
            this.speed = this.speed;
            this.direction = this.direction;
            this.targetParent = this.targetParent;
            this.colliders = [];
            this.colliderToObject = new Map();
            this.collisionCount = 0;
        }
        __initialize() {
            super.__initialize();
            this.movingObject = this.movingObject;
            this.speed = this.speed;
            this.direction = this.direction;
            this.targetParent = this.targetParent;
            this.colliders = [];
            this.colliderToObject = new Map();
            this.collisionCount = 0;
        }
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
            this.movingCollider = this.movingObject.getComponent("Component.ColliderComponent");
            if (!this.movingCollider) {
                print("⚠ Moving object does not have ColliderComponent. Attempting to create one...");
                try {
                    this.movingCollider = this.movingObject.createComponent("Component.ColliderComponent");
                    print("✓ ColliderComponent created on moving object");
                }
                catch (e) {
                    print(`ERROR: Failed to create ColliderComponent: ${e}`);
                    return;
                }
            }
            else {
                print("✓ Moving object already has ColliderComponent");
            }
            // Verify the collider is enabled
            print(`✓ Moving collider enabled: ${this.movingCollider.enabled}`);
            print(`✓ Moving collider is enabled in hierarchy: ${this.movingCollider.isEnabledInHierarchy}`);
            // Set up collision events
            try {
                this.movingCollider.onCollisionEnter.add(this.onCollisionEnter.bind(this));
                print("✓ onCollisionEnter event listener registered");
            }
            catch (e) {
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
            }
            catch (e) {
                print(`ERROR: Failed to register UpdateEvent: ${e}`);
                return;
            }
            print("=== CollisionHiderDebug: Initialization Complete ===\n");
        }
        getCollidersFromChildren(parent, depth = 0) {
            const indent = "  ".repeat(depth);
            const childCount = parent.getChildrenCount();
            print(`${indent}Checking parent: ${parent.name} (${childCount} children)`);
            for (let i = 0; i < childCount; i++) {
                const child = parent.getChild(i);
                const collider = child.getComponent("Component.ColliderComponent");
                if (collider) {
                    print(`${indent}  ✓ Found collider on: ${child.name}`);
                    print(`${indent}    - Enabled: ${collider.enabled}`);
                    print(`${indent}    - Enabled in hierarchy: ${collider.isEnabledInHierarchy}`);
                    this.colliders.push(collider);
                    this.colliderToObject.set(collider, child);
                }
                else {
                    print(`${indent}  ✗ NO collider on: ${child.name}`);
                }
                // Recursively check nested children
                this.getCollidersFromChildren(child, depth + 1);
            }
        }
        onUpdate(eventData) {
            if (!this.transform)
                return;
            const deltaTime = getDeltaTime();
            const currentPos = this.transform.getWorldPosition();
            // Calculate new position based on direction and speed
            const normalizedDir = this.direction.normalize();
            const movement = normalizedDir.uniformScale(this.speed * deltaTime);
            const newPos = currentPos.add(movement);
            this.transform.setWorldPosition(newPos);
        }
        onCollisionEnter(eventArgs) {
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
            }
            else {
                print(`✗ NOT a target child - ignoring collision`);
            }
            print(`<<< COLLISION ENTER EVENT COMPLETE >>>\n`);
        }
        onCollisionStay(eventArgs) {
            // Uncomment for very verbose logging
            // print(`Collision Stay: ${eventArgs.collision.collider.getSceneObject().name}`);
        }
        onCollisionExit(eventArgs) {
            print(`Collision Exit: ${eventArgs.collision.collider.getSceneObject().name}`);
        }
    };
    __setFunctionName(_classThis, "CollisionHiderDebug");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        CollisionHiderDebug = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return CollisionHiderDebug = _classThis;
})();
exports.CollisionHiderDebug = CollisionHiderDebug;
//# sourceMappingURL=CollisionHider.js.map