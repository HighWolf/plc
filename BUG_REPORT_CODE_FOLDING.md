# Bug Report: Code Folding Display Issue with Comments

## Summary
When collapsing code regions that contain comments, the collapsed view displays incorrectly by concatenating the fold indicator with the ending comment without proper spacing or line break.

## Issue Description
Code folding in the editor does not properly format the collapsed region display when comments are involved. The fold indicator `[X lines]` is concatenated directly with the ending comment line without any spacing or visual separator.

## Environment
- Repository: HighWolf/plc
- File Type: Structured Text (.st), comments, and general code files
- Issue Type: Display/Formatting

## Steps to Reproduce

1. Create or open a file with the following comment structure:
```
// parent instuction
	// step 1
	// step 2
	// step 3
	
	// step 4
	// step 5
// end of parent instruction
```

2. Use the editor's code folding feature to collapse the region between the first and last comment lines

3. Observe the collapsed display

## Actual Behavior

When the code region is collapsed, the display shows:
```
// parent instuction  [6 lines]// end of parent instruction
```

The fold indicator `[6 lines]` is directly concatenated with the ending comment `// end of parent instruction` without any visual separator.

## Expected Behavior

The collapsed code should display with proper spacing or formatting, such as:

**Option 1: Add spacing**
```
// parent instuction  [6 lines] // end of parent instruction
```

**Option 2: Line break (preferred)**
```
// parent instuction  [6 lines]
// end of parent instruction
```

**Option 3: Only show first line**
```
// parent instuction  [6 lines]
```

## Impact

This issue affects:
- **Code Readability**: The concatenated text is difficult to read and understand
- **User Experience**: Confusing display makes it harder to navigate collapsed code regions
- **Professional Appearance**: The formatting looks like a rendering error rather than an intentional design

## Severity
**Medium** - This is a cosmetic/usability issue that impacts code readability but does not affect functionality.

## Suggested Fix

The code folding implementation should:
1. Add proper spacing (at least one space character) between the fold indicator and any trailing content
2. Consider showing only the opening line when collapsed, omitting the ending line
3. Or display the ending line on a new line below the fold indicator

## Additional Notes

This issue is particularly noticeable in:
- PLC Structured Text files (.st)
- Comment-heavy code sections
- Multi-line comment regions used for code organization

The issue suggests that the folding mechanism treats the ending line as part of the fold display text without considering proper text formatting rules.

---

**Reported Date:** 2026-01-22
**Status:** Open
