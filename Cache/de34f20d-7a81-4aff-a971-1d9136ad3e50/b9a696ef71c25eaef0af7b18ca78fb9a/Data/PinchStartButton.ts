import {Interactable} from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import {InteractorEvent} from "SpectaclesInteractionKit.lspkg/Core/Interactor/InteractorEvent"

@component
export class PinchStartButton extends BaseScriptComponent {
    // The object to hide when pinched
    @input
    objectToHide: SceneObject

    // The Interactable component reference
    @input
    interactable: Interactable

    onAwake() {
        if (!this.interactable) {
            print("Error: Interactable component not assigned in inspector")
            return
        }

        if (!this.objectToHide) {
            print("Warning: objectToHide not assigned in inspector")
        }

        // Listen for pinch/button press
        this.interactable.onTriggerStart.add((interactorEvent: InteractorEvent) => {
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
