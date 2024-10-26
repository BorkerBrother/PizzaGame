extends Node2D

var velocity = Vector2(0, 0)  # Initiale Geschwindigkeit
var gravity = 1200  # Schwerkraft
var jump_strength = -700  # Sprungkraft (negativ für Aufwärtsbewegung)
var is_jumping = false  # Check, ob der Charakter springt
var ground_y = 630  # Y-Position des Bodens (kann angepasst werden)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Pizza_Run_Right")
	position.y = ground_y  # Charakter startet auf dem Boden

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Spieler springt, wenn die Leertaste gedrückt wird und der Charakter nicht springt
	if Input.is_action_just_pressed("ui_accept") and not is_jumping:
		is_jumping = true
		velocity.y = jump_strength  # Sprungkraft anwenden
		$AnimationPlayer.play("Pizza_Run_Right_Jump")  # Sprunganimation abspielen

	if is_jumping:
		# Schwerkraft anwenden, solange der Charakter in der Luft ist
		velocity.y += gravity * delta
		position.y += velocity.y * delta  # Ändere die Position des Charakters, nicht des AnimationPlayers
		
		# Prüfen, ob der Charakter den Boden berührt
		if position.y >= ground_y:
			position.y = ground_y  # Zurück auf den Boden
			velocity.y = 0  # Geschwindigkeit auf Null setzen
			is_jumping = false  # Sprung beenden
			$AnimationPlayer.play("Pizza_Run_Right")  # Laufanimation wieder abspielen
