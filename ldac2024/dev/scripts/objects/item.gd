extends Node

class_name Item

static var Headphones = Item.new("Headphones","An audio devices worn over ears to listen to sound privately. size 14.",Vector3i(0,0,0), 0, "res://2d asset/asset_2d_headphone.png")
static var CoyoteUrine = Item.new("Coyote Urine","A bottle of Canis latrans liquid excrement. size 1.5", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_CoyoteUrine.png")
static var MetalWaterBottle = Item.new("Metal Water Bottle","A reusable container designed to hold beverages, it is made of corrosion-resistant steel. size 6.",Vector3i(0,0,0), 0, "res://2d asset/asset_2d_WaterBottle.png")
static var NickCagePillow = Item.new("Nick Cage Pillow","A novelty pillow featuring actor Nicolas Cage. size 2.", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_NickCagePillow.png")
static var JawsPoster = Item.new("Poster","A poster of the production Jaws by Steven Spielberg", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_Poster_Jaw.png")
static var NightLightCat = Item.new("Night Light","A night light of a deformed feline", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_NightLight_Cat.png")
static var Canofbeans = Item.new("Can of Beans","An edible seed grown in long pods on certain leguminous plants, contained in a cylindrical metal container", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_CanBeans.png")
static var GraphicT = Item.new("Graphic Tee: Box","Vintage Tee Men Oversized Graphic Box Logo Print Retro Streetwear T Shirts Casual Loose Fit Cotton Tops", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_GraphicT_1.png")
static  var SackofPotatoes = Item.new("Sack of Potatoes","Potato storage solution - sturdy burlap jute material, designed to keep your potatoes fresh and protected for longer periods", Vector3i(0,0,0), 0, "res://2d asset/potatoes_icon.png")
static  var HolyBible = Item.new("Holy Bible","New King James Version, easy-to-read large print, leathersoft, blue", Vector3i(0,0,0), 0, "res://2d asset/bible_icon.png")
static  var PunkoPOP = Item.new("PunkoFOP","Bob Ross Collectible Figure - From the joy of painting, Bob Ross, as a stylized FOP vinyl from Punko!", Vector3i(0,0,0), 0, "res://2d asset/Funko_icon.png")
static  var Television = Item.new("Television","An electronic device designed to display audio-visual content. size 72", Vector3i(0,0,0), 0, "res://2d asset/tv_icon.png")
static  var Cologne = Item.new("Cologne","Lavender scented eu de toilet to smell just right", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_Cologne.png")
static var GraphicT2 = Item.new("Graphic Tee: Goose","Vintage Tees Men Oversized Graphic Goose Logo Print Retro Streetwear T Shirts Casual Loose Fit Cotton Tops", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_GraphicT_2.png")
static var GraphicT3 = Item.new("Graphic Tee: Soup","Vintage Tees Men Oversized Tomato Soup Warhol Print Retro Streetwear T Shirts Casual Loose Fit Cotton Tops", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_GraphicT_3.png")
static var GhostBustersPoster = Item.new("Poster","A poster of the production GhostBusters by Steven Spielberg", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_Poster_Ghostbuster.png")
static var TerminatorPoster = Item.new("Poster","A poster of the production Terminator by Steven Spielberg", Vector3i(0,0,0), 0, "res://2d asset/asset_2d_Poster_Terminator.png")
static  var Generator = Item.new("Generator","A device that converts petroleum derivatives into electric power for use in an external circuit.", Vector3i(0,0,0), 0, "res://2d asset/generator_icon.png")
static  var Gun = Item.new("Gun","It's a gun. 49 State Legal* (*Not legal for sale in California).", Vector3i(0,0,0), 0, "res://2d asset/gun_icon.png")

static var Items:Array[Item] = [Headphones, CoyoteUrine, MetalWaterBottle, NickCagePillow, JawsPoster, NightLightCat, Canofbeans, GraphicT, SackofPotatoes, HolyBible, PunkoPOP, Television, Cologne, GraphicT2, GraphicT3, GhostBustersPoster, TerminatorPoster, Generator, Gun]

@export var title: String
@export var description: String
@export var coords: Vector3i
@export var truck: int
@export var image: Image

func _init(p, p_desc: String="", p_coords: Vector3i=Vector3i(0,0,0), p_truck: int=0, p_imgpath: String="") -> void:
	if p is Item:
		title = p.title
		description = p.description
		coords = p.coords
		truck = p.truck
		image = p.image
	else:
		title = p
		description = p_desc
		coords = p_coords
		truck = p_truck
		image = Image.load_from_file(p_imgpath)
