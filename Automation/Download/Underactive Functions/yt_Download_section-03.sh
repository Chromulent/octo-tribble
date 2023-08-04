#!/bin/sh


#   Creator Video Array
vidArray=(
    "UCtqxG9IrHFU_ID1khGvx9sA" # All Gas No Brakes
    "UCxt9Pvye-9x_AIcb1UtmF1Q" # Ashens
    "UCJHA_jMfCvEnv-3kRjTCQXw" # Babish Culinary Universe
    "UCcHBw_Rs56RFcisYAOlFfmQ" # Billiam 
    "UCp1orOGJwZvjLAvckyxC4Nw" # BosnianBill

    "UC7UiChjgT_LDKcr_8NEEbMA" # Brainlet
    "UC3g-w83Cb5pEAu5UmRrge-A" # Brandon Sanderson
    "UCEOXxzW2vU0P-0THehuIIeg" # Captain Disillusion
    "UCAG1ABZP-c7wuNt0fziHtsA" # Caroline Konstnar
    "UC-AQKm7HUNMmxjdS371MSwg" # Channel 5 with Andrew Callaghan

    "UCpmvp5czsIrQHsbqya4-6Jw" # Chad Chad 
    "UC2C_jShtL725hvbm1arSV9w" # CGP Grey
    "UCworsKCR-Sx6R6-BnIjS2MA" # Clickspring
    "UC7lx9EQBwxPaRMlMom61-XQ" # Comedy Cheat Codes
    "UCIdcKbW1enq8S84aJ2OJeoQ" # Court of Source

    "UCjU-Cwjfqbo2hMRItlXwnnQ" # Dan Bell
    "UC1hkAIJnb2CSmm7SPJaPR-A" # Dan Bull
    "UCVo63lbKHjC04KqYhwSZ_Pg" # Defunctland 
    "UCUMQFUkgaEE68_ujIdW2wAw" # Dime Store Adventures
    "UCAwniUYYxhjOGhM86x0h0Bg" # eSysman SuperYachts

    "UCCODtTcd5M1JavPCOr_Uydg" # Extra History
    "UCbWcXB0PoqOsAvAdfzWMf0w" # Fredrik Knudsen
    "UC-oYqxpi6TO1J7BjQksSuOA" # Gabi Belle
    "UCv_vLHiWVBh_FR9vbeuiY-A" # Historia Civilis
    "UCggHoXaj8BQHIiPmOxezeWA" # History Buffs
    
    #"UCpDmn2FfVYdPIDwRTcf5-OA" # iilluminaughtii
    "UCwO-UgquohXwoe7f0e6lMnw" # Invicta
    "UC7FkqjV8SU5I8FCHXQSQe9Q" # Ishitani Furniture
    "UCmJcrJ_30p6s_OTbyTFfbqQ" # itfreetraining
    "UCZ30YNIcUWuSz8eVJZtLEjw" # Jaboody Dubs
    
    "UClM02zHdwG0Wyzzi4Hf3X6A" # Jacob Sharpe 
    "UCGwu0nbY2wSkW8N-cghnLpA" # Jaiden Animations
    "UCYvEb6iLPxLPZTe6NcUUUeA" # JAubrey
    "UCxU5FvmDqAi2aJ9AzYA_syA" # JCS
    "UCYwVxWpjeKFWwu8TML-Te9A" # JCS - Criminal Psychology

    "UC7-E5xhZBZdW-8d7V80mzfg" # Jenny Nicholson
    "UCBNG0osIBAprVcZZ3ic84vw" # Jim Browning
    "UCWCw2Sd7RlYJ2yuNVHDWNOA" # Jim Sterling
    "UCmGSJVG3mCRXVOP4yZrU1Dw" # Johnny Harris
    "UCRWyPm7MrfotIYF8A8MGV3g" # Josh Strife Hayes
    
    "UC3ltptWa0xfrDweghW94Acg" # Karl Jobst
    "UCjdQaSJCYS4o2eG93MvIwqg" # Kilian Experience
    "UCMmaBzfCCwZ2KqaBJjkj0fw" # Kings and Generals
    "UCm22FAXZMw1BaWeFszZxUKw" # Kitboga
    "UC7zsxKqd5MicTf4VhS9Y74g" # Kurtis Conner 

    "UCsXVk37bltHxD1rDPwtNM8Q" # Kurzgesagt
    "UC3XTzVzaHQEd30rQbuvCtTQ" # LastWeekTonight with John Oliver
    "UCpa-Zb0ZcQjTCPP1Dx_1M8Q" # LegalEagle
    "UCXuqSBlHAE6Xw-yeJA0Tunw" # Linus Tech Tips
    "UCm9K6rby98W8JigLoZOh6FQ" # LockPickingLawyer

    "UC6sjkvDzyY0J8o7k2Kc5rEw" # Lockstin and Gnoggin 
    "UCqNpjt_UcMPgm_9gphZgHYA" # Münecat
    "UCSuHzQ3GrHSzoBbwrIq3LLA" # Naomi Brockwell: NBTV  
    "UCJkMlOu7faDgqh4PfzbpLdg" # Nerdwriter1
    "UCKab3hYnOoTZZbEUQBMx-ww" # OfficialNerdCubed

    "UCsC--WvN66vZlDoYShzn4sA" # Oxhorn
    "UCAL3JXZSzSm8AlZyD3nQdBA" # Primitive Technology
    "UCSXVbHYeOe8yb9k0CuLSKcA" # Psychotrip
    "UCUpkp-6fXuG9dqfoJ99XTmw" # Puffin Forest
    "UCkO3godtBkGH4t9rYHqfF0g" # RamZaes

    "UCS0-VSAEnr67ase5z16IqrA" # Random Game Reviews
    "UCP5tjEmvPItGyLhmjdwP7Ww" # RealLifeLore
    "UCrTNhL_yO3tPTdQ5XgmmWjA" # RedLetterMedia
    "UCo1pShh6dtg-T_ZZkgi_JDQ" # Regular Car Reviews
    "UCweFJojRAFuxyYxe4KHL8vw" # Runesmith

    "UC7mFkx1Um4KJZKkUHsSV1uA" # ShoddyCast 
    "UCB07XDRsWAb4u3mJwk6OoRQ" # Square Table Gaming
    "UCO6nDCimkF79NZRRb8YiDcA" # Storied
    "UC-eDKZ_PSz_JHynMf-Jp--A" # Shane Brained
    "UC0aanx5rpr7D1M7KCFYzrLQ" # Shoe0nHead

    "UCwuALck_lp7LxzQcoskRjbQ" # Tales of Alethrion 
    "UCy0tKL1T7wFoYcxCe0xjN6Q" # Technology Connections
    "UCkyfHZ6bY2TjqbJhiH8Y2QQ" # The Brain Scoop
    "UCqTYHSnBUXZamsVcOlQf-fg" # The Cosmonaut Variety Hour
    "UCo_IB5145EVNcf8hw1Kku7w" # The Game Theorists

    "UCcIpxEgQbZSJNe20jbyKJFQ" # The Tarnished Archaeologist
    "UCG-KntY7aVnIGXYEBQvmBAQ" # Thomas Frank 
    "UCaQ0KQK_HrCD7a4fkgtCCsg" # Toatapio Nuva
    "UC0twEKQY4LbteXfVq3nJQPg" # Trekspertise
    "UC4UNqGYuB2q49GzGD_CBIVQ" # TrixyBlox

    "UCL8w_A8p8P1HWI3k6PR5Z6w" # Two Cents
    "UCe0DNp0mKMqrYVaTundyr9w" # VaatiVidya
    "UCircJf-FlToBNjuy9xG-i5A" # Watcher 
    "UC9RM-iSvTu1uPJb8X5yp3EQ" # Wendover Productions
    "UC3cpN6gcJQqcCM6mxRUo_dA" # Wendigoon

    "UCncTjqw75krp9j_wRRh5Gvw" # Worldbuilding Notes    
    "UC6ablLabCW4pcNJwEtmZh2Q" # Viakavish
    "UCH-_hzb2ILSCo9ftVSnrCIQ" # YOGSCAST Lewis and Simon
    "UCCXR2kCo7Lcw_BKwWxo09kw" # Zee Bashew
    "UCVpankR4HtoAVtYnFDUieYA" # Ze Frank
    "UC4JL8XJ9dxqfvzTM8L5Sl3w" # Zullie the Witch

    # ""
)
