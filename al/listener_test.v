module al

import alc

fn test_listener_properties() {
	test := fn () {
		listener := new_listener()
		//
		value := 123
		//
		listener.set_gain(value)
		assert listener.get_gain() == value
		//
		listener.set_position(value, value, value)
		px, py, pz := listener.get_position()
		assert px == value && py == value && pz == value
		//
		listener.set_velocity(value, value, value)
		vx, vy, vz := listener.get_velocity()
		assert vx == value && vy == value && vz == value
		//
		look := [1.0, 2.0, 3.0]
		up := [4.0, 5.0, 6.0]
		mut orientation := []f32{len: 0}
		orientation << look
		orientation << up
		listener.set_orientation(orientation)
		orientation = listener.get_orientation()
	}
	///
	alc.do_test(test)
}
