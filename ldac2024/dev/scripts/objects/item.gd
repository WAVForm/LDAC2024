extends Node

class_name Item

static var Headphones = Item.new("Headphones","An audio devices worn over ears to listen to sound privately. size 14.",Vector3i(0,0,0), 0, "res://2d asset/asset_2d_headphone.png")
static var CoyoteUrine = Item.new("Coyote Urine","A bottle of Canis latrans liquid excrement. size 1.5", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_CoyoteUrine.png")
static var MetalWaterBottle = Item.new("Metal Water Bottle","A reusable container designed to hold beverages, it is made of corrosion-resistant steel. size 6.",Vector3i(0,0,0), 0, "res://2d asset/asset_2d_WaterBottle.png")
static var NickCagePillow = Item.new("Nick Cage Pillow","A novelty pillow featuring actor Nicolas Cage. size 2.", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_NickCagePillow.png")
static var JawsPoster = Item.new("Poster","A poster of the production Jaws by Steven Spielberg", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_Poster_Jaw.png")
static var NightLightCat = Item.new("Night Light","A night light of a deformed feline", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_NightLight_Cat.png")
static var Canofbeans = Item.new("Can of beans","an edible seed grown in long pods on certain leguminous plants in a cylindrical metal container", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_CanBeans.png")
static var GraphicT = Item.new("GraphicT","aVintage Tees Men Oversized Graphic Goose Logo Tomato Soup Warhol Print Retro Streetwear T Shirts Casual Loose Fit Cotton Tops", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_GraphicT_1.png")
static  var SackofPotatoes =Item.new("SackofPotatoes","potato storage solution -  sturdy burlap jute material, designed to keep your potatoes fresh and protected for longer periods", Vector3i(0,0,0), 0, "")
static  var  HolyBible=Item.new("Holy Bible","New King James Version, easy-to-read large print, leathersoft, blue", Vector3i(0,0,0), 0, "")
static  var  PunkoPOP=Item.new("PunkoPOP","Bob Ross Collectible Figure - From the joy of painting, Bob Ross, as a stylized POP vinyl from Punko!", Vector3i(0,0,0), 0, "")
static  var  Television=Item.new("Television","an electronic device designed to display audio-visual content. size 72", Vector3i(0,0,0), 0, "")
static  var  Cologne=Item.new("Cologne","lavender scented toilet water to smell just right", Vector3i(0,0,0), 0, "")

static var Items:Array[Item] = [Headphones, CoyoteUrine, MetalWaterBottle, NickCagePillow, JawsPoster, NightLightCat, Canofbeans, GraphicT, SackofPotatoes, HolyBible, PunkoPOP, Television, Cologne]

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
