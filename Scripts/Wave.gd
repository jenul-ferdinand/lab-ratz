extends Node

class_name Wave

static func wave(from, to, duration, offset) -> float:
	var a4 = (to - from) * 0.5
	return from + a4 + sin(((Time.get_ticks_msec() * 0.001) + duration * offset) / duration * (PI * 2)) * a4

static func wave_with_delta(from, to, duration, offset, delta):
	return wave(from, to, duration, offset) * delta
