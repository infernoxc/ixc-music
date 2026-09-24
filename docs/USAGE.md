# Using IXC Music

The **player** (an invisible OBS browser source) plays the audio. The **dock** is where you control it.

## Dock controls
| Control | What it does |
|---|---|
| Search box | Words + Enter searches YouTube. A pasted video link, playlist link or 11-character video ID goes straight into the queue. |
| ▶ on a search result | Play now (inserted after the current song). |
| + on a search result | Add to the end of the queue. |
| Queue ▶ / ↑ / ✕ | Play that song, move it up, remove it. ▶ on the song that's already playing just resumes it. |
| ⏮ | Previous song. If the current song is more than 5 s in, it restarts it instead. |
| ⏯ / ⏭ | Play/pause, next. |
| 🔀 Shuffle | The next song is picked at random from the queue. |
| 🔁 Repeat | At the end of the queue, start again from the top. |
| **Autoplay** | At the end of the queue, add 3 songs similar to the last one and keep playing. It picks music only (1-12 min, no mixes or live streams) and skips songs you already played. Takes priority over Repeat at the end of the queue. |
| **Start music by itself when OBS opens** | When ticked, the last song resumes at the saved position every time OBS starts. |
| Volume slider | Player volume 0-100 (set the final level in OBS's mixer). |

Songs YouTube won't play in embedded players show **⚠** with the reason, such as "blocked by the owner outside YouTube"
or "removed or private". They're skipped automatically. Press ▶ on one to retry it.

Your queue and settings are remembered by OBS's browser, so they survive restarts.

## Audio tracks
IXC Music is a normal OBS audio source, so you decide who hears it:
1. Your stream output (and any multistream plugin) sends a specific **audio track** to each platform.
2. In **Advanced Audio Properties**, tick only the tracks that should carry music.

Example for multistreaming: Track 1 → Twitch (no music), Track 2 → Kick (with music). Give *IXC Music Player* Track 2
only. Keep your microphone and game on every track.

## Playlists
Paste a YouTube playlist link (`...list=PL...`). It's added as one queue item that plays the whole list; next and previous
move within it. YouTube "Mix" links (`list=RD...`) aren't real playlists, so only the video itself is added.

## Tips
- Use **NCS**, **StreamBeats** or other music you're allowed to stream.
- The dock and player also work in a normal browser for testing: `http://localhost:8767/music/dock.html`, and
  `http://localhost:8767/music/player.html?testid=<videoId>` plays one video without touching your queue.
