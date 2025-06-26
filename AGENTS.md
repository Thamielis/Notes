# Repo Instructions

- All documentation links must be relative and use forward slashes.
- Index files under `docs` must list every markdown file in their folder. Use the file name as the link label and paths relative to the `docs` root (see commit 99253c70).
- The markdown link validation tests check that all links in index files exist and are valid. They report the percentage of markdown files that are referenced. Missing references are printed but do not fail the tests.
- When adding documentation, update the corresponding `index.md` so coverage remains high.

## Knowledge - ./docs/Knowledge

Create a system that recursively scans the "Knowledge" directory for `.md` files and generates structured `index.md` files for every directory that contains Markdown content.

The goal is to automatically build a readable, categorized, and well-structured Markdown-based documentation index. Only directories that contain Markdown files directly or in their subdirectories should be included. Every relevant directory should have an `index.md` that lists its contained `.md` files and links to the `index.md` of its subdirectories.

### Steps

1. Recursively scan the `Knowledge/` directory.
2. Ignore any folder that contains no Markdown files (`*.md`) in itself or in any subfolder.
3. For every relevant folder:
   - Create or update an `index.md` file.
   - List all `.md` files directly contained in the folder (excluding `index.md`).
   - For each subdirectory with Markdown files, add a link to its `index.md`.
4. Organize the file listings in a structured and grouped way:
   - Group related files based on naming patterns, tags in YAML frontmatter (if present), folder names, or detected content similarities.
   - Add a meaningful section header for each group.
5. For each listed file:
   - Use the file title (from frontmatter or first heading) as the display label.
   - Optionally extract a short description (from frontmatter or first paragraph) to display below the link.
   - Display metadata (e.g., last modified date, tags, file size if useful).
6. Ensure the generated `index.md` is readable, navigable, and self-explanatory.

### Output Format

Each `index.md` file should follow this format:

- Start with a heading for the directory.
- Group files under semantic sections using `##` or `###`.
- For each file, use:
  - `- [Filename](<Knowledge/filename.md>) — _Short description_ (Last modified: YYYY.MM.DD)`
- For each subdirectory:
  - `- 📁 [Subfolder](<Knowledge/subfolder/index.md>) — _Short description of folder content_`

### Examples

#### Sample `index.md` in `Knowledge/Networking`

```markdown
# Networking

## Concepts and Protocols

- [TCP Overview](<Knowledge/Networking/tcp overview.md>) — _Transmission Control Protocol fundamentals_ (Last modified: 2025.06.25)
- [DNS Explained](<Knowledge/Networking/dns explained.md>) — _How Domain Name System works_

## Tools

- [Wireshark Guide](<Knowledge/Networking/wireshark guide.md>) — _Packet inspection using Wireshark_
- [netstat Commands](<Knowledge/Networking/netstat commands.md>)

## Subdirectories

- 📁 [Cisco](<Knowledge/Networking/Cisco/index.md>) — _Cisco router configuration and tools_
- 📁 [Firewall](<Knowledge/Networking/Firewall/index.md>)
```

## Notes

- Ensure links are relative and platform-independent (work in Docsify, GitHub, etc.).
- Support YAML frontmatter parsing for title, description, tags.
- Sort groups and entries alphabetically unless overridden by metadata or priority tags.
- Maintain idempotency: repeated runs should not duplicate content or reorder groups arbitrarily.
