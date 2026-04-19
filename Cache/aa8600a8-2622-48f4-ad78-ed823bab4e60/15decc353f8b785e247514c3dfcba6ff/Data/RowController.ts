@component
export class RowController extends BaseScriptComponent {
    
    @input
    rowParents: SceneObject[] = [];
    
    @input
    distanceHider: BaseScriptComponent;
    
    @input
    enableDebug: boolean = true;
    
    @input
    uiTextElement: Text;
    
    @input
    rowTexts: string[] = [];
    
    @input
    rowClearedSoundEffect: AudioComponent;
    
    @input
    finalCompletionSoundEffect: AudioComponent;
    
    private currentRowIndex: number = 0;
    private rowObjectCounts: number[] = [];
    private rowHiddenCounts: number[] = [];
    private completedRows: Set<number> = new Set();
    private updateInterval: number = 0.1; // Check every 0.1 seconds
    private timeSinceLastCheck: number = 0;
    
    onAwake() {
        // Configure audio playback modes for low latency if assigned
        if (this.rowClearedSoundEffect) {
            try {
                (this.rowClearedSoundEffect as any).playbackMode = (Audio as any).PlaybackMode?.LowLatency || 1;
                this.log("✓ Row cleared sound playback mode set to LowLatency");
            } catch (error) {
                this.log("WARNING: Could not set row cleared audio playback mode - " + error);
            }
        }
        
        if (this.finalCompletionSoundEffect) {
            try {
                (this.finalCompletionSoundEffect as any).playbackMode = (Audio as any).PlaybackMode?.LowLatency || 1;
                this.log("✓ Final completion sound playback mode set to LowLatency");
            } catch (error) {
                this.log("WARNING: Could not set final completion audio playback mode - " + error);
            }
        }
        
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
        
        if (!this.rowClearedSoundEffect) {
            this.log("WARNING: Row cleared sound effect is not assigned. Row clears will be silent.");
        } else {
            this.log(`✓ Row cleared sound effect assigned`);
        }
        
        if (!this.finalCompletionSoundEffect) {
            this.log("WARNING: Final completion sound effect is not assigned. Completion will be silent.");
        } else {
            this.log(`✓ Final completion sound effect assigned`);
        }
        
        // Initialize row object counts
        this.initializeRows();
        
        // Show first row, hide others
        this.showRow(0);
        
        // Set initial target parent in distance hider
        this.reassignTargetParent(0);
        
        // Set initial UI text
        this.updateUIText(0);
        
        this.log("=== RowController Initialization Complete ===\n");
        
        // Set up update event
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
    }
    
    private initializeRows() {
        for (let i = 0; i < this.rowParents.length; i++) {
            const rowParent = this.rowParents[i];
            const childCount = this.countAllChildren(rowParent);
            this.rowObjectCounts.push(childCount);
            this.rowHiddenCounts.push(0);
            
            this.log(`Row ${i}: ${rowParent.name} - ${childCount} objects`);
        }
    }
    
    private countAllChildren(parent: SceneObject): number {
        let count = 0;
        const childCount = parent.getChildrenCount();
        
        for (let i = 0; i < childCount; i++) {
            const child = parent.getChild(i);
            count++;
            count += this.countAllChildren(child);
        }
        
        return count;
    }
    
    private onUpdate(eventData: UpdateEvent) {
        this.timeSinceLastCheck += getDeltaTime();
        
        if (this.timeSinceLastCheck >= this.updateInterval) {
            this.timeSinceLastCheck = 0;
            this.checkRowCompletion();
        }
    }
    
    private checkRowCompletion() {
        if (this.currentRowIndex >= this.rowParents.length) {
            this.log("All rows completed!");
            return;
        }
        
        // Get current hidden count from distance hider
        const totalHidden = (this.distanceHider as any).getHiddenObjectCount();
        
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
            
            // Play row cleared sound effect
            this.playRowClearedSound();
            
            // Move to next row
            if (this.currentRowIndex + 1 < this.rowParents.length) {
                this.currentRowIndex++;
                this.showRow(this.currentRowIndex);
                
                // Reassign target parent in distance hider to new row
                this.reassignTargetParent(this.currentRowIndex);
                
                // Update UI text for new row
                this.updateUIText(this.currentRowIndex);
            } else {
                this.log("All rows completed! Sequence finished.");
                // Play final completion sound
                this.playFinalCompletionSound();
            }
        }
    }
    
    private playRowClearedSound() {
        if (!this.rowClearedSoundEffect) {
            return;
        }
        
        try {
            // Play the sound effect with type assertion to bypass strict typing
            (this.rowClearedSoundEffect as any).play(1);
            this.log(`♪ Row cleared sound played`);
        } catch (error) {
            this.log(`ERROR: Failed to play row cleared sound - ${error}`);
        }
    }
    
    private playFinalCompletionSound() {
        if (!this.finalCompletionSoundEffect) {
            return;
        }
        
        try {
            // Play the sound effect with type assertion to bypass strict typing
            (this.finalCompletionSoundEffect as any).play(1);
            this.log(`♪ Final completion sound played`);
        } catch (error) {
            this.log(`ERROR: Failed to play final completion sound - ${error}`);
        }
    }
    
    private reassignTargetParent(rowIndex: number) {
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
            (this.distanceHider as any).targetParent = newTargetParent;
            this.log(`✓ Reassigned target parent to: ${newTargetParent.name}`);
            
            // Reset the target objects array in distance hider
            if ((this.distanceHider as any).targetObjects !== undefined) {
                (this.distanceHider as any).targetObjects = [];
                (this.distanceHider as any).targetTransforms = [];
                this.log(`✓ Cleared target objects array`);
            }
            
            // Call getTargetObjects if available to reinitialize
            if (typeof (this.distanceHider as any).getTargetObjects === 'function') {
                (this.distanceHider as any).getTargetObjects(newTargetParent);
                this.log(`✓ Reinitialized target objects for row ${rowIndex}`);
            }
        } catch (error) {
            this.log(`ERROR: Failed to reassign target parent - ${error}`);
        }
    }
    
    private updateUIText(rowIndex: number) {
        if (!this.uiTextElement) {
            this.log("WARNING: UI text element is not assigned");
            return;
        }
        
        if (rowIndex >= this.rowTexts.length) {
            this.log(`WARNING: No text defined for row ${rowIndex}`);
            return;
        }
        
        const textToDisplay = this.rowTexts[rowIndex];
        
        try {
            // Set text on UI element
            (this.uiTextElement as any).text = textToDisplay;
            this.log(`Updated UI text for row ${rowIndex}`);
        } catch (error) {
            this.log(`ERROR: Failed to update UI text - ${error}`);
        }
    }
    
    private showRow(rowIndex: number) {
        if (rowIndex >= this.rowParents.length) {
            this.log(`ERROR: Row index ${rowIndex} out of bounds`);
            return;
        }
        
        const rowParent = this.rowParents[rowIndex];
        this.log(`Showing row ${rowIndex}: ${rowParent.name}`);
        
        // Enable parent and all children recursively
        this.enableObjectAndChildren(rowParent);
    }
    
    private hideRow(rowIndex: number) {
        if (rowIndex >= this.rowParents.length) {
            this.log(`ERROR: Row index ${rowIndex} out of bounds`);
            return;
        }
        
        const rowParent = this.rowParents[rowIndex];
        this.log(`Hiding row ${rowIndex}: ${rowParent.name}`);
        
        // Disable parent and all children recursively
        this.disableObjectAndChildren(rowParent);
    }
    
    private enableObjectAndChildren(obj: SceneObject) {
        obj.enabled = true;
        
        const childCount = obj.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = obj.getChild(i);
            this.enableObjectAndChildren(child);
        }
    }
    
    private disableObjectAndChildren(obj: SceneObject) {
        obj.enabled = false;
        
        const childCount = obj.getChildrenCount();
        for (let i = 0; i < childCount; i++) {
            const child = obj.getChild(i);
            this.disableObjectAndChildren(child);
        }
    }
    
    private log(message: string) {
        if (this.enableDebug) {
            print(`[RowController] ${message}`);
        }
    }
    
    // Public methods
    
    public getCurrentRowIndex(): number {
        return this.currentRowIndex;
    }
    
    public getTotalRows(): number {
        return this.rowParents.length;
    }
    
    public getCompletedRowCount(): number {
        return this.completedRows.size;
    }
    
    public getRowProgress(): number {
        if (this.rowParents.length === 0) return 0;
        return (this.completedRows.size / this.rowParents.length) * 100;
    }
    
    public isRowCompleted(rowIndex: number): boolean {
        return this.completedRows.has(rowIndex);
    }
    
    public getRowObjectCount(rowIndex: number): number {
        if (rowIndex >= this.rowObjectCounts.length) return 0;
        return this.rowObjectCounts[rowIndex];
    }
    
    public resetAllRows() {
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
        
        // Update UI text
        this.updateUIText(0);
        
        // Clear completed rows
        this.completedRows.clear();
        
        this.log("All rows reset");
    }
    
    public skipToRow(rowIndex: number) {
        if (rowIndex >= this.rowParents.length) {
            this.log(`ERROR: Cannot skip to row ${rowIndex} (out of bounds)`);
            return;
        }
        
        this.log(`Skipping to row ${rowIndex}`);
        
        // Hide current row
        this.hideRow(this.currentRowIndex);
        
        // Update current row index
        this.currentRowIndex = rowIndex;
        
        // Show new row
        this.showRow(rowIndex);
        
        // Reassign target parent
        this.reassignTargetParent(rowIndex);
        
        // Update UI text
        this.updateUIText(rowIndex);
    }
    
    public setRowClearedSoundEffect(soundComponent: AudioComponent) {
        this.rowClearedSoundEffect = soundComponent;
        if (this.rowClearedSoundEffect) {
            try {
                (this.rowClearedSoundEffect as any).playbackMode = (Audio as any).PlaybackMode?.LowLatency || 1;
            } catch (error) {
                this.log("WARNING: Could not set row cleared audio playback mode");
            }
        }
        this.log(`Row cleared sound effect updated`);
    }
    
    public setFinalCompletionSoundEffect(soundComponent: AudioComponent) {
        this.finalCompletionSoundEffect = soundComponent;
        if (this.finalCompletionSoundEffect) {
            try {
                (this.finalCompletionSoundEffect as any).playbackMode = (Audio as any).PlaybackMode?.LowLatency || 1;
            } catch (error) {
                this.log("WARNING: Could not set final completion audio playback mode");
            }
        }
        this.log(`Final completion sound effect updated`);
    }
}
