# Using IXC Music

The **player** (an invisible OBS browser source) plays the audio. The **dock** is where you control it. With IXC ChatBox
installed too, or through the 📱 phone remote, you can control it from your phone as well.

## Dock controls
| Control | What it does |
|---|---|
| Search box | Words + **Go** searches YouTube. A **link** is checked and added to the queue: see [Links](#links). |
| ▶ / + on a search result | Play now (after the current song) / add to the end of the queue. |
| Queue ▶ / ↑ / ✕ | Play that song, move it up, remove it. ▶ on the song that's already playing just resumes it. |
| ⏮ ⏯ ⏭ | Previous (restarts the song if it's more than 5 s in), play/pause, next. |
| 🔀 Shuffle · 🔁 Repeat | Random next song · start again at the end of the queue. |
| **Autoplay** | At the end of the queue, add 3 songs similar to the last one (music only, 1-12 min, nothing you already played). |
| **Music goes to** | **ALL / TWITCH ONLY / KICK ONLY / YOUTUBE ONLY**: see [Audio destination](#audio-destination). |
| **Start music by itself when OBS opens** | The last song resumes at the saved position every time OBS starts. |
| Volume | Player volume 0-100 (set the final level in OBS's mixer). |
| 📱 · ⓘ | Phone remote QR code · diagnostics page. |

Songs YouTube won't play in embedded players show **⚠** with the reason and are skipped. Press ▶ on one to retry it.
Your queue and settings are remembered in OBS's browser storage, so they survive restarts.

## Audio destination
Multistreaming sends a different OBS **audio track** to each platform. The switch sets the tracks of the *IXC Music Player* source:

| Button | Tracks (default map) | Who hears the music |
|---|---|---|
| ALL | 1 + 2 + 3 | everyone |
| TWITCH ONLY | 1 | Twitch viewers |
| KICK ONLY | 2 | Kick viewers |
| YOUTUBE ONLY | 3 | YouTube viewers |

- The switch is instant (a few milliseconds) and only changes the source's track boxes, so no extra audio processing is added.
- After switching, IXC reads the tracks back from OBS and shows **"✓ … · OBS track 2"**. If OBS refused the change, it says so.
- Tracks 4-6 (e.g. a recording track) are never touched.
- The choice is saved and applied again whenever OBS starts. If OBS is closed, the dock says "saved - applies when OBS connects".
- If someone changes the tracks by hand in OBS, the dock shows "tracks were changed in OBS".

**Set up the map once:**
1. Look at which track each platform uses: your OBS Settings › Output (the main stream) and your multistream plugin's settings for each extra output.
2. If it isn't Twitch 1 / Kick 2 / YouTube 3, change `music.routing.tracks` in config.json (see [CONFIGURATION.md](CONFIGURATION.md)).
3. Keep your mic and game audio on **all** platform tracks. Only the music source is switched.

## Links
| You paste | What happens |
|---|---|
| YouTube video, `youtu.be`, Shorts, `music.youtube.com`, or an 11-character ID | Checked with YouTube's oEmbed service (exists? private?), then added |
| YouTube playlist (`list=PL…`, `OLAK5…`) | Checked, then added as one item that plays the whole list |
| A video inside a Mix (`list=RD…`) | The video is added (Mixes are personal radio lists and can't be played in OBS) |
| **Spotify song** (`open.spotify.com/track/…`, `spotify:track:…`) | Its title comes from Spotify's oEmbed service; IXC plays the best match on YouTube and shows a **SPOTIFY** tag |
| **Spotify playlist / album** | Needs your Spotify developer keys. Up to 150 songs are queued; each one is matched on YouTube only when it's about to play |
| Already in the queue | "already in the queue" with an **Add it again** button |
| Private / deleted / wrong link | A clear message, e.g. "it doesn't exist, was deleted, or is private" |
| Spotify artist / podcast, `spotify.link` short links, other sites | "not supported", with what to paste instead |

## Tips
- Use **NCS**, **StreamBeats** or other music you're allowed to stream.
- The dock and player also work in a normal browser for testing: `http://localhost:8767/music/dock.html`, and
  `http://localhost:8767/music/player.html?testid=<videoId>` plays one video without touching your queue.
  (A normal browser tab may block sound until you click it; OBS doesn't.)
