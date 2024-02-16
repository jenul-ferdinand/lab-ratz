extends Node

# Wave class for generating smooth interpolation or tweening functions.
class_name Wave



# STATIC FUNCTION: Generates smooth interpolation between 'from' and 'to' over time.
# Parameters:
#	- from: Starting value.
#   - to: Ending value.
#   - duration: Duration of the wave.
#   - offset: Offset to customize the wave's phase.
#
# Returns:
# 	float: the interpolated value
static func wave(from, to, duration, offset) -> float:
	var a4 = (to - from) * 0.5
	return from + a4 + sin(((Time.get_ticks_msec() * 0.001) + duration * offset) / duration * (PI * 2)) * a4



# STATIC FUNCTION: Generates a scaled wave function by multiplying it with 'delta'.
# Parameters:
#   - from: Starting value.
#   - to: Ending value.
#   - duration: Duration of the wave.
#   - offset: Offset to customize the wave's phase.
#   - delta: Scaling factor.
# 
# Returns:
# 	float: the scaled interpolated value
static func wave_with_delta(from, to, duration, offset, delta):
	return wave(from, to, duration, offset) * delta