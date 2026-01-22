---
name: Bug report for STweep
about: Report formatting issues with STweep plugin
title: 'STweep removes tabs/spaces from empty lines breaking code collapse hierarchy'
labels: 'Type: Bug'
assignees: Barteling

---

**Describe the bug**
STweep formatter removes tabs/spaces from empty lines within code blocks, which breaks the code folding/collapsing hierarchy in Codesys IDE. When code contains empty lines with indentation as part of a larger block structure, removing the indentation from those empty lines causes the IDE to interpret them as block separators rather than part of the same block.

**Expected behavior**
When formatting code, empty lines that are part of an indented block should maintain their indentation level to preserve the block structure for proper code folding.

**Initial code before formatting:**
```
// parent instruction
	// step 1
	// step 2
	// step 3
	
	// step 4
	// step 5
// end of parent instruction
```

**Current result after formatting:**
```
// parent instruction
	// step 1
	// step 2
	// step 3

	// step 4
	// step 5
// end of parent instruction
```

Note: The empty line between "step 3" and "step 4" has lost its tab/indentation.

**Impact on code folding:**

Before formatting, collapsing the parent instruction shows:
```
// parent instruction [6 lines]
// end of parent instruction
```

After formatting, collapsing the parent instruction shows:
```
// parent instruction [3 lines]

	// step 4
	// step 5
// end of parent instruction
```

As can be seen, the IDE infers that these are two different blocks of code, breaking the hierarchy.

**Expected result:**
Empty lines within an indented block should preserve their indentation so that code folding works correctly. The entire block from "parent instruction" to "end of parent instruction" should collapse as a single unit.

**Settings export:**
Default STweep settings (no custom configuration applied).

**STweep version info**
STweep for Codesys version 4.2.1

**IDE version info**
Codesys 3.5.21.30

**Additional context**
This issue specifically affects code organization and readability in Codesys projects where developers use empty lines to visually separate logical sections within larger code blocks. The loss of indentation on empty lines causes the IDE's code folding feature to misinterpret the code structure, making it harder to navigate and understand complex instruction sequences.
