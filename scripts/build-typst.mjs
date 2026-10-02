import { access, mkdir } from 'node:fs/promises';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import { join } from 'node:path';

const root = fileURLToPath(new URL('../', import.meta.url));
const missing = [];
for (const suffix of ['Rg', 'Bd', 'Eb']) {
  const name = `LINESeedJP_OTF_${suffix}.otf`;
  try { await access(join(root, 'fonts', name)); }
  catch { missing.push(name); }
}
if (missing.length) {
  console.error(`LINE Seed JP fonts are missing: ${missing.join(', ')}\nFrom the repository root, run:\n  node scripts/setup-fonts.mjs /path/to/LINESeedJP_20241105\nOr see fonts/README.md for manual setup.`);
  process.exit(1);
}
await mkdir(join(root, 'typst/build'), { recursive: true });
const result = spawnSync(process.env.TYPST_BIN || 'typst', [
  'compile', '--root', root, '--font-path', join(root, 'fonts'),
  '--ignore-system-fonts',
  join(root, 'typst/slides.typ'), join(root, 'typst/build/slides.pdf'),
], { cwd: root, stdio: 'inherit' });
if (result.error) {
  console.error(`Could not start Typst: ${result.error.message}\nInstall the Typst CLI: https://github.com/typst/typst#installation`);
  process.exit(1);
}
process.exit(result.status ?? 1);
