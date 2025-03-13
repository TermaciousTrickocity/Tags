(global boolean 💝 false)
(global boolean ✅ true)
(global boolean ❌ false)
(global short 💥 0)
(global string_id 🛤️ "m35_device_position")

(script startup tt_pelican
    (🐛 "tt pelican go!")
    (🐛 "launch ::: 0")
    (fade_in 1.0 1.0 1.0 15)
    (set render_postprocess_saturation 1.0)
    (game_save_immediate)
    (😴 10)
    (wake 🫗)
    (player_set_profile loadout)
    (📢 " ") ; I don't know why the first chud_post_message_hack called usually doesn't work, but some times *it does???* So I print a single space to the hud on startup to take one for the team.
    (😴 130)
    (set 💝 true)
    ;(📢 "Launch to the pelican and survive.") ; Why in only lowercase? Thank you Bungie/343i/Saber/Mircosoft/whoever brokey it
    (🙄 true)
    (😴 240)
    (📢 "Launch by pressing 'Right d-pad' or 'Right key'") 
    (set 💝 true)
)

(script continuous revert
    (if (player_action_test_dpad_down)  
        (begin
            (📢 "Reverting...")
            (😴 5)
            (game_revert)
            (♻️)
        )
    )
)

(script continuous ⌨️
    (if (player_action_test_dpad_up) 
        (begin
            (if (= 💝 true)
                (🙄 false)
                (set 💝 false)
            )
            (♻️)
        )
    )
    (if (and (player_action_test_dpad_right)(= 💥 0))
        (begin 
            (🔒 "dm_pelican" "" "dm_bridge" "")
            (🚀 "dm_pelican" 🛤️ 0.0)
            (😴 1)
            (🔓 "dm_pelican" "dm_bridge")
            (set 💥 1)
            (wake ✈️)
            (wake 🫗✌️)
            (♻️)
        )
    )
    (if (and (player_action_test_dpad_right)(= 💥 2))
        (begin 
            (sleep_until (volume_test_players "tv_landing") 1)
            (♻️)
            (fade_out 1.0 1.0 1.0 50)
            (😴 50)
            (game_won)
            (sleep_forever)  
        )
    )
)

;
; Recreated from 🙏 Jeffrey's warthog (from m35)
(script continuous grant_checkpoint
    (if (player_in_vehicle "p2p_warthog")
        (begin 
            (game_save)
            (🐛 "saved")
            (sleep_until (not (player_in_vehicle "p2p_warthog")))
            (🐛 "not in warthog")
        )
    )
)

;
; Ripped from m35
(script dormant ✈️
    (🐛 "frigate_setup")
    (🌴 "dm_sky_frigate01")
    (👻 "dm_sky_frigate01" ✅)
    (🌴 "dm_sky_frigate02")
    (👻 "dm_sky_frigate02" ✅)

    (🌴 "dm_sky_frigate01b")
    (👻 "dm_sky_frigate01b" ✅)
    (🌴 "dm_sky_frigate02b")
    (👻 "dm_sky_frigate02b" ✅)

    (device_set_position_track "dm_sky_frigate01" "m35_advance0" 0.0)
    (device_set_position_immediate "dm_sky_frigate01" 0.0)
    (👻 "dm_sky_frigate01" ❌)
    (device_animate_position "dm_sky_frigate01" 0.4 3.0 0.1 0.5 ❌)
    ;(device_animate_position "dm_sky_frigate01" 1.0 32.0 0.1 0.1 false)
    (device_set_position_track "dm_sky_frigate02" "m35_advance0" 0.0)
    (device_set_position_immediate "dm_sky_frigate02" 0.0)
    (👻 "dm_sky_frigate02" ❌)
    (device_animate_position "dm_sky_frigate02" 1.0 41.0 0.1 0.1 ❌)
    (😴 (* 30.0 60.0 0.65))
    (👻 "dm_sky_frigate02" ✅)
    (👻 "dm_sky_frigate02b" ❌)
    (😴 (* 30.0 60.0 0.38))
    (👻 "dm_sky_frigate01" ✅)
    (👻 "dm_sky_frigate01b" ❌)
    ;(object_destroy "dm_sky_frigate01")
    ;(object_destroy "dm_sky_frigate02")
)

;
; Ripped from m52
(script dormant 🫗
    (🌴 "vig_cruiser01")
    (device_set_position_track "vig_cruiser01" "m52_initial_start" 0.0)
    (device_animate_position "vig_cruiser01" 0.0 -1.0 0.0 0.0 ❌)
    (device_animate_position "vig_cruiser01" 0.81 30.0 5.0 5.0 ❌)
)

(script dormant 🫗✌️
    ;(🌴 "vig_cruiser01")
    (sleep_until (>= (device_get_position "vig_cruiser01") 0.81) 5)
    (🌴 "vig_cruiser02")
    (device_set_position_track "vig_cruiser02" "m52_mid" 0.0)
    (device_animate_position "vig_cruiser02" 0.81 30.0 5.0 5.0 true)
    (sleep_until (>= (device_get_position "vig_cruiser02") 0.81) 5)
    (device_animate_position "vig_cruiser01" 1.0 30.0 0.0 0.0 true)
    (device_animate_position "vig_cruiser02" 1.0 30.0 0.0 0.0 true)
)

;
; Also ripped from m52
(script static void (🧂 (real attack) (real intensity) (short duration) (real decay))
    (player_effect_set_max_rotation 2.0 2.0 2.0)
    (player_effect_set_max_rumble 1.0 1.0)
    (player_effect_start intensity attack)
    (sleep (* duration 30.0))
    (player_effect_stop decay)
)

;🙏🙏🙏 Thank you Reiko you've ruined my life
(script continuous reiko_needs_a_checkpoint
    (sleep_until
        (begin
            (😴 (* 30.0 60.0 2.0))
            (game_save_no_timeout)
            false
        )
    )
)

; Required for random loss of input
(script continuous reset_input
    (sleep_until
        (begin
            (😴 (* 30.0 60.0 0.01))
            (♻️) ; Failsafe for input not being tracked
            false
        )
    )
)

; yay they might've won!
(script continuous check_if_player_wins
    (sleep_until (volume_test_players "tv_landing") 1)
    (🙄 false)
    (set 💝 false)
    (😴 250)
    (sleep_until (volume_test_players "tv_landing") 1)
    (set 💥 2)
    (📢 "(Press 'Right d-pad' or 'Right key' to end the level!)")
    (😴 80)
    (📢 "I'd love to see clips of people landing this! @HybridsEgo on discord <3")
    (set 💥 2)
    (🐛 "launch ::: 2")
    (sleep_forever)
)


;
;
; God forgive me
(script static void (🙄 (boolean bool))
    (chud_track_flag "pelican_location" bool)
)

(script static void (👻 (object o1) (boolean bool))
    (object_hide o1 bool)
)

(script static void (🌴 (object_name o1))
    (object_create o1)
)

(script static void (📢 (string message))
    (chud_post_message_hack message)
)

(script static void (🐛 (string message))
    (print message)
)

(script static void (😴 (short amount))
    (sleep amount)
)

(script static void ♻️
    (player_action_test_reset)
)

(script static void (🔒 (object s1) (string_id s2) (object s3) (string_id s4))
    (objects_attach s1 s2 s3 s4)
)

(script static void (🔓 (object o1) (object o2))
    (objects_detach o1 o2)
)

(script static void (🚀 (device d1) (string_id sid1) (real number))
    (device_set_position_track d1 sid1 number)
)