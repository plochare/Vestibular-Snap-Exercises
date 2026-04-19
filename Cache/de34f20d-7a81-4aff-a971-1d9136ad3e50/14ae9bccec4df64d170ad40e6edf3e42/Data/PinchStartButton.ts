import {Interactable} from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import {InteractorEvent} from "SpectaclesInteractionKit.lspkg/Core/Interactor/InteractorEvent"

@component
export class PinchStartButton extends BaseScriptComponent {
    // The object to hide when pinched
    @input
    objectToHide: SceneObject

    onAwake() {
        // Get the Interactable component from this SceneObject
        const interactable = this.getComponent<Interactable>(Interactable.getTypeName())
        
        if (!interactable) {
            print("Error: Interactable component not found on this SceneObject")
            return
        }

        // Listen for pinch/button press
        interactable.onTriggerStart.add((interactorEvent: InteractorEvent) => {
            this.onPinch()
        })
    }

    private onPinch() {
        // Hide the object by disabling it
        if (this.objectToHide) {
            this.objectToHide.enabled = false
            print("Object hidden: " + this.objectToHide.name)
        }
    }
}
