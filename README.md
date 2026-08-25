# Service Booking App — Flutter Frontend

A Flutter app that shows a **service booking** UI — users can browse service providers, filter them, and view full provider profiles. Built with Flutter and GetX.

---

## 🛠️ How to Set Up and Run

### What you need
- [Flutter](https://docs.flutter.dev/get-started/install) version `3.8.1` or higher
- A phone, emulator, or web browser to run the app on

### Steps

```bash
# Step 1 — Download all packages
flutter pub get

# Step 2 — Run the app
flutter run
```

> Works on Android, iOS, Web, Windows, macOS, and Linux.

---

## 🎨 Extra UI Touches (Beyond the Original Figma Design)

### 1. Diagonal Two-Tone Header
The home screen header has two shades of teal — a dark green base with a lighter triangle painted across it. This was done with Flutter's `CustomPainter` instead of a plain colored box, making the header look more interesting and modern.

### 2. One Card Widget, Two Looks
Instead of building two separate provider cards, one `ProviderCard` widget handles both styles — a compact version for the home screen and a fuller version (with price and a Book button) for the category screen. Saves code and keeps things consistent.

### 3. Bookmark That Updates Everywhere
When you tap the bookmark icon, it switches between an empty and filled icon instantly — and that change shows up on every screen at the same time. No need to pass the update around manually; GetX handles it automatically.

### 4. Custom Bottom Navigation Bar
The bottom nav uses custom SVG icons that swap between an outline and a filled version when selected. The active tab also gets a slightly bolder label. This looks cleaner and more polished than Flutter's default bottom nav.

### 5. Avatar Floating Over the Cover Image
On the provider detail screen, the profile picture sits halfway on top of the cover photo — it overlaps the edge of the image. A dark tint is added to the cover so the photo behind doesn't distract, and a "Fully Booked" badge appears in the corner when needed.

### 6. Tappable Service Chips
On the detail screen, each service the provider offers is shown as a small pill/chip. Tapping a chip highlights it in teal and instantly updates the description below it — no page reload or extra taps needed.

### 7. Letter Fallback for Profile Images
If a profile photo fails to load (broken link, missing file, etc.), the app shows the person's first initial inside a colored circle instead of a blank or broken image icon. Keeps the UI looking clean no matter what.

### 8. Tabs Remember Their State
Switching between tabs (Home, Bookings, Chat, Profile) doesn't reset anything. If you scrolled halfway down the home feed and then switched to Chat, the home feed is still in the same place when you switch back. This is done using `IndexedStack`.

