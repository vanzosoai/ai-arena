╔══════════════════════════════════════════════════════════════╗
║          ⚡  AI CREATION ARENA  ⚡                           ║
║              JOHN & NICK — EST. 2026                         ║
╚══════════════════════════════════════════════════════════════╝

HOW TO OPEN
───────────
Just double-click ai-arena.html in this folder.
It opens directly in Chrome — no server or install needed.

YOUR FILES
───────────
  ai-arena.html   → The whole app (everything in one file)
  john.png        → Drop your pixel art avatar here (faces right)
  nick.png        → Drop Nick's pixel art avatar here (faces left)
  README.txt      → This file

ADDING YOUR AVATARS
───────────────────
Save your pixel art character images to this folder:
  • John's image (RPG, facing right) → save as john.png
  • Nick's image (shotgun, facing left) → save as nick.png
The app will automatically use them. If the files aren't
there, the built-in pixel art sprites show as fallback.

YOUR DATA
─────────
All your competition data is stored in your browser's
localStorage under the key "aiarena_v3".

To back it up: click EXPORT DATA in the app header.
To restore it: click IMPORT DATA and select the JSON file.

Your backup JSON file has this structure (maps 1:1 to
the Supabase tables when you go online):

  {
    "weeks": {
      "2026-W14": {
        "john": { title, description, link, imageUrl,
                  earnings, submittedAt },
        "nick": { ... }
      }
    },
    "players": {
      "john": { "bestStreak": 3 },
      "nick": { "bestStreak": 2 }
    }
  }

SCREENSHOT FEATURE
──────────────────
Enter any URL and click 📸 GRAB SCREENSHOT.
Uses thum.io — free, no account needed.
If that fails it tries wordpress mshots as a backup.
You can also upload your own image instead.

GOING ONLINE (SUPABASE)
───────────────────────
When you're ready to share data between your computers
in real-time, the plan is:

1. Create a free account at supabase.com
2. Create a new project
3. Run these two SQL statements to create the tables:

   CREATE TABLE submissions (
     id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
     week_id TEXT NOT NULL,
     player TEXT NOT NULL,
     title TEXT NOT NULL,
     description TEXT,
     link TEXT,
     image_url TEXT,
     earnings DECIMAL(10,2) DEFAULT 0,
     submitted_at TIMESTAMPTZ DEFAULT NOW(),
     UNIQUE(week_id, player)
   );

   CREATE TABLE players (
     player TEXT PRIMARY KEY,
     best_streak INT DEFAULT 0
   );

4. Give me your Project URL and anon key and I'll
   wire it in — the data structure already maps perfectly.

MUSIC
─────
• Hover over JOHN or NICK on the login screen to
  trigger the boot fanfare
• The main Grabbag-inspired heavy metal loop starts
  when you log in (~31 second loop)
• Click MUTE in the header to silence it

BUGS / FEEDBACK
───────────────
Hit the thumbs down on any Claude response, or just
tell me what's broken — I can push fixes anytime.
