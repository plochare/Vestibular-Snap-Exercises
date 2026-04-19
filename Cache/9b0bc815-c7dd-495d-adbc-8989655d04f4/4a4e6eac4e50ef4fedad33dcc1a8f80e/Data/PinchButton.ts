@component
export class PinchButton extends BaseScriptComponent {
    
    @input
    containerToShow: SceneObject;
    
    @input
    containerToHide: SceneObject;
    
    @input
    enableDebug: boolean = true;
    
    onAwake() {
        this.log("=== PinchButton Initialization Started ===");
        
        if (!this.containerToShow) {
            this.log("WARNING: Container to show is not assigned.");
        } else {
            this.log(`✓ Container to show assigned: ${this.containerToShow.name}`);
        }
        
        if (!this.containerToHide) {
            this.log("WARNING: Container to hide is not assigned.");
        } else {
            this.log(`✓ Container to hide assigned: ${this.containerToHide.name}`);
        }
        
        // Set up pinch gesture
        this.setupPinchGesture();
        
        this.log("=== PinchButton Initialization Complete ===\n");
    }
    
    private setupPinchGesture() {
        // Create and bind pinch event
        const pinchEvent = this.createEvent("PinchEvent");
        pinchEvent.bind(this.onPinch.bind(this));
        
        this.log("✓ Pinch gesture event bound");
    }
    
    private onPinch(eventData: PinchEvent) {
        // Trigger on pinch end (when user completes the gesture)
        if (eventData.state === GestureState.Ended) {
            this.executeAction();
        }
    }
    
    private executeAction() {
        // Show container
        if (this.containerToShow) {
            this.containerToShow.enabled = true;
            this.log(`✓ Showed: ${this.containerToShow.name}`);
        }
        
        // Hide container
        if (this.containerToHide) {
            this.containerToHide.enabled = false;
            this.log(`✓ Hidden: ${this.containerToHide.name}`);
        }
    }
    
    private log(message: string) {
        if (this.enableDebug) {
            print(`[PinchButton] ${message}`);
        }
    }
    
    // Public methods
    
    public execute() {
        this.executeAction();
    }
    
    public show() {
        if (this.containerToShow) {
            this.containerToShow.enabled = true;
            this.log(`Manually showed: ${this.containerToShow.name}`);
        }
    }
    
    public hide() {
        if (this.containerToHide) {
            this.containerToHide.enabled = false;
            this.log(`Manually hidden: ${this.containerToHide.name}`);
        }
    }
    
    public getContainerToShow(): SceneObject {
        return this.containerToShow;
    }
    
    public setContainerToShow(container: SceneObject) {
        this.containerToShow = container;
        this.log(`Container to show updated: ${container.name}`);
    }
    
    public getContainerToHide(): SceneObject {
        return this.containerToHide;
    }
    
    public setContainerToHide(container: SceneObject) {
        this.containerToHide = container;
        this.log(`Container to hide updated: ${container.name}`);
    }
    
    public getStatus(): string {
        let status = "PinchButton Status:\n";
        status += `Container to Show: ${this.containerToShow ? this.containerToShow.name : "Not assigned"}\n`;
        status += `Container to Hide: ${this.containerToHide ? this.containerToHide.name : "Not assigned"}\n`;
        return status;
    }
}
