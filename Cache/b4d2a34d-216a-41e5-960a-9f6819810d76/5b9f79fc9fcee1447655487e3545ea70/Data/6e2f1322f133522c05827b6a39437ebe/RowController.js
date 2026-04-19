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
exports.RowController = void 0;
var __selfType = requireType("./RowController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let RowController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var RowController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.rowParents = this.rowParents;
            this.distanceHider = this.distanceHider;
            this.enableDebug = this.enableDebug;
            this.currentRowIndex = 0;
            this.rowObjectCounts = [];
            this.rowHiddenCounts = [];
            this.completedRows = new Set();
            this.updateInterval = 0.1; // Check every 0.1 seconds
            this.timeSinceLastCheck = 0;
        }
        __initialize() {
            super.__initialize();
            this.rowParents = this.rowParents;
            this.distanceHider = this.distanceHider;
            this.enableDebug = this.enableDebug;
            this.currentRowIndex = 0;
            this.rowObjectCounts = [];
            this.rowHiddenCounts = [];
            this.completedRows = new Set();
            this.updateInterval = 0.1; // Check every 0.1 seconds
            this.timeSinceLastCheck = 0;
        }
        onAwake() {
            this.log("=== RowController Initialization Started ===");
            if (!this.distanceHider) {
                this.log("ERROR: Distance hider component is not assigned.");
                return;
            }
            this.log(`✓ Distance hider component assigned`);
            if (this.rowParents.length === 0) {
                this.log("ERROR: No row parents assigned.");
                return;
            }
            this.log(`✓ Found ${this.rowParents.length} row parents`);
            // Initialize row object counts
            this.initializeRows();
            // Show first row, hide others
            this.showRow(0);
            // Set initial target parent in distance hider
            this.reassignTargetParent(0);
            this.log("=== RowController Initialization Complete ===\n");
            // Set up update event
            this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
        }
        initializeRows() {
            for (let i = 0; i < this.rowParents.length; i++) {
                const rowParent = this.rowParents[i];
                const childCount = this.countAllChildren(rowParent);
                this.rowObjectCounts.push(childCount);
                this.rowHiddenCounts.push(0);
                this.log(`Row ${i}: ${rowParent.name} - ${childCount} objects`);
            }
        }
        countAllChildren(parent) {
            let count = 0;
            const childCount = parent.getChildrenCount();
            for (let i = 0; i < childCount; i++) {
                const child = parent.getChild(i);
                count++;
                count += this.countAllChildren(child);
            }
            return count;
        }
        onUpdate(eventData) {
            this.timeSinceLastCheck += getDeltaTime();
            if (this.timeSinceLastCheck >= this.updateInterval) {
                this.timeSinceLastCheck = 0;
                this.checkRowCompletion();
            }
        }
        checkRowCompletion() {
            if (this.currentRowIndex >= this.rowParents.length) {
                this.log("All rows completed!");
                return;
            }
            // Get current hidden count from distance hider
            const totalHidden = this.distanceHider.getHiddenObjectCount();
            // Calculate how many objects from current row are hidden
            let currentRowStartCount = 0;
            for (let i = 0; i < this.currentRowIndex; i++) {
                currentRowStartCount += this.rowObjectCounts[i];
            }
            const currentRowHidden = totalHidden - currentRowStartCount;
            const currentRowTotal = this.rowObjectCounts[this.currentRowIndex];
            this.log(`Row ${this.currentRowIndex}: ${currentRowHidden}/${currentRowTotal} hidden`);
            // Check if current row is completely hidden
            if (currentRowHidden >= currentRowTotal) {
                this.log(`Row ${this.currentRowIndex} completed!`);
                this.completedRows.add(this.currentRowIndex);
                // Move to next row
                if (this.currentRowIndex + 1 < this.rowParents.length) {
                    this.currentRowIndex++;
                    this.showRow(this.currentRowIndex);
                    // Reassign target parent in distance hider to new row
                    this.reassignTargetParent(this.currentRowIndex);
                }
                else {
                    this.log("All rows completed! Sequence finished.");
                }
            }
        }
        reassignTargetParent(rowIndex) {
            if (!this.distanceHider) {
                this.log("ERROR: Distance hider component reference not available");
                return;
            }
            if (rowIndex >= this.rowParents.length) {
                this.log(`ERROR: Row index ${rowIndex} out of bounds`);
                return;
            }
            const newTargetParent = this.rowParents[rowIndex];
            // Reassign target parent in distance hider
            try {
                this.distanceHider.targetParent = newTargetParent;
                this.log(`✓ Reassigned target parent to: ${newTargetParent.name}`);
                // Reset the target objects array in distance hider
                if (this.distanceHider.targetObjects !== undefined) {
                    this.distanceHider.targetObjects = [];
                    this.distanceHider.targetTransforms = [];
                    this.log(`✓ Cleared target objects array`);
                }
                // Call getTargetObjects if available to reinitialize
                if (typeof this.distanceHider.getTargetObjects === 'function') {
                    this.distanceHider.getTargetObjects(newTargetParent);
                    this.log(`✓ Reinitialized target objects for row ${rowIndex}`);
                }
            }
            catch (error) {
                this.log(`ERROR: Failed to reassign target parent`);
            }
        }
        showRow(rowIndex) {
            if (rowIndex >= this.rowParents.length) {
                this.log(`ERROR: Row index ${rowIndex} out of bounds`);
                return;
            }
            const rowParent = this.rowParents[rowIndex];
            this.log(`Showing row ${rowIndex}: ${rowParent.name}`);
            // Enable parent and all children recursively
            this.enableObjectAndChildren(rowParent);
        }
        hideRow(rowIndex) {
            if (rowIndex >= this.rowParents.length) {
                this.log(`ERROR: Row index ${rowIndex} out of bounds`);
                return;
            }
            const rowParent = this.rowParents[rowIndex];
            this.log(`Hiding row ${rowIndex}: ${rowParent.name}`);
            // Disable parent and all children recursively
            this.disableObjectAndChildren(rowParent);
        }
        enableObjectAndChildren(obj) {
            obj.enabled = true;
            const childCount = obj.getChildrenCount();
            for (let i = 0; i < childCount; i++) {
                const child = obj.getChild(i);
                this.enableObjectAndChildren(child);
            }
        }
        disableObjectAndChildren(obj) {
            obj.enabled = false;
            const childCount = obj.getChildrenCount();
            for (let i = 0; i < childCount; i++) {
                const child = obj.getChild(i);
                this.disableObjectAndChildren(child);
            }
        }
        log(message) {
            if (this.enableDebug) {
                print(`[RowController] ${message}`);
            }
        }
        // Public methods
        getCurrentRowIndex() {
            return this.currentRowIndex;
        }
        getTotalRows() {
            return this.rowParents.length;
        }
        getCompletedRowCount() {
            return this.completedRows.size;
        }
        getRowProgress() {
            if (this.rowParents.length === 0)
                return 0;
            return (this.completedRows.size / this.rowParents.length) * 100;
        }
        isRowCompleted(rowIndex) {
            return this.completedRows.has(rowIndex);
        }
        getRowObjectCount(rowIndex) {
            if (rowIndex >= this.rowObjectCounts.length)
                return 0;
            return this.rowObjectCounts[rowIndex];
        }
        resetAllRows() {
            this.log("Resetting all rows...");
            // Hide all rows
            for (let i = 0; i < this.rowParents.length; i++) {
                this.hideRow(i);
            }
            // Show first row
            this.currentRowIndex = 0;
            this.showRow(0);
            // Reassign to first row
            this.reassignTargetParent(0);
            // Clear completed rows
            this.completedRows.clear();
            this.log("All rows reset");
        }
        skipToRow(rowIndex) {
            if (rowIndex >= this.rowParents.length) {
                this.log(`ERROR: Cannot skip to row ${rowIndex} (out of bounds)`);
                return;
            }
            this.log(`Skipping to row ${rowIndex}`);
            // Hide all rows
            for (let i = 0; i < this.rowParents.length; i++) {
                this.hideRow(i);
            }
            // Show target row
            this.currentRowIndex = rowIndex;
            this.showRow(rowIndex);
            // Reassign to target row
            this.reassignTargetParent(rowIndex);
            // Mark previous rows as completed
            for (let i = 0; i < rowIndex; i++) {
                this.completedRows.add(i);
            }
        }
        getRowStatus() {
            let status = `Row Status:\n`;
            status += `Current Row: ${this.currentRowIndex}/${this.rowParents.length}\n`;
            status += `Completed: ${this.completedRows.size}/${this.rowParents.length}\n`;
            status += `Progress: ${this.getRowProgress().toFixed(1)}%\n`;
            for (let i = 0; i < this.rowParents.length; i++) {
                const completed = this.completedRows.has(i) ? "✓" : "○";
                const current = i === this.currentRowIndex ? " (CURRENT)" : "";
                status += `  ${completed} Row ${i}: ${this.rowParents[i].name}${current}\n`;
            }
            return status;
        }
    };
    __setFunctionName(_classThis, "RowController");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        RowController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return RowController = _classThis;
})();
exports.RowController = RowController;
//# sourceMappingURL=RowController.js.map