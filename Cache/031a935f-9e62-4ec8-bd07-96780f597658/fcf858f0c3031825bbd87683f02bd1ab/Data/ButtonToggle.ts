import {Interactable} from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import {InteractorEvent} from "SpectaclesInteractionKit.lspkg/Core/Interactor/InteractorEvent"

@component
export class ButtonToggle extends BaseScriptComponent {
    // The first object to turn off
    @input
    objectToTurnOff: SceneObject

    // The second object to turn on
    @input
    objectToTurnOn: SceneObject

    onAwake() {
        // Get the Interactable component from this SceneObject
        const interactable = this.getComponent<Interactable>(Interactable.getTypeName())
        
        if (!interactable) {
            print("Error: Interactable component not found on this SceneObject")
            return
        }

        // Listen for button press
        interactable.onTriggerStart.add((interactorEvent: InteractorEvent) => {
            this.onButtonPressed()
        })
    }

    private onButtonPressed() {
        // Turn off the first object
        if (this.objectToTurnOff) {
            this.objectToTurnOff.enabled = false
        }

        // Turn on the second object
        if (this.objectToTurnOn) {
            this.objectToTurnOn.enabled = true
        }
    }
}
