extends Node
var death_count = 0
var glob_death_count = 0
func update_death():
	death_count += 1
func display_death():
	return death_count
func update_glob_death():
	glob_death_count += 1
func display_glob_death():
	return glob_death_count
func reset_death():
	death_count = 0
