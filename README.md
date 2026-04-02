# ⚡ AI Creation Arena

> *"Come get some." — Duke Nukem*

A private weekly accountability dashboard for two creators. Each week we lock in an AI-assisted project, track earnings, and keep each other honest. Duke Nukem runs the whole thing.

---

## What It Does

Two players. One arena. Every week you either **ship something** or you get cooked.

- **Lock In** — submit your weekly creation with a title, description, and earnings
- **Live scoreboard** — streak tracking, champion crown, weapon tier system
- **Automated emails** — taunts when your opponent locks in, Monday recaps, birthday surprises
- **Seasonal overlays** — the avatars change with the holidays (jester hat on April Fools, bunny ears at Easter, etc.)
- **Chip-tune music engine** — original 8-bit tracks that shift with the season
- **Duke Nukem flavor** — throughout

---

## Tech Stack

| Layer | Tool |
|---|---|
| Frontend | Single HTML file — no framework, no build step |
| Auth & Database | [Supabase](https://supabase.com) |
| Email | [Brevo](https://brevo.com) (formerly Sendinblue) |
| Hosting | GitHub Pages |
| Scheduled jobs | Supabase pg_cron → Edge Functions |

---

## Project Structure

```
ai-arena/
├── index.html              ← The entire app (one file)
├── favicon.png / .svg      ← Site icons
├── push.sh                 ← Quick deploy helper
└── Duke Nukem Slogans/     ← Audio clips (.wav)
```

---

## Email Automation

Four Supabase Edge Functions handle all emails:

| Function | Trigger | Purpose |
|---|---|---|
| `notify-submission` | On lock-in (called by frontend) | Taunts the other player |
| `monday-dispatch` | pg_cron — Mondays 9am ET | King email to winner, "Get Busy" to loser |
| `send-reminders` | pg_cron — Tuesdays 10am ET | Shame email if *both* players missed |
| `birthday-dispatch` | pg_cron — each player's birthday | Personalised birthday email with career stats |

---

## Want to Fork This?

This project is built for exactly two people with a specific setup, but the architecture is easy to adapt. You'd need:

1. **Supabase project** with two tables:
   - `submissions` — `(week_id, username, title, description, earnings, created_at)`
   - `player_emails` — `(player, notify_email, chosen_weapon, updated_at)`

2. **Supabase Auth** — one account per player

3. **Brevo account** — free tier covers this volume easily. Set `BREVO_API_KEY` as a Supabase secret.

4. **Deploy the four edge functions** from the `edge-functions/` directory (if you have a backup copy) or rewrite them to match your email style.

5. **Update `index.html`** — swap out the Supabase URL, anon key, and player names for your own.

6. **GitHub Pages** — push `index.html` to a repo, enable Pages, done.

---

## The Streak System

Consistent weekly submissions build a streak. The streak unlocks increasingly powerful weapons for your avatar:

| Streak | Weapon |
|---|---|
| 0 | Knife |
| 1–2 | Pistol |
| 3–4 | Dual Pistols |
| 5–6 | Shotgun |
| 7–8 | SMG |
| 9–10 | Chaingun |
| 11–12 | Rail Gun |
| 13+ | Weapon chooser unlocks |
| 15+ | Weapons Free (solo fire toggle) |

---

## Seasonal Easter Eggs

The avatars and music shift automatically based on the date:

| Period | Overlay | Music |
|---|---|---|
| December | Santa hat | Xmas chip-tune |
| February | Heart glasses | Swing |
| All of March | Clover | Irish jig |
| Easter week | Bunny ears | Hippity-hoppity |
| April 1 | Jester hat (beats Easter) | Chaos (BPM 197) |
| July 4 | Bandana + shorts | USA |
| Halloween | Jason mask | Spooky |
| November | Mustache | Top Gun |

Plus holiday splash screens on St. Patrick's Day, Easter Sunday, April Fool's, July 4th, Halloween, Christmas, and New Year's.

---

## Notes

- Built entirely as a single `index.html` — no dependencies to install, no server needed
- The Supabase anon key in the source is intentional — it's a public client key, protected by Row Level Security
- Background music, weapon sounds, and sound effects are generated entirely in-browser via the Web Audio API
- The Duke Nukem voice clips (played on submission) are real `.wav` files in the `Duke Nukem Slogans/` folder — these need to stay alongside `index.html`

---

*John & Nick — Est. 2026*
