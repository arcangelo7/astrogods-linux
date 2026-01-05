# Flathub PR #7474 - Review Questions

Tracking document for responding to BBHTT's review comments on the AstroGods Flathub submission.

---

## Question 1: finish-args review

**Comment:** "don't set this" (on multiple finish-args lines)

BBHTT highlighted these lines for review:
```json
"--share=network",
"--socket=x11",
"--device=dri",
"--env=GDK_BACKEND=x11"
```

### Breakdown of each permission

| Permission | Purpose | Needed? |
|------------|---------|---------|
| `--share=network` | Network access for API calls | Yes, app has backend |
| `--socket=x11` | X11 display server access | Yes, required for Flutter/GTK |
| `--device=dri` | GPU hardware acceleration | Yes, Flutter uses Skia for rendering |
| `--env=GDK_BACKEND=x11` | Force X11 instead of Wayland | Controversial |

### The Wayland problem

There are documented Flutter/Wayland performance issues:

- `eglSwapBuffers` blocks for ~18ms per frame on Wayland vs much less on X11 (see [sony/flutter-embedded-linux #220](https://github.com/sony/flutter-embedded-linux/issues/220))
- For 60fps you need ~16.67ms per frame, so 18ms blocking guarantees frame drops
- Some users report "Error 71 (Protocol error) dispatching to Wayland display" causing crashes ([flutter/flutter #101407](https://github.com/flutter/flutter/issues/101407))
- Flutter historically forced X11 backend before native Wayland support was added ([flutter/flutter PR #60654](https://github.com/flutter/flutter/pull/60654))

### Things to figure out

- [ ] Which specific finish-args is BBHTT objecting to? Just GDK_BACKEND or others too?
- [ ] Is there a Flathub-approved way to handle apps that don't work well on Wayland?
- [ ] Should I just remove GDK_BACKEND and let users deal with potential stuttering?

**My answer:**

[Write your response here]

---

## Question 2: Can you provide aarch64 builds?

**Comment:** "the question here is can you provide aarch64 builds?"

**What they're asking:** Can you compile and distribute ARM64 versions of the app?

**Why this matters:** Flathub wants to support both x86_64 and aarch64 when possible. ARM devices are increasingly common (Raspberry Pi, ARM laptops, etc.).

### Research findings

**Flutter does NOT support cross-compilation from x86_64 to ARM64** ([flutter/flutter #148439](https://github.com/flutter/flutter/issues/148439)), but this doesn't matter because GitHub Actions provides native ARM64 runners.

**Solution: GitHub Actions ARM64 runners**

GitHub Actions has `ubuntu-24.04-arm` runners available since September 2024. You can compile natively on ARM64 without cross-compilation.

Steps to add aarch64 support:
1. Add an ARM64 job to the GitHub Actions workflow
2. Upload both tarballs (linux-x64 and linux-arm64) to GitHub releases
3. Update the Flatpak manifest with architecture-specific sources

**How Flathub handles multi-arch proprietary apps:**

Specify different sources per architecture in the manifest:
```json
"sources": [
  {
    "type": "archive",
    "only-arches": ["x86_64"],
    "url": "https://.../linux-x64.tar.gz"
  },
  {
    "type": "archive",
    "only-arches": ["aarch64"],
    "url": "https://.../linux-arm64.tar.gz"
  }
]
```
([Source](https://discourse.flathub.org/t/how-to-provide-binaries-for-both-aarch64-arm64-and-x86-64-regular-64-bit/3521))

### Decision

**Adding aarch64 support now, before the PR is merged.**

### Implementation plan

**File:** `.github/workflows/release.yml`

1. Add `build-linux-arm64` job:
   - `runs-on: ubuntu-24.04-arm` (GitHub ARM64 runner)
   - Same Flutter setup and build steps as x64
   - Output path: `build/linux/arm64/release/bundle`
   - Tarball: `linux-arm64-VERSION.tar.gz`

2. Update `publish` job:
   - `needs: [prepare, build-linux, build-linux-arm64]`
   - Download both artifacts
   - Calculate checksums for both
   - Update Flatpak manifest with both checksums
   - Upload both tarballs to releases

**File:** `flatpak/it.astrogods.AstroGods.json`

3. Update sources to be architecture-specific:
   ```json
   "sources": [
     {
       "type": "archive",
       "only-arches": ["x86_64"],
       "url": "https://...linux-x64-VERSION.tar.gz",
       "sha256": "..."
     },
     {
       "type": "archive",
       "only-arches": ["aarch64"],
       "url": "https://...linux-arm64-VERSION.tar.gz",
       "sha256": "..."
     }
   ]
   ```

**Flathub PR:**

4. Remove `flathub.json` (no longer limiting to x86_64)
5. Update manifest with architecture-specific sources

**My answer:**

Yes, I've added aarch64 builds. The CI now compiles natively on `ubuntu-24.04-arm` runners and runs `flathub-build` + `flatpak-builder-lint` on both architectures to make sure everything works.

I don't have an ARM device to test manually, so automated verification is the best I can do for now. The builds pass all the linting checks though.

I've also updated the manifest with architecture-specific sources.

One thing worth mentioning: to get free ARM runners I had to make the frontend open source (GitHub doesn't offer them for private repos). The code is now at [arcangelo7/astrogods-app](https://github.com/arcangelo7/astrogods-app). Felt like the right thing to do anyway, given Flathub's philosophy. The backend stays closed, but the app itself is fully open.

---

## Draft Responses

Once you've filled in the answers above, draft your PR responses here before posting.

### Response to finish-args comment:

[Draft response]

### Response to aarch64 comment:

[Draft response]
