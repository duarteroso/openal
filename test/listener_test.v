module test

import openal.al

fn test_listener_properties() ? {
	test := fn () ? {
		listener := al.create_listener()
		//
		value := 123
		//
		listener.set_gain(value) ?
		gain := listener.get_gain() ?
		assert gain == value
		//
		listener.set_position(value, value, value) ?
		px, py, pz := listener.get_position() ?
		assert px == value && py == value && pz == value
		//
		listener.set_velocity(value, value, value) ?
		vx, vy, vz := listener.get_velocity() ?
		assert vx == value && vy == value && vz == value
		//
		look := [f32(1), 2, 3]
		up := [f32(4), 5, 6]
		mut orientation := []f32{len: 0}
		orientation << look
		orientation << up
		listener.set_orientation(orientation) ?
		orientation = listener.get_orientation() ?
	}
	///
	do_test(test)
}
