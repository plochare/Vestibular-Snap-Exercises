// Reference your component
@input
bodyComponent: Physics.BodyComponent;

onAwake() {
    // Bind the collision handler
    this.bodyComponent.onCollisionEnter.add(this.handleCollisionEnter.bind(this));
}

handleCollisionEnter(event: Physics.CollisionEventArgs) {
    const otherObject = event.collision.collider.getSceneObject();
    print("Collided with: " + otherObject.name);
}