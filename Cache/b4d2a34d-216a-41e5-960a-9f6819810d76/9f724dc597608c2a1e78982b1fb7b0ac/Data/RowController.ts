@component
export class RowController extends BaseScriptComponent {
    
    @input
    rowParents: SceneObject[] = [];
    
    @input
    distanceHider: DistanceHider;
    
    @input
    enableDebug: boolean = true;
    
    private currentRowIndex: number = 0;
    private rowObjectCounts: number[] = [];
    private rowHiddenCounts: number[] = [];
    private completedRows: Set<number> = new Set();
    private updateInterval: number = 0.1; // Check every 0.1 seconds
    private timeSinceLastCheck: number = 0;
    
    onAwake() {
        this.log("=== RowController Initialization Started ===");
        
        if (!this.distanceHider) {
            this.log("ERROR: DistanceHider is not assigned.");
            return;
        }
        this.log(`✓ DistanceHider assigned`);
        
        if (this.rowParents.length === 0) {
            this.log("ERROR: No row parents assigned.");
            return;
        }
        this.log(`✓ Found ${this.rowParents.length} row parents`);
        
        // Initialize row object counts
        this.initializeRows();
        
        // Show first row, hide others
        this.showRow(0);
        
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
            } else {
                this.log("All rows completed! Sequence finished.");
            }
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
        
        // Hide all rows
        for (let i = 0; i < this.rowParents.length; i++) {
            this.hideRow(i);
        }
        
        // Show target row
        this.currentRowIndex = rowIndex;
        this.showRow(rowIndex);
        
        // Mark previous rows as completed
        for (let i = 0; i < rowIndex; i++) {
            this.completedRows.add(i);
        }
    }
    
    public getRowStatus(): string {
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
}
