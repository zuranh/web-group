# `scripts/admin-add-event.js` walkthrough

This file powers the admin **Add Event** page. Below is a line‑by‑line style explanation of how it works and why each piece is present.

## Imports and auth state
- `import { auth } from "../firebase-config.js";` pulls in the initialized Firebase auth instance used across the site.
- `import { onAuthStateChanged } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-auth.js";` brings in Firebase’s listener helper so the page waits for a signed-in admin/owner before doing anything.

## Shared state and DOM lookups
- `let currentUser = null;` holds the authenticated Firebase user once login is confirmed.
- Grabs key DOM nodes by ID: the form, genre container, alert box, submit button, image input, and image preview elements. These references are reused throughout the script instead of re-querying the DOM on every action.

## Alert helpers
- `showAlert(msg, type = "info")` writes a message into the alert box and applies an `alert-<type>` class for styling; if the alert box is missing, it logs to the console instead of throwing.
- `toggleSubmit(state)` disables/enables the submit button and swaps its text between “Creating…” and “Add Event” so users see request progress.

## Image preview helper
- `updatePreview(url)` shows or hides the preview wrapper. When a URL is present, it sets the `<img>` source; when empty, it hides the preview and clears the source to avoid stale images.

## Genre loading
- `loadGenres()` fetches `api/genres.php`, reads the JSON response, clears the current genre area, and renders a checkbox label for each genre returned. Each label uses the `.genre-option` class and contains an `<input type="checkbox" name="genres[]">` so the selected IDs can be gathered later.

## Image upload
- `uploadImageFile(file)` returns early if there’s no file or no authenticated user. It shows a temporary “Uploading image…” alert, builds `FormData` with the file under the `image` key, and POSTs to `api/upload-image.php` with the Firebase ID token (`Authorization`) and UID (`X-Firebase-UID`) headers. It expects JSON `{ success, url }` and throws an error if the upload fails; otherwise it returns the uploaded image URL.

## Form submission
- `handleSubmit(e)` prevents the default form submit, shows the loading state, and clears any alert.
- It builds a `payload` with trimmed text fields, date/time values, numeric price (falling back to 0), optional lat/lng (set to `null` when blank), and an array of selected genre IDs.
- If a file is present, it uploads the image first and adds `image_url` to the payload while also updating the preview.
- Sends a POST request to `api/admin/events.php` with JSON body and the user’s auth headers. On success it shows a success alert, resets the form, and clears the preview. Errors are caught and shown; the submit button is always re-enabled in `finally`.

## Initialization and listeners
- `onAuthStateChanged(auth, async user => { ... })` redirects to `login.html` if no user is signed in. Once authenticated, it stores the user in `currentUser` and loads genres so the form can be used.
- `form.addEventListener("submit", handleSubmit);` wires the form’s submit event to the handler above.
- The image input `change` listener uploads the selected file immediately, updates the preview, and shows a success or error alert based on the outcome.

In short, this script guards the page behind Firebase auth, populates selectable genres, handles immediate image uploads with previews, and sends the complete event payload to the admin API with proper authentication headers.
