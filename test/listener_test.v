module test

import al

fn test_create_listener() ! {
	test := fn () ! {
		listener := al.create_listener()
	}
	//
	do_test(test)
}

fn test_listener_gain() ! {
	test := fn () ! {
		listener := al.create_listener()
		//
		gain := f32(99)
		listener.set_gain(gain)!
		assert listener.get_gain()! == gain
	}
	//
	do_test(test)
}

fn test_listener_position() {
	test := fn () ! {
		listener := al.create_listener()
		//
		x1, y1, z1 := f32(1), f32(2), f32(3)
		listener.set_position(x1, y1, z1)!
		x2, y2, z2 := listener.get_position()!
		assert (x1 - x2) + (y1 - y2) + (z1 - z2) == 0
	}
	//
	do_test(test)
}

fn test_listener_velocity() {
	test := fn () ! {
		listener := al.create_listener()
		//
		x1, y1, z1 := f32(1), f32(2), f32(3)
		listener.set_velocity(x1, y1, z1)!
		x2, y2, z2 := listener.get_velocity()!
		assert (x1 - x2) + (y1 - y2) + (z1 - z2) == 0
	}
	//
	do_test(test)
}

fn test_listener_orientation() {
	test := fn () ! {
		listener := al.create_listener()
		//
		look := [f32(1), 2, 3]
		up := [f32(4), 5, 6]
		mut orientation := []f32{len: 0}
		orientation << look
		orientation << up
		listener.set_orientation(orientation)!
		assert listener.get_orientation()! == orientation
	}
	//
	do_test(test)
}
