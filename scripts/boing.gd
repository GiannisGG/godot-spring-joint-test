extends Control

@onready var joint : DampedSpringJoint2D = $SpringSystem/DampedSpringJoint2D
@onready var line : Line2D = $SpringSystem/Line2D
@onready var hanging_object : RigidBody2D = $SpringSystem/RigidBody2D
@onready var base : StaticBody2D = $SpringSystem/StaticBody2D

func _ready():
	# Setting the initial values:
	$Labels/Sliders/MassVal.value = 2.0
	$Labels/Sliders/LengthVal.value = 200.0
	$Labels/Sliders/RestLengthVal.value = 50.0
	$Labels/Sliders/StiffnessVal.value = 20.0
	$Labels/Sliders/DampingVal.value = 0.2
	$Labels/Sliders/BiasVal.value = 0.3


func _physics_process(_delta) -> void:
	line.points[1] = hanging_object.position # Sets the line's 2nd point to hanging object.
	# Creating a thinning, elastic effect, as line lengthens:
	var current_length : float = (hanging_object.position - base.position).length()
	line.width = clamp(30 * 100 / current_length, 1, 30)


### The callbacks for all sliders' value changed signal:

func _on_length_val_value_changed(value):
	value = snapped(value, 0.01)
	$Labels/Values/LengthVal.text = str(value)
	joint.length = value


func _on_rest_length_val_value_changed(value):
	value = snapped(value, 0.01)
	$Labels/Values/RestLengthVal.text = str(value)
	joint.rest_length = value


func _on_stiffness_val_value_changed(value):
	value = snapped(value, 0.01)
	$Labels/Values/StiffnessVal.text = str(value)
	joint.stiffness = value


func _on_damping_val_value_changed(value):
	value = snapped(value, 0.01)
	$Labels/Values/DampingVal.text = str(value)
	joint.damping = value


func _on_bias_val_value_changed(value):
	value = snapped(value, 0.01)
	$Labels/Values/BiasVal.text = str(value)
	joint.bias = value


func _on_mass_val_value_changed(value):
	value = snapped(value, 0.1)
	$Labels/Values/MassVal.text = str(value)
	$SpringSystem/RigidBody2D.mass = value
