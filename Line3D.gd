extends Node3D
class_name Line3D

@export var material:StandardMaterial3D

@onready var point1=$point1
@onready var point2=$point2

@onready var mesh=ImmediateMesh.new()
var instance=MeshInstance3D
var viewPorts:Array=[]
var cameras:Array=[]

@export var width=1.0

func _ready():	
	instance=MeshInstance3D.new()
	get_parent().add_child.call_deferred(instance)
	mesh=ImmediateMesh.new()
	instance.mesh=mesh


func _process(_delta):	
	var camera=get_viewport().get_camera_3d()
	
	var globalPoint1:Vector3=point1.global_position
	var globalpoint2:Vector3=point2.global_position
	var lineDirection=globalPoint1.direction_to(globalpoint2)
	
	var normal:Vector3 = -camera.global_transform.origin.direction_to(globalPoint1)	
	var widthVector:Vector3=normal.cross(globalPoint1.direction_to(globalpoint2)).normalized()
	normal=lineDirection.cross(widthVector)

	
		
	mesh.clear_surfaces()
	mesh.surface_begin(Mesh.PRIMITIVE_TRIANGLES,material)
	#vertices must be drawn in clockwise order
	#Triangle 1
	DrawAPoint(globalPoint1+widthVector*width,normal,Vector2(1,1))
	DrawAPoint(globalpoint2+widthVector*width,normal,Vector2(1,0))
	DrawAPoint(globalpoint2+widthVector*-width,normal,Vector2(0,0))	
	
	DrawAPoint(globalPoint1+widthVector*width,normal,Vector2(1,1))
	DrawAPoint(globalpoint2+widthVector*-width,normal,Vector2(0,0))
	DrawAPoint(globalPoint1+widthVector*-width,normal,Vector2(0,1))	

	mesh.surface_end()

	
		

func DrawAPoint(_position:Vector3,normal:Vector3,uv:Vector2)->void:
	mesh.surface_set_normal(normal)
	mesh.surface_set_uv(uv)
	mesh.surface_add_vertex(_position)
	
		
