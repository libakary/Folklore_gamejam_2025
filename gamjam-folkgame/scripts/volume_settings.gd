extends VBoxContainer

var mVolume
var beforeMuteMaster
var muteMaster = false
var busID
@onready var master: HSlider = $HBoxContainer/Master
@onready var music: HSlider = $HBoxContainer2/Music
@onready var sfx: HSlider = $HBoxContainer3/SFX
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	master.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	music.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	sfx.value = db_to_linear(AudioServer.get_bus_volume_db(2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func apply():
	release_focus()
	AudioServer.set_bus_volume_db(0, linear_to_db(busID.value))

func mute():
	if busID.value != 0:
		beforeMuteMaster = busID.value
		busID.value = 0
		muteMaster = true
	elif muteMaster and busID.value == 0:
		busID.value = beforeMuteMaster
		muteMaster = false
	apply()

func volDown():
	mVolume = busID.value - 0.05
	busID.value = mVolume
	apply()

func volUp():
	mVolume = busID.value + 0.05
	busID.value = mVolume
	apply()

func _on_mute_pressed() -> void:
	busID = master
	mute()

func _on_down_pressed() -> void:
	busID = master
	volDown()

func _on_master_mouse_exited() -> void:
	busID = master
	apply()

func _on_up_pressed() -> void:
	busID = master
	volUp()

func _on_mute_music_pressed() -> void:
	busID = music
	mute()

func _on_vol_down_music_pressed() -> void:
	busID = music
	volDown()

func _on_music_mouse_exited() -> void:
	busID = master
	apply()

func _on_vol_up_music_pressed() -> void:
	busID = music
	volUp()

func _on_mute_sfx_pressed() -> void:
	busID = sfx
	mute()

func _on_vol_down_sfx_pressed() -> void:
	busID = sfx
	volDown()

func _on_sfx_mouse_exited() -> void:
	busID = sfx
	apply()

func _on_vol_up_sfx_pressed() -> void:
	busID = sfx
	volUp()
