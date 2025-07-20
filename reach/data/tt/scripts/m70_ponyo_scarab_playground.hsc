(script continuous reiko_needs_a_checkpoint
    (if (player_action_test_dpad_up) 
        (begin
            (chud_post_message_hack "saving...")
            (game_save_no_timeout)
            (player_disable_movement true)
            (sleep (* 30.0 60.0 0.02))
            (player_disable_movement false)
            (player_action_test_reset)
        )
    )
    (if (player_action_test_dpad_down) 
        (begin
            (chud_post_message_hack "reverting...")
            (sleep 5)
            (game_revert)
            (player_action_test_reset)
        )
    )
    (if (player_action_test_dpad_right) 
        (begin
            (set dropping true)
            (player_action_test_reset)
        )
    )
)

(script continuous drop0_far
    (if (= dropping true) 
        (begin
            (chud_post_message_hack "::: --- ::: drop0_far")
            (object_create "dm_drop_scarab_1_far")
            (device_set_power "dm_drop_scarab_1_far" 1.0)
            (device_set_position_track "dm_drop_scarab_1_far" "device:scarab_drop" 0.0)
            (device_animate_position "dm_drop_scarab_1_far" 1.0 10 0.034 0.034 false)
            (sleep (- (* 10 30.0) 2.0))
            (sleep_until 
                (begin
                    (device_set_position_track "dm_drop_scarab_1_far" "stationary_march" 0.0)
                    (device_animate_position "dm_drop_scarab_1_far" 1.0 (random_range 7 10) 1.0 1.0 true)
                    (sleep_until (>= (device_get_position "dm_drop_scarab_1_far") 1.0) 1)
                    (sleep (random_range 0 20))
                    false
                )
            )
            (sleep 50)
            (object_create "dm_drop_scarab_2_far")
            (device_set_power "dm_drop_scarab_2_far" 1.0)
            (device_set_position_track "dm_drop_scarab_2_far" "device:scarab_drop" 0.0)
            (device_animate_position "dm_drop_scarab_2_far" 1.0 10 0.034 0.034 false)
            (sleep (- (* 10 30.0) 2.0))
            (sleep_until 
                (begin
                    (device_set_position_track "dm_drop_scarab_2_far" "stationary_march" 0.0)
                    (device_animate_position "dm_drop_scarab_2_far" 1.0 (random_range 7 10) 1.0 1.0 true)
                    (sleep_until (>= (device_get_position "dm_drop_scarab_2_far") 1.0) 1)
                    (sleep (random_range 0 20))
                    false
                )   
            )
            (sleep 50)
            (object_create "dm_drop_scarab_3_far")
            (device_set_power "dm_drop_scarab_3_far" 1.0)
            (device_set_position_track "dm_drop_scarab_3_far" "device:scarab_drop" 0.0)
            (device_animate_position "dm_drop_scarab_3_far" 1.0 10 0.034 0.034 false)
            (sleep (- (* 10 30.0) 2.0))
            (sleep_until 
                (begin
                    (device_set_position_track "dm_drop_scarab_3_far" "stationary_march" 0.0)
                    (device_animate_position "dm_drop_scarab_3_far" 1.0 (random_range 7 10) 1.0 1.0 true)
                    (sleep_until (>= (device_get_position "dm_drop_scarab_3_far") 1.0) 1)
                    (sleep (random_range 0 20))
                    false
                )
            )
            (set dropping false)
        )
    )
)

(script continuous drop1
    (if (= dropping true) 
        (begin
        	(sleep 45)
            (object_create_anew "dm_drop_scarab_1")
            (device_set_position_track "dm_drop_scarab_1" "device:scarab_drop" 0.0)
            (device_animate_position "dm_drop_scarab_1" 1.0 s_drop_scarab_1_drop_time 0.034 0.034 false)
            (sleep (- (* s_drop_scarab_1_drop_time 30.0) 2.0))
            (device_set_position_track "dm_drop_scarab_1" "device:idle_2_move_front" 0.0)
            (device_animate_position "dm_drop_scarab_1" 1.0 s_drop_scarab_1_idlewalk_time 0.034 0.034 false)
            (sleep (- (* s_drop_scarab_1_idlewalk_time 30.0) 2.0))
            (sleep_until 
                (begin
                    (device_set_position_track "dm_drop_scarab_1" "device:move_front" 0.0)
                    (device_animate_position "dm_drop_scarab_1" 1.0 s_drop_scarab_1_walk_time 0.034 0.034 false)
                    (set s_drop_scarab_1_loop_idx (+ s_drop_scarab_1_loop_idx 1.0))
                    (sleep (- (* s_drop_scarab_1_walk_time 30.0) 2.0))
                    (>= s_drop_scarab_1_loop_idx s_drop_scarab_1_loops)
                ) 
            1)
            (device_set_position_track "dm_drop_scarab_1" "device:m70_scarab_climb" 0.0)
            (device_animate_position "dm_drop_scarab_1" 1.0 s_drop_scarab_1_climb_time 0.034 0.034 false)
            (sleep (- (* s_drop_scarab_1_climb_time 30.0) 2.0))
            (set dropping false)
            (object_destroy "dm_drop_scarab_1")
        )
    )
)

(script continuous drop2
    (if (= dropping true) 
        (begin
            (sleep 90)
            (object_create_anew "dm_drop_scarab_2")
            (device_set_position_track "dm_drop_scarab_2" "device:scarab_drop" 0.0)
            (device_animate_position "dm_drop_scarab_2" 1.0 s_drop_scarab_2_drop_time 0.034 0.034 false)
            (sleep (- (* s_drop_scarab_2_drop_time 30.0) 2.0))
            (device_set_position_track "dm_drop_scarab_2" "device:idle_2_move_front" 0.0)
            (device_animate_position "dm_drop_scarab_2" 1.0 s_drop_scarab_2_idlewalk_time 0.034 0.034 false)
            (sleep (- (* s_drop_scarab_2_idlewalk_time 30.0) 2.0))
            (sleep_until 
                (begin
                    (device_set_position_track "dm_drop_scarab_2" "device:move_front_up" 0.0)
                    (device_animate_position "dm_drop_scarab_2" 1.0 s_drop_scarab_2_walk_time 0.034 0.034 false)
                    (set s_drop_scarab_2_wkloop_idx (+ s_drop_scarab_2_wkloop_idx 1.0))
                    (sleep (- (* s_drop_scarab_2_walk_time 30.0) 2.0))
                    (>= s_drop_scarab_2_wkloop_idx s_drop_scarab_2_wkloops)
                ) 
            1)
            (device_set_position_track "dm_drop_scarab_2" "device:m70_scarab_climb" 0.0)
            (print "init anim start")
            (device_animate_position "dm_drop_scarab_2" 1.0 s_drop_scarab_2_climb_time 0.034 0.034 false)
            (sleep (- (* s_drop_scarab_2_climb_time 30.0) 2.0))
            (set dropping false)
            (object_destroy "dm_drop_scarab_2")
        )
    )
)

(script startup void m70
    (print "m70 playground go!")
)

(script continuous yell_at_me
    (sleep_until (volume_test_players "tv_sekela_scarabs") 1)
    (print "in the scarab trigger!")
)

(script continuous advert_self_destruct
    (object_create "advert_popup")
    (sleep_until (volume_test_players "tv_advert") 1)
    (sleep_until (not (volume_test_players "tv_advert")) 1)
    (print "advert_popup is marked for destruction")
    (sleep 250)
    (object_destroy "advert_popup")
    (print "advert_popup is destroyed")
    (sleep_forever)
)
