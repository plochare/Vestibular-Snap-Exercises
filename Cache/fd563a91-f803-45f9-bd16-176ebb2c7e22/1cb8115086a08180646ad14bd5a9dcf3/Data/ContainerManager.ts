@component
export class ContainerManager extends BaseScriptComponent {
    @input
    containerObjects: SceneObject[]; // Array of objects to track

    @input
    nextContainer: SceneObject; // The container to enable when all objects are hidden

    private hiddenCount: number = 0;
    private totalObjects: number = 0;

    onAwake() {
        if (this.containerObjects) {
            this.totalObjects = this.containerObjects.length;
        } else {
            print("ContainerManager: No objects assigned to track!");
        }

        if (!this.nextContainer) {
            print("ContainerManager: Next container is not assigned!");
        } else {
            // Ensure the next container is initially disabled
            this.nextContainer.enabled = false;
        }
    }

    // Called by ObjectHider when an object is hidden
    public onObjectHidden() {
        this.hiddenCount++;
        print("ContainerManager: Object hidden. Count: " + this.hiddenCount + "/" + this.totalObjects);

        if (this.hiddenCount >= this.totalObjects) {
            this.summonNextContainer();
        }
    }

    private summonNextContainer() {
        print("ContainerManager: All objects hidden! Summoning next container.");
        if (this.nextContainer) {
            this.nextContainer.enabled = true;
        }
    }
}
