(global boolean input_toggle true)

(script continuous Zealot_is_holding_my_family_hostage
    (if (and (player_action_test_dpad_up) (= input_toggle true))
        (begin
            (chud_post_message_hack "Saving...")
            (game_save_no_timeout)
            (player_disable_movement true)
            (sleep (* 30.0 60.0 0.05))
            (player_disable_movement false)
            (player_action_test_reset)
        )
    )
    (if (and (player_action_test_dpad_down) (= input_toggle true))
        (begin
            (chud_post_message_hack "Reverting...")
            (sleep 5)
            (game_revert)
            (player_action_test_reset)
        )
    )
    (if (player_action_test_dpad_right)
        (begin
            (if input_toggle
                (begin
                    (set input_toggle false)
                    (chud_post_message_hack "Checkpoint/Reverts: OFF")
                )
                (begin
                    (set input_toggle true)
                    (chud_post_message_hack "Checkpoint/Reverts: ON")
                )
            )
            (player_action_test_reset)
        )
    )
)