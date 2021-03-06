/obj/item/device/radio/exosuit
	name = "exosuit radio"

/obj/item/device/radio/exosuit/get_cell()
	. = ..()
	if(!.)
		var/mob/living/exosuit/E = loc
		if(istype(E)) return E.get_cell()

/obj/item/device/radio/exosuit/nano_host()
	var/mob/living/exosuit/E = loc
	if(istype(E))
		return E
	return null

/obj/item/device/radio/exosuit/attack_self(var/mob/user)
	var/mob/living/exosuit/exosuit = loc
	if(istype(exosuit) && exosuit.head && exosuit.head.radio && exosuit.head.radio.is_functional())
		user.set_machine(src)
		interact(user)
	else
		to_chat(user, SPAN_WARNING("The radio is too damaged to function."))

/obj/item/device/radio/exosuit/CanUseTopic()
	. = ..()
	if(.)
		var/mob/living/exosuit/exosuit = loc
		if(istype(exosuit) && exosuit.head && exosuit.head.radio && exosuit.head.radio.is_functional())
			return ..()
/obj/item/device/radio/exosuit/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = GLOB.mech_state)
	. = ..()
