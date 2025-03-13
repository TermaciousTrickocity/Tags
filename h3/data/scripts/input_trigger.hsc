(script continuous reiko_needs_a_hotkey
    (if (player_action_test_back)
        (begin
            (game_save_no_timeout)
            (player_disable_movement true)
            (sleep (* 30.0 60.0 0.02))
            (player_disable_movement false)
            (player_action_test_reset)
        )
    )
    (if (player_action_test_rotate_grenades) 
        (begin
            (sleep 5)
            (game_revert)
            (player_action_test_reset)
        )
    )
)