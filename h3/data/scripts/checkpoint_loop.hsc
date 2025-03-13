(script continuous reiko_needs_a_checkpoint
    (sleep_until
        (begin
            (sleep (* 30.0 60.0 2.0)) ; Will trigger every two minutes!
            (game_save_no_timeout)
            false
        )
    )
)