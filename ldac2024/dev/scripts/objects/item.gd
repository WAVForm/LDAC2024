extends Node

class_name Item

static var Headphones = Item.new("Headphones","An audio devices worn over ears to listen to sound privately. size 14.",Vector3i(0,0,0), 0, "res://2d asset/asset_2d_headphone.png")
static var CoyoteUrine = Item.new("Coyote Urine","A bottle of Canis latrans liquid excrement. size 1.5", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_CoyoteUrine.png")
static var MetalWaterBottle = Item.new("Metal Water Bottle","A reusable container designed to hold beverages, it is made of corrosion-resistant steel. size 6.",Vector3i(0,0,0), 0, "res://2d asset/asset_2d_WaterBottle.png")
static var NickCagePillow = Item.new("Nick Cage Pillow","A novelty pillow featuring actor Nicolas Cage. size 2.", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_NickCagePillow.png")
static var JawsPoster = Item.new("Poster","A poster of the production Jaws by Steven Spielberg", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_Poster_Jaw.png")
static var NightLightCat = Item.new("Night Light","A night light of a deformed feline", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_NightLight_Cat.png")

static var Items:Array[Item] = [Headphones, CoyoteUrine, MetalWaterBottle, NickCagePillow, JawsPoster, NightLightCat]

@export var title: String
@export var description: String
@export var coords: Vector3i
@export var truck: int
@export var image: Image

func _init(p_title:String, p_desc: String, p_coords: Vector3i, p_truck: int, p_imgpath: String) -> void:
	title = p_title
	description = p_desc
	coords = p_coords
	truck = p_truck
	image = Image.load_from_file(p_imgpath)
